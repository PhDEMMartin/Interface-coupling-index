from Bio import AlignIO, SeqIO

file = 'NarQP_NR_concatenated_alignment_2.fa'


def alignment_read():
    global file
    records = []
    alignment = AlignIO.read(file, "fasta")

    with open('C:\\Users\\faits\Documents\\GitHub\\Miniproyecto\\SDMCEII\\NarQNarP_operon_CD_leg.txt', 'r+') as handle:
        for record in handle:
            record = record.split('\t')[0]
            record = record.strip()
            record = record.split('|')[1]
            records.append(record)

    occurrence = {}
    missing = []

    with open('NarQP_cleaned.fa', 'w+') as handle_1:
        for sequence in alignment:
            ID = sequence.id
            ID = ID.split('|')[1]
            for record in records:
                occurrence[ID] = 0
                occurrence[ID] += 1
                if record == ID:
                    if occurrence[ID] == 1:
                        sequence = SeqIO.FastaIO.as_fasta(sequence)
                        handle_1.write(sequence)
                    break

    for record in records:
        if record not in occurrence:
            missing.append(record)

    with open('NarQP_missing.txt', 'w+') as handle_2:
        for item in missing:
            handle_2.write('%s\n' % item)



def main():
    alignment_read()


if __name__ == "__main__":
    main()
