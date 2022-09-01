import csv23
import numpy as np
from Bio.PDB import *

heterodimer_name = 'HK885 RR426'
heterodimer_pdb = '3DGE.pdb'


def read_pdb():
    parser = PDBParser()
    global structure
    structure = parser.get_structure(heterodimer_name, heterodimer_pdb)


def aa_min_distance_backbone():
    residues = structure.get_residues()
    res_list = Selection.unfold_entities(structure, "R")
    interface_residues = [260, 263, 266, 267, 268, 270, 271, 272, 274, 275, 278, 279, 282, 283, 287, 290, 291, 294, 298,
                          387, 437, 438, 439, 493, 494, 495, 497, 498, 501, 502, 505, 536, 537, 538, 565, 586, 587, 588,
                          589, 590, 591]

    aa_atoms = [['ALA', ['CA', 'CB']], ['CYS', ['CA', 'CB', 'SG']], ['ASP', ['CA', 'CB', 'CG', 'OD1', 'OD2']],
                ['GLU', ['CA', 'CB', 'CG', 'CD', 'OE1', 'OE2']], ['GLY', ['CA']], ['SER', ['CA', 'CB', 'OG']],
                ['ARG', ['CA', 'CB', 'CG', 'CD', 'NE', 'CZ', 'NH1', 'NH2']], ['LYS', ['CA', 'CB', 'CG', 'CD', 'CE', 'NZ']],
                ['PHE', ['CA', 'CB', 'CG', 'CD1', 'CD2', 'CE1', 'CE2', 'CZ']],
                ['TYR', ['CA', 'CB', 'CG', 'CD1', 'CD2', 'CE1', 'CE2', 'CZ', 'OH']],
                ['ASN', ['CA', 'CB', 'CG', 'OD1', 'ND2']],
                ['GLN', ['CA', 'CB', 'CG', 'CD', 'OE1', 'NE2']],
                ['HIS', ['CA', 'CB', 'CG', 'ND1', 'CD2', 'CE1', 'NE2']],
                ['VAL', ['CA', 'CB', 'CG1', 'CG2']],
                ['TRP', ['CA', 'CB', 'CG', 'CD1', 'CD2', 'NE1', 'CE2', 'CE3', 'CZ2', 'CZ3', 'CH2']],
                ['PRO', ['CA', 'CB', 'CG', 'CD']],
                ['MET', ['CA', 'CB', 'CG', 'SD', 'CE']],
                ['LEU', ['CA', 'CB', 'CG', 'CD1', 'CD2']],
                ['THR', ['CA', 'CB', 'OG1', 'CG2']],
                ['ILE', ['CA', 'CB', 'CG1', 'CG2', 'CD1']]]

    residues = [r for r in structure.get_residues()]

    save = '{}_PII.csv'.format(heterodimer_name)
    f = open(save, "a")
    f.write('aa_x,x,ba_x,aa_y,y,ba_y,dis\n')

    interface_aa_subunitA = 23

    for i in range(0, (interface_aa_subunitA)):
        for j in range(interface_aa_subunitA+1, len(interface_residues)):

            PDB_entry_start = 245
            PDB_subunit_end = 481
            non_aa_entries = 38

            x = interface_residues[i] - PDB_entry_start
            y = (interface_residues[j] + non_aa_entries) - PDB_entry_start

            aa_name_1 = str(residues[x])[9:12]
            aa_name_2 = str(residues[y])[9:12]

            min_distance = 100
            for k1 in range(len(aa_atoms)):
                if aa_atoms[k1][0] == aa_name_1:

                    for k2 in range(len(aa_atoms)):
                        if aa_atoms[k2][0] == aa_name_2:

                            for i2 in range(len(aa_atoms[k1][1])):
                                for j2 in range(len(aa_atoms[k2][1])):

                                    alpha_carbon_1 = residues[x][aa_atoms[k1][1][i2]]
                                    alpha_carbon_2 = residues[y][aa_atoms[k2][1][j2]]

                                    distance = alpha_carbon_1 - alpha_carbon_2

                                    if min_distance > distance:

                                        min_distance = distance

                                        min_aa_1 = aa_name_1
                                        min_aa_pos_1 = x + PDB_entry_start
                                        min_aa_atom_1 = aa_atoms[k1][1][i2]

                                        min_aa_2 = aa_name_2
                                        min_aa_pos_2 = ((y - non_aa_entries) + PDB_entry_start) - PDB_subunit_end
                                        min_aa_atom_2 = aa_atoms[k2][1][j2]

            line = '{},{},{},{},{},{},{}\n'.format(min_aa_1, min_aa_pos_1, min_aa_atom_1, min_aa_2,
                                                                   min_aa_pos_2, min_aa_atom_2, min_distance)
            f.write(line)
    f.close()


def min_value():
    reader = csv23.open_reader('{}_PII.csv'.format(heterodimer_name))
    matrix = []
    with reader as reader:
        for row in reader:
            matrix.append(row)
    matrix.pop(0)
    matrix = np.array(matrix)

    min = 100
    for i in range(len(matrix)):
        if float(matrix[i][6]) < min and float(matrix[i][6]) != 0:
            min = float(matrix[i][6])
            x = matrix[i][1]
            y = matrix[i][4]

    print('Interface amino acid pair positions minimum distance {}, {} dis={}nm '.format(int(x), int(y), round(min, 5)))


if __name__ == '__main__':
    read_pdb()
    aa_min_distance_backbone()
    min_value()
