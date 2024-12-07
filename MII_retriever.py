import subprocess
import os
import re
import numpy as np
from AA_min_distance_auto import main as min_dis


def interface_reader(log_path, log_file):
    save_file = log_file.split('.')[0]
    save_file = f'{save_file}.txt'
    interface_res = {}
    with open(log_path, 'r') as x:
        with open(save_file, 'w') as handle:
            for line in x:
                line = line.strip()
                if re.match(r'/[A-Z] ', line):
                    line = line.split(' ')
                    value = line[3]
                    value = value.split('<')[0]
                    if float(value) > 15.0:
                        subunit = line[0].split('/')[1]
                        aa = line[1]
                        pos = line[2]
                        interface_res[pos] = [subunit, aa, value]
                        handle.write(f'{subunit}\t{aa}\t{pos}\t{value}\n')
    sorted_interfaces = dict(sorted(interface_res.items(), key=lambda item: (item[1][0], int(item[0]))))
    return sorted_interfaces


def create_buriedarea_file(pdb_file, log_file):
    pdb_path = os.path.join(parent_dir, pdb_file)

    log_path = os.path.join(os.path.join(parent_dir, new_folder), log_file)

    if not os.path.exists(pdb_path):
        print(f"Error: PDB file '{pdb_path}' does not exist.")
        return


    # ChimeraX commands to open the PDB file, measure buried area, and save the log
    chimerax_commands = f"""
    open "{pdb_path}"
    measure buriedarea /A withAtoms2 /B listResidues true
    log save "{log_path}"
    close all
    exit
    """

    os.chdir(os.path.join(parent_dir, new_folder))

    # Write the ChimeraX commands to a temporary file
    command_file = 'buriedarea_script.cxc'
    # command_path = os.path.join(os.path.join(parent_dir, new_folder), command_file)
    with open(command_file, 'w') as f:
        f.write(chimerax_commands)
    print(f"Command file '{command_file}' created with the following content:")
    print(chimerax_commands)

    # Run ChimeraX with the command file
    try:
        result = subprocess.run([chimera_path, '--nogui', command_file], capture_output=True, text=True)
        print("ChimeraX executed.")
        print("ChimeraX output:", result.stdout)
        print("ChimeraX errors (if any):", result.stderr)

        initiator = None
        with open(f'{log_path}', 'w') as stdout_file:
            result = result.stdout.split('\n')
            for line in result:
                if 'contacting residues' in line:
                    initiator = 1
                if initiator == 1 and 'INFO:' in line:
                    initiator = None
                elif initiator == 1:
                    stdout_file.write(f'{line}\n')

    except Exception as e:
        print(f"Error running ChimeraX: {e}")

    os.remove(command_file)
    interface_residues = interface_reader(log_path, log_file)

    os.chdir(f'{parent_dir}')

    return interface_residues


def MD_states_interfaces(interface_residues):
    
    name = f'{name_1}{name_2[-1]}'
    for slice_num in range(1, 999):
        MD_slice = f'{name}_trj_{slice_num}.pdb'
        if os.path.exists(MD_slice):
            try:
                min_dis(MD_slice.split('.')[0], interface_residues, name_1, name_2, new_folder)
                pdb_path = f'{MD_slice}'
                log_file = f'{name_1}_{name_2}_interface_residues_trj_{slice_num}.log'
                create_buriedarea_file(pdb_path, log_file)

            except Exception as e_1:
                print(f"Error running AA_min_distances_auto.py: {e_1}")
                break
        else:
            break


def sd_ICI_MD(interface_residues):
    if_res = interface_residues

    os.chdir(os.path.join(parental_dir, new_folder))

    sd_all = []

    for slice_num in range(1, 999):
        if os.path.exists(f'{name_1}_{name_2}_{slice_num}_MII_ICI.csv'):
            try:

                with (open(f'{name_1}_{name_2}_{slice_num}_MII_ICI.csv', 'r+') as file):
                    ici_matrix = np.zeros((len(if_res), len(if_res)), float)
                    for line in file:
                        line = line.split(',')
                        if 'aa_x' not in line[0]:
                            pos_1 = line[0]
                            pos_2 = line[1]
                            ici = line[14].strip()
                            ici_matrix[if_res[pos_1]][if_res[pos_2]] = ici_matrix[if_res[pos_2]][if_res[pos_1]] = ici
                    ici_matrix = np.tril(ici_matrix, k=-1) + np.triu(np.full_like(ici_matrix, np.nan), k=0)
                    # Flatten the matrix and filter out the NaN values
                    sd_all.extend(ici_matrix[~np.isnan(ici_matrix)])

            except Exception as e_2:
                print(f'Error computing ICI standard deviation: {e_2}')
                break

    std_deviation = np.std(sd_all)
    print(f"Standard Deviation of strictly lower triangle values: {std_deviation}")

    dis_all = []

    for slice_num in range(1, 999):
        if os.path.exists(f'{name_1}_{name_2}_{slice_num}_dis_mtrx.npy'):
            try:

                dis_matrix = np.load(f'{name_1}_{name_2}_{slice_num}_dis_mtrx.npy')
                dis_matrix = np.tril(dis_matrix, k=-1) + np.triu(np.full_like(dis_matrix, np.nan), k=0)

                # Flatten the matrix and filter out the NaN values
                dis_all.extend(dis_matrix[~np.isnan(dis_matrix)])

            except Exception as e_3:
                print(f'Error computing distance standard deviation: {e_3}')
                break

    dis_std_deviation = np.std(dis_all)
    print(f"Standard Deviation of strictly lower triangle values: {dis_std_deviation}")


def main():
    global parent_dir
    parent_dir = os.getcwd()
    global new_folder
    new_folder = f'{name_1}_{name_2}_MII_ICI_SD'
    if not os.path.exists(f'{parent_dir}\\{new_folder}'):
        os.mkdir(f'{parent_dir}\\{new_folder}')
    pdb_file = f'{name_1}{name_2[-1]}_ranked_0.pdb'
    log_file = f'{name_1}_{name_2}_interface_residues.log'
    global chimera_path
    chimera_path = 'C:/Program Files/ChimeraX/bin/chimerax.exe'

    interface_residues = create_buriedarea_file(pdb_file, log_file)
    MD_states_interfaces(interface_residues)
    # sd_ICI_MD(interface_residues)


if __name__ == "__main__":
    # Example usage
    name_1 = 'PhoR'
    name_2 = 'PhoB'
    main()
