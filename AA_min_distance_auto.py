import csv23
import numpy as np
import os
from Bio.PDB import *
from MII_MSA_retriever import main as msa_offset

name_1 = 'PhoR'
name_2 = 'PhoB'
heterodimer_name = 'PhoRB2_21'
#heterodimer_pdb = 'PhoRB2_trj_21.pdb'
interface_residues = [213, 216, 217, 220, 221, 223, 224, 225, 227, 228, 441, 443, 444, 447, 450, 451, 454, 484, 513,
                      515, 534, 535, 536, 537, 538, 539]


def read_pdb(heterodimer_name):
    parser = PDBParser()
    global structure
    structure = parser.get_structure(f'{heterodimer_name}', f'{heterodimer_name}.pdb')
    chains = Selection.unfold_entities(structure, "C")
    chains = [chain.id for chain in chains]
    subunit_strt_res = {}
    for chain in chains:
        subunit_strt_res[chain] = None
    for item in subunit_strt_res:
        subunit_strt_res[item] = structure[0][item].get_list()[0].get_id()[1]
    return structure


def aa_min_distance_backbone(heterodimer_name, parental_directory, new_folder, interface_residues, structure, name_1, name_2):
    residues = structure.get_residues()
    res_list = Selection.unfold_entities(structure, "R")

    os.chdir(f'{parental_directory}\\{new_folder}')

    aa_atoms = {'ALA': ['CA', 'CB'],
                'CYS': ['CA', 'CB', 'SG'],
                'ASP': ['CA', 'CB', 'CG', 'OD1', 'OD2'],
                'GLU': ['CA', 'CB', 'CG', 'CD', 'OE1', 'OE2'],
                'GLY': ['CA'],
                'SER': ['CA', 'CB', 'OG'],
                'ARG': ['CA', 'CB', 'CG', 'CD', 'NE', 'CZ', 'NH1', 'NH2'],
                'LYS': ['CA', 'CB', 'CG', 'CD', 'CE', 'NZ'],
                'PHE': ['CA', 'CB', 'CG', 'CD1', 'CD2', 'CE1', 'CE2', 'CZ'],
                'TYR': ['CA', 'CB', 'CG', 'CD1', 'CD2', 'CE1', 'CE2', 'CZ', 'OH'],
                'ASN': ['CA', 'CB', 'CG', 'OD1', 'ND2'],
                'GLN': ['CA', 'CB', 'CG', 'CD', 'OE1', 'NE2'],
                'HIS': ['CA', 'CB', 'CG', 'ND1', 'CD2', 'CE1', 'NE2'],
                'VAL': ['CA', 'CB', 'CG1', 'CG2'],
                'TRP': ['CA', 'CB', 'CG', 'CD1', 'CD2', 'NE1', 'CE2', 'CE3', 'CZ2', 'CZ3', 'CH2'],
                'PRO': ['CA', 'CB', 'CG', 'CD'],
                'MET': ['CA', 'CB', 'CG', 'SD', 'CE'],
                'LEU': ['CA', 'CB', 'CG', 'CD1', 'CD2'],
                'THR': ['CA', 'CB', 'OG1', 'CG2'],
                'ILE': ['CA', 'CB', 'CG1', 'CG2', 'CD1']
                }
    # The delta carbon from ILE in normal PDBs is CD1 in the PDBs constructed by GROMACS is CD
    residues = [r for r in structure.get_residues()]

    index = {f'{key}_{value[0]}': idx for idx, (key, value) in enumerate(interface_residues.items())}

    dis_matrix = np.zeros((len(interface_residues), len(interface_residues)), float)

    def adjust_ile_atoms_dynamically(atom_name):
        """
        Dynamically adjust the atom name from 'CD1' to 'CD' or vice versa if an error occurs.
        """
        if atom_name == 'CD1':
            return 'CD'
        elif atom_name == 'CD':
            return 'CD1'
        return atom_name

    with open(f'{name_1}_{name_2}_{heterodimer_name.split("_")[2]}_MII.csv', 'w+') as f:
        f.write('aa_x,\tx,\tba_x,\taa_y,\ty,\tba_y,\tdis\n')
        for i in interface_residues:
            for j in interface_residues:

                aa_name_1 = structure[0][interface_residues[i][0]][int(i)].get_resname()
                aa_name_2 = structure[0][interface_residues[j][0]][int(j)].get_resname()

                min_distance = 100

                for i2 in aa_atoms[aa_name_1]:
                    for j2 in aa_atoms[aa_name_2]:

                        try:
                            # Attempt to access the atoms

                            alpha_carbon_1 = structure[0][interface_residues[i][0]][int(i)][i2]
                            alpha_carbon_2 = structure[0][interface_residues[j][0]][int(j)][j2]
                            distance = alpha_carbon_1 - alpha_carbon_2

                        # Compute the distance or any further operations
                        except KeyError:
                            # Handle atom name mismatch dynamically


                            # Adjust atom names for ILE dynamically
                            if aa_name_1 == 'ILE':
                                print(f"Error with atom {i2} from {aa_name_1} and {j2} from {aa_name_2}, "
                                      f"attempting to adjust.")
                                i2 = adjust_ile_atoms_dynamically(i2)
                            if aa_name_2 == 'ILE':
                                print(f"Error with atom {j2} from {aa_name_2} and {i2} from {aa_name_1}, "
                                      f"attempting to adjust.")
                                j2 = adjust_ile_atoms_dynamically(j2)

                        try:
                            # Retry with adjusted atom names
                            alpha_carbon_1 = structure[0][interface_residues[i][0]][int(i)][i2]
                            alpha_carbon_2 = structure[0][interface_residues[j][0]][int(j)][j2]
                            distance = alpha_carbon_1 - alpha_carbon_2

                            # Compute the distance or any further operations
                        except KeyError:
                            print(f"Adjustment failed for atoms {i2} or {j2}. Skipping.")

                        if min_distance > distance:

                            min_distance = distance

                            min_aa_1 = aa_name_1
                            min_aa_pos_1 = i
                            min_aa_atom_1 = i2

                            min_aa_2 = aa_name_2
                            min_aa_pos_2 = j
                            min_aa_atom_2 = j2

                one = f'{i}_{interface_residues[i][0]}'
                two = f'{j}_{interface_residues[j][0]}'

                dis_matrix[index[one]][index[two]] = dis_matrix[index[two]][index[one]] = float(min_distance)
                line = (f'{min_aa_1},\t{min_aa_pos_1},\t{min_aa_atom_1},\t{min_aa_2},\t{min_aa_pos_2},'
                        f'\t{min_aa_atom_2},\t{round(min_distance,5)}\n')
                f.write(line)
        f.close()

    min_dis_file = f'{name_1}_{name_2}_min_dis_all.txt'

    time_slice = int(heterodimer_name.split('_')[2])

    if time_slice <= 1 and os.path.exists(f'{parental_directory}\\{new_folder}\\{min_dis_file}'):
        tag = 'w'
    else:
        tag = 'a+'

    md = 1000
    md_pos = [None, None]
    for column in index:
        for row in index:
            if column.split('_')[1] != row.split('_')[1]:
                if dis_matrix[index[column]][index[row]] < md:
                    md = dis_matrix[index[column]][index[row]]
                    md_pos = [column, row]

    with open(f'{min_dis_file}', tag) as writer_1:
        if tag == 'w':
            writer_1.write('slice\tx\ty\tmin_dis\n')
        to_write = f'{time_slice}\t{md_pos[0]}\t{md_pos[1]}\t{round(md, 5)} Å\n'
        writer_1.write(to_write)

    with open(f'{name_1}_{name_2}_{heterodimer_name.split("_")[2]}_indx.txt', 'w') as handle_1:
        for item in index:
            line = f'{item}: {index[item]}\t'
            handle_1.write(line)

    np.save(f'{name_1}_{name_2}_{heterodimer_name.split("_")[2]}_dis_mtrx.npy', dis_matrix)
    
    index_msa_corrected = msa_offset(name_1, name_2, index)

    with open(f'{name_1}_{name_2}_MSA_index_corrected.txt', 'w') as handle_2:
        for each in index_msa_corrected:
            handle_2.write(f'{each}\t{index_msa_corrected[each][0]}\n')

    with open(f'{parental_directory}\\{name_1}_{name_2}_MIp_detailed.csv', 'r+') as reader:
        lines = reader.readlines()

    with open(f'{name_1}_{name_2}_{heterodimer_name.split("_")[2]}_MII_ICI.csv', 'w') as writer:
        writer.write('aa_x,aa_y,pos_x,pos_y,h_x,h_y,h_xy,MI,APC,MIp,w,wMip,dis,amd,ici\n')
        for read in lines:
            read = read.strip().split(',')
            for ii, jj in index_msa_corrected.items():
                if read[0] == 'aa_x':
                    break
                if jj[0] == int(read[0]):
                    for k, l in index_msa_corrected.items():
                        if l[0] == int(read[1]):
                            min_dis = dis_matrix[index[ii]][index[k]]
                            amd = min_dis / md
                            ici = round(float(read[-1]) / amd, 5)
                            writer.write(f'{ii},{k},{read[0]},{read[1]},{read[2]},{read[3]},{read[4]},{read[5]},'
                                         f'{read[6]},{read[7]},{read[8]},{read[9]},{min_dis},{amd},{ici}\n')

    os.chdir(f'{parental_directory}')


def min_value():
    reader = csv23.open_reader('{}_MII.csv'.format(heterodimer_name))
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


def main(heterodimer_name, interface_residues, name_1, name_2, new_folder):
    parental_directory = os.getcwd()
    structure = read_pdb(heterodimer_name)
    aa_min_distance_backbone(heterodimer_name, parental_directory, new_folder, interface_residues, structure, name_1, name_2)


if __name__ == '__main__':
    main(heterodimer_name, interface_residues, name_1, name_2, new_folder)
