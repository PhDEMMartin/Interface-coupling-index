from Bio import AlignIO
import numpy
import math


counter = [["A", 0], ["C", 0], ["D", 0], ["E", 0], ["F", 0], ["G", 0], ['H', 0], ["I", 0], ["K", 0], ["L", 0], ["M", 0],
           ["N", 0], ["P", 0], ["Q", 0], ["R", 0], ["S", 0], ["T", 0], ["V", 0], ["W", 0], ["Y", 0], ["Gap", 0]]

countresults = []
probabilities = []
shannonentropies = []
totalentropies = []

aminoacids = ["Ala", "Cys", "Glu", "Asp", "Phe", "Gly", "His", "Iso", "Lys", "Leu", "Met", "Asn", "Pro", "Gln", "Arg",
              "Ser", "Thr", "Val", "Trp", "Tyr", "Gap"]

file = 'NarQP_NR_concatenated_alignment_2.fa'

alignments = AlignIO.parse(open(file, "r+"), "fasta")

for alignment in alignments:
    print(alignment)

print("longitud de las secuencias:", str(alignment.get_alignment_length()))

i = 0

for loop in range(0, alignment.get_alignment_length()):  # Recorrer las columnas

    positions = alignment[:, i]  # Asigna la cadena correspondiente a la columna actual

    # COMIENZAN CONTEOS POR IDENTIDAD POR COLUMNA
    counter[0][1] = positions.count('A')
    counter[1][1] = positions.count('C')
    counter[2][1] = positions.count('D')
    counter[3][1] = positions.count('E')
    counter[4][1] = positions.count('F')
    counter[5][1] = positions.count('G')
    counter[6][1] = positions.count('H')
    counter[7][1] = positions.count('I')
    counter[8][1] = positions.count('K')
    counter[9][1] = positions.count('L')
    counter[10][1] = positions.count('M')
    counter[11][1] = positions.count('N')
    counter[12][1] = positions.count('P')
    counter[13][1] = positions.count('Q')
    counter[14][1] = positions.count('R')
    counter[15][1] = positions.count('S')
    counter[16][1] = positions.count('T')
    counter[17][1] = positions.count('V')
    counter[18][1] = positions.count('W')
    counter[19][1] = positions.count('Y')
    counter[20][1] = positions.count('-')

    current_results = [i, counter[0][1], counter[1][1], counter[2][1], counter[3][1], counter[4][1], counter[5][1],
                       counter[6][1], counter[7][1], counter[8][1], counter[9][1], counter[10][1], counter[11][1],
                       counter[12][1], counter[13][1], counter[14][1], counter[15][1], counter[16][1], counter[17][1],
                       counter[18][1], counter[19][1], counter[20][1]]

    countresults.append(current_results)  # Agrega por columna los valores del conteo a una lista

    i = i + 1

print("-------------- F R E Q U E N C I E S ------------------\nDone")

probabilities = countresults
total = 0
k = 1
l = 0

for i in range(0, alignment.get_alignment_length()):

    for j in range(1, 21):

        probabilities[i][j] = countresults[i][j] / (len(alignment[:, 0]) - countresults[i][21])

print("-------------- P R O B A B I L I T I E S ------------------\nDone")

shannonentropies = probabilities
m = 0
n = 0

for element in probabilities:

    for loop in range(1, 21):
        # print('m', m)
        # print('n', n)
        if element[m] == 0.0:
            shannonentropies[n][m] = 0

        elif element[m] == 0:
            shannonentropies[n][m] = 0

        # elif element[m] == 1.0:                                                   #Gets rid of the negative zero
        #     shannonentropies[n][m] = 0

        else:
            shannonentropies[n][m] = (-1 * element[m] * (math.log(element[m], 20)))  # Returns entropy for each position

        m = m + 1

    m = 1
    n = n + 1

print("-------------- E N T R O P I E S ------------------\nDone")

k = 0
totalentropy = 0

for result in shannonentropies:

    for loop in range(1, 21):
        # print('k', k)
        totalentropy = totalentropy + result[k]
        k = k + 1

    totalentropies.append([shannonentropies.index(result), totalentropy])
    totalentropy = 0
    k = 1

print("-------------- T O T A L  E N T R O P I E S ------------------\nDone")

AAindex = [["A", 0], ["C", 1], ["D", 2], ["E", 3], ["F", 4], ["G", 5], ['H', 6], ["I", 7],
           ["K", 8], ["L", 9], ["M", 10], ["N", 11], ["P", 12], ["Q", 13], ["R", 14], ["S", 15],
           ["T", 16], ["V", 17], ["W", 18], ["Y", 19], ["-", 20]]


def jointProb(posicion1, posicion2):
    JFM = numpy.zeros((len(AAindex), len(AAindex)), int)  # JFM (Joint Frequency matrix) Crea un
    # arreglo de matriz de tamano igual al numero de identidades posibles en una posición dada
    JFSM = numpy.zeros(((len(AAindex))-1, (len(AAindex))-1), int)  # JFSM (Joint Frequency summation matrix)
    JPM = numpy.zeros((len(AAindex), len(AAindex)))  # Creates a matrix of size equal to identities in
    # alignment´s position
    JEM = numpy.zeros(((len(AAindex) - 1), (len(AAindex)) - 1))  # Creates a matrix of size equal to identities in

    sequence1 = alignment[:, posicion1]
    sequence2 = alignment[:, posicion2]

    AAn = 0

    for i in range(0, len(alignment)):
        for j in range(0, len(AAindex)):
            for k in range(0, len(AAindex)):
                if sequence1[i] == AAindex[j][0]:

                    if sequence2[i] == AAindex[k][0]:

                        AAn = JFM[AAindex[j][1]][AAindex[k][1]] + 1
                        JFM[AAindex[j][1]][AAindex[k][1]] = AAn

    for i2 in range((len(JFM))-1):
        for j2 in range((len(JFM))-1):
            JFSM[i2, j2] = JFM[i2, j2]

    JFS = JFSM.sum()
    if JFS != 0:
        numpy.divide(JFM, JFS, JPM)
    else:
        JFSM = JPM

    e = 0

    for i3 in range(0, (len(AAindex) - 1)):
        for j3 in range(0, (len(AAindex) - 1)):

            if JPM[i3, j3] != 0:

                e = (-1 * JPM[i3, j3] * (math.log(JPM[i3, j3], 20)))    # Cálculo de la entropía para cada elemento
                # de cada posición
                JEM[i3, j3] = e

    JEMS = JEM.sum()  # Calculates the sum of the matrix of joint entropy

    values = [JEMS, JFS]
    return values


MImatrix1 = numpy.zeros((len(alignment[0]), len(alignment[0])))  # Crea un arreglo de matriz de tamano igual al numero
                                                                 # de columnas del alineamiento
weight_matrix = numpy.zeros((len(alignment[0]), len(alignment[0])))

joint_entropy = numpy.zeros((len(alignment[0]), len(alignment[0])))

for i in range(0, (len(alignment[0])-1)):
    for j in range(i+1, len(alignment[0])):
        X = jointProb(i, j)
        mutualinformation = totalentropies[i][1] + totalentropies[j][1] - X[0]
        MImatrix1[i, j] = mutualinformation  # deposita los valores de la matriz superior
        MImatrix1[j, i] = mutualinformation  # deposita los valores de la matriz inferior

        weight = X[1] / len(alignment)
        weight_matrix[i, j] = weight
        weight_matrix[j, i] = weight

        joint_entropy[i, j] = X[0]
        joint_entropy[j, i] = X[0]


save = '{}_MI_matrix_4.csv'.format(file[:6])
numpy.savetxt(save, MImatrix1, delimiter=",", fmt='%s')  # crea un csv de la matriz

print("-------------- M U T U A L  I N F O R M A T I O N ------------------\nDone")

MI = 0
MIb = 0
MIbmatrix = []
n = len(alignment[0])
m = ((len(alignment[0])) - 1)
counter_position = 0

for i in range(0, n):
    for j in range(0, n):

        if i != j:

            MI = MImatrix1[i, j] + MI  # Hace la sumatoria de todos las posiciones excepto consigo mismo
            if MImatrix1[i, j] != 0:
                counter_position = counter_position + 1

    if counter_position == 0:
        MIb = 0
    else:
        MIb = (MI / counter_position)  # Saca el promedio de cada columna

    MIbmatrix.append(MIb)  # Deposita el valor de cada columna en una lista
    MI = 0  # Resetea a cero la sumatoria de todas la posiciones
    counter_position = 0


MImean = 0
MIsum = 0
counter_total = 0

for i in range(0, n):

    for j in range(i+1, n):

        MIsum = MImatrix1[i, j] + MIsum  # calcula la sumatoria de los valores de informacion mutua
        if MImatrix1[i, j] != 0:
            counter_total = counter_total + 1

if counter_total == 0:
    MImean = 0
else:
    MImean = MIsum/counter_total

APCmatrix = numpy.zeros((len(alignment[0]), len(alignment[0])))
APC = 0


for i in range(0, n):
    for j in range(0, n):
        if i != j and MIbmatrix[i] != 0 and MIbmatrix[j] != 0:

            APC = ((MIbmatrix[i]) * (MIbmatrix[j])) / MImean
            APCmatrix[i, j] = APC
            APCmatrix[j, i] = APC

save = '{}_APC_matrix_4.csv'.format(file[:6])
numpy.savetxt(save, APCmatrix, delimiter=",", fmt='%s')  # crea un csv de la matriz

print("-------------- A V E R A G E  P R O D U C T  C O R R E C T I O N ------------------\nDone")



MIp = 0
MIpmatrix = numpy.zeros((len(alignment[0]), len(alignment[0])))

for i in range(0, n):
    for j in range(0, n):

        MIp = MImatrix1[i, j] - APCmatrix[i, j]

        MIpmatrix[i, j] = MIp
        MIpmatrix[j, i] = MIp
save = '{}_MIp_matrix_4.csv'.format(file[:6])
numpy.savetxt(save, MIpmatrix, delimiter=";", fmt='%s')  # crea un csv de la matriz

print("-------------- M I p ------------------\nDone")

wMIp = 0
wMIpmatrix = numpy.zeros((len(alignment[0]), len(alignment[0])))

for i in range(0, n):
    for j in range(0, n):

        wMIp = MIpmatrix[i, j] * weight_matrix[i, j]

        wMIpmatrix[i, j] = wMIp
        wMIpmatrix[j, i] = wMIp
save = '{}_wMIp_matrix_4.csv'.format(file[:6])
numpy.savetxt(save, wMIpmatrix, delimiter=";", fmt='%s')  # crea un csv de la matriz

print("-------------- w M I p ------------------\nDone")

print('Processing output file')

save = '{}_MIp_detailed_4.csv'.format(file[:6])
f = open(save, "a")
f.write('aa_x;aa_y;h_x;h_y;h_xy;MI;APC;MIp;w;wMIp\n')

for i in range(len(alignment[0])):
    for j in range(len(alignment[0])):
        if i != j:
            line = '{};{};{};{};{};{};{};{};{};{}\n'.format(i+1, j+1, round(totalentropies[i][1], 5),
                                                            round(totalentropies[j][1], 5),
                                                            round(joint_entropy[i, j], 5),
                                                            round(MImatrix1[i, j], 5),
                                                            round(APCmatrix[i, j], 5),
                                                            round(MIpmatrix[i, j], 5),
                                                            round(weight_matrix[i, j], 5),
                                                            round(wMIpmatrix[i, j], 5))
            f.write(line)
f.close()
