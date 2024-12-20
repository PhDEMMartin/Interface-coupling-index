import csv23
import numpy as np


def read_file(file_name):
    reader = csv23.open_reader(file_name)
    matrix = []
    with reader as reader:
        for row in reader:
            matrix.append(row)
    global mip_matrix
    mip_matrix = np.array(matrix, dtype=object)

    global header
    header = mip_matrix[0]

    mip_matrix = np.delete(mip_matrix, 0, axis=0)


def read_file_2(file_name_2):
    reader = csv23.open_reader(file_name_2)
    matrix_2 = []
    with reader as reader:
        for row in reader:
            matrix_2.append(row)
    global pii_matrix
    pii_matrix = np.array(matrix_2, dtype=object)

    global contacting_proteins
    contacting_proteins = pii_matrix[0]
    pii_matrix = np.delete(pii_matrix, 0, axis=0)

    for j in range(len(contacting_proteins)):
        if file[:5] == contacting_proteins[j]:
            index = j

    global pii
    pii = []

    for i in range(len(pii_matrix)):
        if pii_matrix[i][index] != '-':
            pii.append(int(pii_matrix[i][index]))
        else:
            pii.append('NA')


def retriever():
    np.zeros((len(pii), len(pii)))

    last_position = int(mip_matrix[(len(mip_matrix))-1][0])

    start = ((pii[0] * (last_position - 1))-(last_position-1))

    end = (pii[len(pii) - 1] * (last_position - 1))

    save = '{}wMIp_final_4.csv'.format(file[:5])
    f = open(save, "a")
    header_2 = '{},{},{},{},{},{},{},{},{},{}\n'.format(header[0], header[1], header[2], header[3], header[4],
                                                        header[5], header[6], header[7], header[8], header[9])
    f.write(header_2)

    for i in range(start, end):
        for j in range(len(pii)):
            for k in range(len(pii)):

                if pii[j] != 'NA' and pii[k] != 'NA':
                    if int(mip_matrix[i][0]) == int(pii[j]) and int(mip_matrix[i][1]) == int(pii[k]):

                        line = '{},{},{},{},{},{},{},{},{},{}\n'.format(mip_matrix[i][0], mip_matrix[i][1],
                                                                        mip_matrix[i][2], mip_matrix[i][3],
                                                                        mip_matrix[i][4], mip_matrix[i][5],
                                                                        mip_matrix[i][6], mip_matrix[i][7],
                                                                        mip_matrix[i][8], mip_matrix[i][9])
                        f.write(line)

                else:
                    pass

    for jj in range(0, len(pii)):
        for kk in range(0, len(pii)):
            if jj != kk:
                if pii[kk] == 'NA':
                    line = '{},{},{},{},{},{},{},{},{},{}\n'.format(pii[jj], 'NA',
                                                                    'NA', 'NA',
                                                                    'NA', 'NA',
                                                                    'NA', 'NA',
                                                                    'NA', 'NA')
                    f.write(line)
                elif pii[jj] == 'NA':
                    line = '{},{},{},{},{},{},{},{},{},{}\n'.format('NA', pii[kk],
                                                                    'NA', 'NA',
                                                                    'NA', 'NA',
                                                                    'NA', 'NA',
                                                                    'NA', 'NA')
                    f.write(line)
                else:
                    pass

    for ii in range(0, len(pii)):
        line = '{},{},{},{},{},{},{},{},{},{}\n'.format(pii[ii], pii[ii],
                                                        'NA', 'NA',
                                                        'NA', 'NA',
                                                        'NA', 'NA',
                                                        'NA', 'NA')
        f.write(line)
    f.close()


global file
file = 'QseCB__MIp_detailed_4.csv'
read_file(file)
read_file_2('pii_test.csv')
retriever()
