from Bio import AlignIO
import os

# Static data declarations
index = {'249_A': 0, '257_A': 1, '259_A': 2, '252_A': 3, '255_A': 4, '253_A': 5, '256_A': 6, '415_A': 7, '418_A': 8,
         '422_A': 9, '412_A': 10, '411_A': 11, '288_A': 12, '281_A': 13, '274_A': 14, '261_A': 15, '264_A': 16,
         '263_A': 17, '260_A': 18, '267_A': 19, '268_A': 20, '8_B': 21, '9_B': 22, '10_B': 23, '12_B': 24, '53_B': 25,
         '55_B': 26, '56_B': 27, '31_B': 28, '22_B': 29, '11_B': 30, '15_B': 31, '14_B': 32, '18_B': 33, '81_B': 34,
         '80_B': 35, '82_B': 36, '106_B': 37, '103_B': 38, '104_B': 39, '105_B': 40, '101_B': 41, '102_B': 42}

modeled_sequences = {
    'QseC_QseB': ['AWG95492', 458],
    'CpxA_CpxR': ['AWG95045', 466],
    'NarQ_NarP': ['AWG94880', 571],
    'PhoR_PhoB': ['AWG95686', 430]
}

App_ref_sequences = {
    'QseC_QseB': 'YP_001053761',
    'CpxA_CpxR': 'YP_001968467',
    'NarQ_NarP': 'SKA55008',
    'PhoR_PhoB': 'UKH35221'
}

folder_path = 'C:\\Users\\faits\\Documents\\GitHub\\MIp_new'


def process_alignment(filename, term, modeled_seq_key, index):
    """
    Process a single alignment file to extract positions and aligned sequences.
    """
    file_path = os.path.join(folder_path, filename)
    alignment = AlignIO.read(file_path, 'fasta')
    modeled_seq_id, seq_offset = modeled_sequences[modeled_seq_key]

    counter = 0

    for sequence in alignment:
        if App_ref_sequences[modeled_seq_key] in sequence.id:
            break
        else:
            counter += 1

    for sequence in alignment:
        if modeled_seq_id in sequence.id:
            alignment_true_pos = calculate_alignment_positions(sequence.seq, modeled_seq_key, seq_offset, index)
            ref_sequence_app = map_reference_positions(alignment[counter].seq, alignment_true_pos)
            # APPARENTLY THE BUG HAS BEEN FIXED BY USING THE CORRECT APP REFSEQ AS PARAMETER INTRODUCED IN LINES 36:42
            return alignment_true_pos, ref_sequence_app
    return {}, {}


def calculate_alignment_positions(sequence, modeled_seq_key, seq_offset, index):
    """
    Calculate alignment positions for a specific sequence.
    """
    alignment_true_pos = {}
    gap_counter = pos_counter = 0

    for aa in sequence:
        true_pos = pos_counter - gap_counter
        for int_aa in index:
            original_pos, chain = int_aa.split('_')
            original_pos = int(original_pos)
            corrected_pos = original_pos + (seq_offset if chain == 'B' else 0)
            if corrected_pos == true_pos + 1:
                alignment_true_pos[int_aa] = [pos_counter + 1, aa, sequence[pos_counter]]
        if aa == '-':
            gap_counter += 1
        pos_counter += 1

    return alignment_true_pos


def map_reference_positions(ref_sequence, alignment_true_pos):
    """
    Map positions from the reference sequence to alignment positions.
    """
    ref_sequence_app = {}
    gap_counter = pos_counter = 0

    for aa in ref_sequence:
        true_pos = pos_counter - gap_counter
        for int_aa, pos_info in alignment_true_pos.items():
            if pos_info[0] == pos_counter + 1:
                ref_sequence_app[int_aa] = [true_pos + 1, pos_counter + 1, aa]
        if aa == '-':
            gap_counter += 1
        pos_counter += 1

    return ref_sequence_app


def extract_original_msa_positions(name_1, name_2, ref_sequence_app, filename):
    """
    Extract original MSA positions for mapping.
    """
    original_msa_pos = {}
    gap_counter = pos_counter = 0

    file_path = os.path.join(folder_path, filename)
    alignment = AlignIO.read(file_path, 'fasta')

    for sequence in alignment:
        if App_ref_sequences[f'{name_1}_{name_2}'] in sequence.id:
            for aa in sequence.seq:
                true_pos = pos_counter - gap_counter
                for int_aa, ref_pos_info in ref_sequence_app.items():
                    if ref_pos_info[0] == true_pos + 1:
                        original_msa_pos[int_aa] = [pos_counter + 1, aa]
                if aa == '-':
                    gap_counter += 1
                pos_counter += 1
            break

    return original_msa_pos


def read_fa_files(name_1, name_2, index):
    term = f'{name_1}_{name_2}_2024_msa_NR_App'
    term_2 = f'{name_1}_{name_2}_2024_msa_NR.fa'

    for filename in os.listdir(folder_path):
        if filename.endswith('.fa') and term in filename:
            alignment_true_pos, ref_sequence_app = process_alignment(filename, term, f'{name_1}_{name_2}', index)

            # If successfully processed, extract original MSA positions
            if alignment_true_pos and ref_sequence_app:
                for filename_2 in os.listdir(folder_path):
                    if filename_2.endswith('.fa') and term_2 in filename_2:
                        original_msa_pos = extract_original_msa_positions(name_1, name_2, ref_sequence_app, filename_2)
                        # You can now return or work with original_msa_pos as needed
                        return original_msa_pos


def main(name_1, name_2, index):

    original_msa_positions = read_fa_files(name_1, name_2, index)

    # Further processing of original_msa_positions if needed
    if original_msa_positions:
        print("Original MSA positions successfully retrieved.")
        return original_msa_positions
        # Do something with original_msa_positions, e.g., saving or analysis
    else:
        print("No data found or an error occurred.")


if __name__ == "__main__":
    name_1 = 'QseC'
    name_2 = 'QseB'
    main(name_1, name_2, index)

