from Bio import AlignIO
import numpy as np
import math
import os


def check_and_create_filename(base_name, extension):
    counter = 2
    filename = f'{base_name}.{extension}'
    while os.path.exists(filename):
        filename = f'{base_name}_{counter}.{extension}'
        counter += 1
    return filename


def mutual_information_p(file, name_1, name_2):
    AAindex = {aa: i for i, aa in enumerate("ACDEFGHIKLMNPQRSTVWY-")}
    alignments = list(AlignIO.parse(open(file, "r+"), "fasta"))
    alignment = alignments[0]

    seq_len = alignment.get_alignment_length()
    num_seqs = len(alignment)

    countresults = np.zeros((seq_len, 21), int)
    probabilities = np.zeros((seq_len, 20), float)
    shannonentropies = np.zeros((seq_len, 20))
    totalentropies = np.zeros(seq_len)

    for col in range(seq_len):
        column_seq = alignment[:, col]
        for aa, idx in AAindex.items():
            countresults[col, idx] = column_seq.count(aa)

    for col in range(seq_len):
        gap_count = countresults[col, 20]
        effective_len = num_seqs - gap_count
        probabilities[col, :20] = countresults[col, :20] / effective_len

    for col in range(seq_len):
        for aa in range(20):
            if probabilities[col, aa] > 0.0:
                shannonentropies[col, aa] = -probabilities[col, aa] * math.log(probabilities[col, aa], 20)

    totalentropies = shannonentropies.sum(axis=1)

    def jointProb(pos1, pos2):
        JFM = np.zeros((21, 21), int)
        sequence1 = alignment[:, pos1]
        sequence2 = alignment[:, pos2]

        for aa1, aa2 in zip(sequence1, sequence2):
            JFM[AAindex[aa1], AAindex[aa2]] += 1

        JFS = JFM.sum() - JFM[20, :].sum() - JFM[:, 20].sum() + JFM[20, 20]
        JPM = JFM / JFS if JFS != 0 else np.zeros_like(JFM)

        JEM = np.zeros((20, 20))
        for i in range(20):
            for j in range(20):
                if JPM[i, j] > 0:
                    JEM[i, j] = -JPM[i, j] * math.log(JPM[i, j], 20)

        JEMS = JEM.sum()
        return JEMS, JFS

    MImatrix1 = np.zeros((seq_len, seq_len))
    weight_matrix = np.zeros((seq_len, seq_len))
    joint_entropy = np.zeros((seq_len, seq_len))

    for i in range(seq_len - 1):
        for j in range(i + 1, seq_len):
            X = jointProb(i, j)
            mutualinformation = totalentropies[i] + totalentropies[j] - X[0]
            MImatrix1[i, j] = MImatrix1[j, i] = mutualinformation
            weight = X[1] / num_seqs
            weight_matrix[i, j] = weight_matrix[j, i] = weight
            joint_entropy[i, j] = joint_entropy[j, i] = X[0]

    mi_matrix_file = check_and_create_filename(f'{name_1}_{name_2}_MI_matrix', 'csv')
    np.savetxt(mi_matrix_file, MImatrix1, delimiter=",", fmt='%s')

    MIbmatrix = np.zeros(seq_len)
    for i in range(seq_len):
        MI = 0
        counter_position = 0
        for j in range(seq_len):
            if i != j:
                MI += MImatrix1[i, j]
                if MImatrix1[i, j] != 0 or MImatrix1[i, j] != 0.0:
                    counter_position += 1
        if counter_position == 0:
            MIbmatrix[i] = 0
        else:
            MIbmatrix[i] = MI / counter_position

    # MImean = np.triu(MImatrix1, k=1).sum() / ((seq_len * (seq_len - 1)) / 2)
    MImean = MImatrix1[np.triu_indices(seq_len, 1)].sum() / np.count_nonzero(MImatrix1[np.triu_indices(seq_len, 1)])

    APCmatrix = np.outer(MIbmatrix, MIbmatrix) / MImean
    apc_matrix_file = check_and_create_filename(f'{name_1}_{name_2}_APC_matrix', 'csv')
    np.savetxt(apc_matrix_file, APCmatrix, delimiter=",", fmt='%s')

    MIpmatrix = MImatrix1 - APCmatrix
    mip_matrix_file = check_and_create_filename(f'{name_1}_{name_2}_MIp_matrix', 'csv')
    np.savetxt(mip_matrix_file, MIpmatrix, delimiter=",", fmt='%s')

    wMIpmatrix = MIpmatrix * weight_matrix
    wmip_matrix_file = check_and_create_filename(f'{name_1}_{name_2}_wMIp_matrix', 'csv')
    np.savetxt(wmip_matrix_file, wMIpmatrix, delimiter=",", fmt='%s')

    detailed_file = check_and_create_filename(f'{name_1}_{name_2}_MIp_detailed', 'csv')
    with open(detailed_file, "a") as f:
        f.write('aa_x,aa_y,h_x,h_y,h_xy,MI,APC,MIp,w,wMIp\n')
        for i in range(seq_len):
            for j in range(seq_len):
                if i != j:
                    f.write(f'{i + 1},{j + 1},{totalentropies[i]:.5f},{totalentropies[j]:.5f},'
                            f'{joint_entropy[i, j]:.5f},{MImatrix1[i, j]:.5f},{APCmatrix[i, j]:.5f},'
                            f'{MIpmatrix[i, j]:.5f},{weight_matrix[i, j]:.5f},{wMIpmatrix[i, j]:.5f}\n')


def main(name_1, name_2):
    file = f'{name_1}_{name_2}_2024_msa_NR.fa'
    mutual_information_p(file, name_1, name_2)


if __name__ == "__main__":
    name_1 = 'NarQ'
    name_2 = 'NarP'
    main(name_1, name_2)
