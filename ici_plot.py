import os
import subprocess
import re
import numpy as np
from Bio import AlignIO
from Bio.Seq import Seq
from Bio.SeqRecord import SeqRecord
from Bio.Align import MultipleSeqAlignment
from Bio import motifs
from MII_retriever import interface_reader
from AA_min_distance_auto import main as min_dis
#from MII_MSA_retriever import main as msa_offset
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator

systems = ['CpxA_CpxR', 'NarQ_NarP', 'PhoR_PhoB', 'QseC_QseB']


def create_and_save_plot(highlight, x, y, title="My Plot", xlabel="X-axis", ylabel="Y-axis", output_file="figure 5 2024.tiff"):
    """
    Create a plot and save it as a TIFF file with 300 DPI.

    Parameters:
        x (list or array): X-axis data.
        y (list or array): Y-axis data.
        title (str): Plot title.
        xlabel (str): Label for the X-axis.
        ylabel (str): Label for the Y-axis.
        output_file (str): File name for the saved plot.
    """
    plt.figure(figsize=(8, 6))  # Set the figure size
    plt.plot(x, y, color='k', marker='o', linestyle='', markersize=3, zorder=1)
    plt.title(title, fontsize=14)
    plt.xlabel(xlabel, fontsize=12)
    plt.ylabel(ylabel, fontsize=12)
    plt.axvline(x=threshold, color='red', linestyle='-', linewidth=1.2)

    colors = {'CpxA_CpxR': '#ff0000', 'NarQ_NarP': '#00ff00', 'PhoR_PhoB': '#00ffff', 'QseC_QseB': '#800080'}

    for label, points in highlight.items():
        # Extract X and Y values from the list of tuples
        x_values = [point[0] for point in points]
        y_values = [point[1] for point in points]

        plt.plot(x_values, y_values, label=label, color=colors[label], marker='o', markersize=3, linestyle='',
                 zorder=2)  # Scatter plot for individual points

    plt.gca().xaxis.set_major_locator(MultipleLocator(1))
    plt.grid(True)
    plt.tight_layout()  # Adjust layout to prevent clipping
    plt.savefig(output_file, dpi=300, format='tiff')  # Save as TIFF with 300 DPI
    plt.show()


def interface_txt_reader(log_path, log_file):
    interface_res = {}
    with open(f'{log_path}\\{log_file}', 'r') as x:
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

    sorted_interfaces = dict(sorted(interface_res.items(), key=lambda item: (item[1][0], int(item[0]))))
    return sorted_interfaces


def ICI_matrices(name_1, name_2, interface_residues):
    intf_res = interface_residues
    index = {f'{key}_{value[0]}': idx for idx, (key, value) in enumerate(interface_residues.items())}

    os.chdir(os.path.join(parent_dir, new_folder))

    if os.path.exists(f'{name_1}_{name_2}_0_MII_ICI.csv'):
        try:

            with (open(f'{name_1}_{name_2}_0_MII_ICI.csv', 'r+') as file):
                mip_matrix = np.zeros((len(intf_res), len(intf_res)), float)
                wmip_matrix = np.zeros((len(intf_res), len(intf_res)), float)
                ici_matrix = np.zeros((len(intf_res), len(intf_res)), float)
                for line in file:
                    line = line.split(',')
                    if 'aa_x' not in line[0]:
                        pos_1 = line[0]
                        pos_2 = line[1]
                        num_pos_1 = index[pos_1]
                        num_pos_2 = index[pos_2]
                        mip = line[9].strip()
                        wmip = line[11].strip()
                        ici = line[14].strip()
                        mip_matrix[index[pos_1]][index[pos_2]] = mip_matrix[index[pos_2]][index[pos_1]] = mip
                        wmip_matrix[index[pos_1]][index[pos_2]] = wmip_matrix[index[pos_2]][index[pos_1]] = wmip
                        ici_matrix[index[pos_1]][index[pos_2]] = ici_matrix[index[pos_2]][index[pos_1]] = ici

                #     sd_all.append(lower_triangle[r, c])
                np.save(f'{name_1}_{name_2}_0_mip_matrix.npy', mip_matrix)
                np.save(f'{name_1}_{name_2}_0_wmip_matrix.npy', wmip_matrix)
                np.save(f'{name_1}_{name_2}_0_ICI_matrix.npy', ici_matrix)

        except Exception as e_2:
            print(f'Error computing ICI standard deviation: {e_2}')


def seq_logo(name_1, name_2):

    os.chdir(f'{parent_dir}\\{new_folder}')

    msa_positions = []

    if os.path.exists(f'{name_1}_{name_2}_MSA_index_corrected.txt'):
        try:
            with open(f'{name_1}_{name_2}_MSA_index_corrected.txt', 'r') as reader:
                for line in reader:
                    line = line.split('\t')[1]
                    line = int(line.strip())
                    msa_positions.append(line)

        except Exception as e_msa:
            print(f'Error retrieving MSA positions: {e_msa}')

    complete_path = f'{parent_dir}\\{name_1}_{name_2}_2024_msa_NR.fa'

    if os.path.exists(complete_path):
        try:
            columns = []
            interface_aligment = []
            instances = []
            alignment = AlignIO.read(complete_path, 'fasta')
            for column in range(len(msa_positions)):
                columns.append(alignment[:, msa_positions[column]-1])
            sequences = ["".join(column[i] for column in columns) for i in range(len(columns[0]))]
            for num_seq in range(0, len(alignment)):
                instances.append(f'Seq({sequences[num_seq]})')
                record = SeqRecord(
                    Seq(sequences[num_seq]),
                    id=alignment[num_seq].id,
                    name=alignment[num_seq].name,
                    description=alignment[num_seq].description,
                )
                interface_aligment.append(record)

            interface_alignment = MultipleSeqAlignment(interface_aligment)

            with open(f"{name_1}_{name_2}_interface_alignment.fa", "w") as output_handle:
                AlignIO.write(interface_alignment, output_handle, "fasta")

            cmd = [
                "weblogo",
                "-f", f"{parent_dir}\\{new_folder}\\{name_1}_{name_2}_interface_alignment.fa",  # Input file
                "-D", "fasta",
                "-n", "45",
                "--scale-width", "Yes",
                "-c", "chemistry",
                "--fineprint", "",
                "-s", "large",
                "-o", f"{parent_dir}\\{new_folder}\\{name_1}_{name_2}_interface_seqlogo.png",  # Output file
                "-F", "png_print",  # Output format
                "-A", "protein"  # Specify amino acid sequences
            ]
            subprocess.run(cmd)
            #There is a known error in which some letters might slip in the logo to avoid this use the server as it
            # has been solved there
            print(f"Amino acid WebLogo saved as: {parent_dir}\\{new_folder}\\{name_1}_{name_2}_interface_seqlogo.png")

        except Exception as e_seq:
            print(f'Error retrieving the MSA file: {e_seq}')

    os.chdir(f'{parent_dir}')


def percentile():

    percentile_buffer = []

    for system in systems:
        name_1 = system.split('_')[0]
        name_2 = system.split('_')[1]

        if os.path.exists(f'{name_1}_{name_2}_0_ICI_matrix.npy'):
            try:
                ici_matrix = np.load(f'{name_1}_{name_2}_0_ICI_matrix.npy')
                ici_matrix = np.tril(ici_matrix, k=-1) + np.triu(np.full_like(ici_matrix, np.nan), k=0)
                percentile_buffer.extend(ici_matrix[~np.isnan(ici_matrix)])

            except Exception as e_3:
                print(f'Error retrieving ICI matrix: {e_3}')

    value = np.percentile(percentile_buffer, 99)

    with open('percentile.txt', 'w') as handle_1:
        handle_1.write(f'Percentile\n{value}')

    return value


def MIp_plots():
    mip_all_TCS = []
    wmip_all_TCS = []
    dis_all_TCS = []
    dis_2_all_TCS = []
    tag = []

    for system in systems:
        name_1 = system.split('_')[0]
        name_2 = system.split('_')[1]

        if os.path.exists(f'{name_1}_{name_2}_0_mip_matrix.npy'):
            try:
                mip_matrix = np.load(f'{name_1}_{name_2}_0_mip_matrix.npy')
                mip_matrix = np.tril(mip_matrix, k=-1) + np.triu(np.full_like(mip_matrix, np.nan), k=0)
                if system == 'QseC_QseB':
                    for i in range(len(mip_matrix)):
                        for j in range(len(mip_matrix)):
                            if mip_matrix[i][j] < -0.50:
                                tag = [i, j]
                                mip_matrix[i, j] = np.nan
                                break
                mip_all_TCS.extend(mip_matrix[~np.isnan(mip_matrix)])

            except Exception as e_3:
                print(f'Error retrieving ICI matrix: {e_3}')

        if os.path.exists(f'{name_1}_{name_2}_0_wmip_matrix.npy'):
            try:
                wmip_matrix = np.load(f'{name_1}_{name_2}_0_wmip_matrix.npy')
                wmip_matrix = np.tril(wmip_matrix, k=-1) + np.triu(np.full_like(wmip_matrix, np.nan), k=0)
                wmip_all_TCS.extend(wmip_matrix[~np.isnan(wmip_matrix)])

            except Exception as e_3:
                print(f'Error retrieving ICI matrix: {e_3}')

        if os.path.exists(f'{name_1}_{name_2}_0_dis_mtrx.npy'):
            try:

                dis_matrix = np.load(f'{name_1}_{name_2}_0_dis_mtrx.npy')
                dis_matrix = np.tril(dis_matrix, k=-1) + np.triu(np.full_like(dis_matrix, np.nan), k=0)
                if system == 'QseC_QseB':
                    dis_matrix[tag[0], tag[1]] = np.nan

                # Flatten the matrix and filter out the NaN values
                dis_2_all_TCS.extend(dis_matrix[~np.isnan(dis_matrix)])

            except Exception as e_2:
                print(f'Error computing ICI standard deviation: {e_2}')

        if os.path.exists(f'{name_1}_{name_2}_0_dis_mtrx.npy'):
            try:

                dis_matrix = np.load(f'{name_1}_{name_2}_0_dis_mtrx.npy')
                dis_matrix = np.tril(dis_matrix, k=-1) + np.triu(np.full_like(dis_matrix, np.nan), k=0)

                # Flatten the matrix and filter out the NaN values
                dis_all_TCS.extend(dis_matrix[~np.isnan(dis_matrix)])

            except Exception as e_2:
                print(f'Error computing ICI standard deviation: {e_2}')

    def create_and_save_plots(x, y, title="My Plot", xlabel="X-axis", ylabel="Y-axis",
                             output_file="figure 5 2024.tiff"):
        """
        Create a plot and save it as a TIFF file with 300 DPI.

        Parameters:
            x (list or array): X-axis data.
            y (list or array): Y-axis data.
            title (str): Plot title.
            xlabel (str): Label for the X-axis.
            ylabel (str): Label for the Y-axis.
            output_file (str): File name for the saved plot.
        """
        plt.figure(figsize=(8, 6))  # Set the figure size
        plt.plot(x, y, color='k', marker='o', linestyle='', markersize=3)
        plt.title(title, fontsize=14)
        plt.xlabel(xlabel, fontsize=12)
        plt.ylabel(ylabel, fontsize=12)
        plt.gca().xaxis.set_major_locator(MultipleLocator(1))
        plt.grid(True)
        plt.tight_layout()  # Adjust layout to prevent clipping
        plt.savefig(output_file, dpi=300, format='tiff')  # Save as TIFF with 300 DPI
        plt.show()

    create_and_save_plots(mip_all_TCS, dis_2_all_TCS, xlabel='MIp', ylabel='minimal sidechain residues distance\n(Å)',
                          output_file='figure 2.tiff', title='')

    create_and_save_plots(wmip_all_TCS, dis_all_TCS, xlabel='wMip', ylabel='minimal sidechain residues distance\n(Å)',
                          output_file='figure 2_1.tiff', title='')


def ICI_plot():

    ici_all_TCS = []
    dis_all_TCS = []
    highlight = {'CpxA_CpxR': [], 'NarQ_NarP': [], 'QseC_QseB': [], 'PhoR_PhoB': []}

    with open('OISC.txt', 'w') as handle:
        handle.write(f'TCS\tMSA_x\tMSA_y\tMtrx_x\tMtrx_y\tAA_x\tAA_y\tICI\tdis\n')
        for system in systems:
            name_1 = system.split('_')[0]
            name_2 = system.split('_')[1]
            txt_path = f'{parent_dir}\\{name_1}_{name_2}_MII_ICI_SD'
            txt_file = f'{name_1}_{name_2}_interface_residues.log'
            interface_residues = interface_txt_reader(txt_path, txt_file)
            index = {i: f"{key}_{value[0]}" for i, (key, value) in enumerate(interface_residues.items())}

            os.chdir(f'{parent_dir}\\{new_folder}')

            if os.path.exists(f'{name_1}_{name_2}_0_ICI_matrix.npy'):
                try:
                    ici_matrix = np.load(f'{name_1}_{name_2}_0_ICI_matrix.npy')
                    ici_matrix = np.tril(ici_matrix, k=-1) + np.triu(np.full_like(ici_matrix, np.nan), k=0)
                    for i in range(len(ici_matrix)):
                        for j in range(len(ici_matrix)):
                            if ici_matrix[i][j] > threshold and index[i].split('_')[1] != index[j].split('_')[1]:
                                highlight[f'{name_1}_{name_2}'].append([i, j, ici_matrix[i][j]])
                    ici_all_TCS.extend(ici_matrix[~np.isnan(ici_matrix)])

                except Exception as e_3:
                    print(f'Error retrieving ICI matrix: {e_3}')

            if os.path.exists(f'{name_1}_{name_2}_0_dis_mtrx.npy'):
                try:

                    dis_matrix = np.load(f'{name_1}_{name_2}_0_dis_mtrx.npy')
                    for item in highlight[f'{name_1}_{name_2}']:
                        distance = dis_matrix[item[0], item[1]]
                        item.append(distance)
                        res_1 = index[item[0]]
                        res_2 = index[item[1]]
                        if os.path.exists(f'{name_1}_{name_2}_MSA_index_corrected.txt'):
                            try:
                                with open(f'{name_1}_{name_2}_MSA_index_corrected.txt', 'r') as positions_1:
                                    for position in positions_1:
                                        AA = position.split('\t')[0].strip()
                                        if res_1 == AA:
                                            pos_1 = int(position.split('\t')[1].strip())
                                        elif res_2 == AA:
                                            pos_2 = int(position.split('\t')[1].strip())
                            except Exception as e_pos:
                                print(f'MSA position could not be retrieved to ICI file: {e_pos}')
                        handle.write(f'{system}\t{pos_1}\t{pos_2}\t{item[0]}\t{item[1]}\t{res_1}\t{res_2}\t{item[2]}\t'
                                     f'{round(item[3],5)}\n')
                        item.pop(1)
                        item.pop(0)
                    dis_matrix = np.tril(dis_matrix, k=-1) + np.triu(np.full_like(dis_matrix, np.nan), k=0)

                    # Flatten the matrix and filter out the NaN values
                    dis_all_TCS.extend(dis_matrix[~np.isnan(dis_matrix)])

                except Exception as e_2:
                    print(f'Error computing ICI standard deviation: {e_2}')
        handle.close()

    create_and_save_plot(highlight, ici_all_TCS, dis_all_TCS, title='', xlabel="Interface coupling index (ICI)",
                         ylabel="minimal sidechain residues distance\n(Å)")


def main():
    global parent_dir
    parent_dir = os.getcwd()
    global chimera_path
    chimera_path = 'C:/Program Files/ChimeraX/bin/chimerax.exe'
    global new_folder
    new_folder = f'All_TCS'
    if not os.path.exists(f'{parent_dir}\\{new_folder}'):
        os.mkdir(f'{parent_dir}\\{new_folder}')

    for system in systems:
        name_1 = system.split('_')[0]
        name_2 = system.split('_')[1]
        pdb_file = f'{name_1}{name_2[-1]}_ranked_0.pdb'
        txt_path = f'{parent_dir}\\{name_1}_{name_2}_MII_ICI_SD'
        txt_file = f'{name_1}_{name_2}_interface_residues.log'
        interface_residues = interface_txt_reader(txt_path, txt_file)
        if os.getcwd() != parent_dir:
            os.chdir(parent_dir)
        min_dis(pdb_file.split('.')[0], interface_residues, name_1, name_2, new_folder)
        seq_logo(name_1, name_2)
        ICI_matrices(name_1, name_2, interface_residues)

    global threshold
    threshold = percentile()
    MIp_plots()
    ICI_plot()


if __name__ == "__main__":
    main()
