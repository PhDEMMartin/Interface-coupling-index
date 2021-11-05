import csv23
import numpy as np


def read_file(file_name):
    reader = csv23.open_reader(file_name)
    matrix = []
    with reader as reader:
        for row in reader:
            matrix.append(row)

    matrix = np.array(matrix, dtype=object)

    matrix = np.delete(matrix, 0, axis=0)
    matrix = np.delete(matrix, 0, axis=1)

    return matrix


def retriever(file_name):

    AA_pairs = []

    matrix = read_file(file_name)
    for i in range(len(matrix)):
        for j in range(len(matrix)):
            if matrix[i, j] != 'NA':
                if float(matrix[i, j]) > 0.071687722:
                    y = round(float(matrix[i, j]), 5)
                    x = [int(i+1), int(j+1), y]
                    AA_pairs.append(x)

    save = '{}_matrix.txt'.format(file_name[:10])
    np.savetxt(save, AA_pairs, delimiter=",", fmt='%s')


files = ['PhoRBCpxAR_sdwMIp.csv', 'PhoRBNarQP_sdwMIp.csv', 'PhoRBQseCB_sdwMIp.csv',
         'CpxARNarQP_sdwMIp.csv', 'CpxARQseCB_sdwMIp.csv', 'NarQPQseCB_sdwMIp.csv']


for k in range(len(files)):
    retriever(files[k])
