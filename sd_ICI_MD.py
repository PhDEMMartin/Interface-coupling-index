import os
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.ticker import MultipleLocator

interface_residues = {'249_A': 0, '252_A': 1, '253_A': 2, '255_A': 3, '256_A': 4, '257_A': 5,	'259_A': 6,	'260_A': 7,
                      '261_A': 8, '263_A': 9, '264_A': 10, '267_A': 11,	'268_A': 12, '274_A': 13, '281_A': 14,
                      '288_A': 15, '411_A': 16,	'412_A': 17, '415_A': 18, '418_A': 19, '422_A': 20, '8_B': 21,
                      '9_B': 22, '10_B': 23, '11_B': 24, '12_B': 25, '14_B': 26, '15_B': 27, '18_B': 28, '22_B': 29,
                      '31_B': 30, '53_B': 31, '55_B': 32, '56_B': 33, '80_B': 34, '81_B': 35, '82_B': 36, '101_B': 37,
                      '102_B': 38, '103_B': 39, '104_B': 40,	'105_B': 41, '106_B': 42}


def create_and_save_plot(x, y, title="My Plot", xlabel="X-axis", ylabel="Y-axis", output_file="plot.tiff"):
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
    plt.plot(x, y, marker='o', linestyle='-')
    plt.title(title, fontsize=14)
    plt.xlabel(xlabel, fontsize=12)
    plt.ylabel(ylabel, fontsize=12)
    plt.gca().xaxis.set_major_locator(MultipleLocator(1))
    plt.grid(True)
    plt.tight_layout()  # Adjust layout to prevent clipping
    plt.savefig(output_file, dpi=300, format='tiff')  # Save as TIFF with 300 DPI
    plt.show()


def sd_ICI_MD():
    intf_res = interface_residues

    os.chdir(os.path.join(parent_dir, new_folder))

    sd_all = []
    sd_slice = []

    for slice_num in range(1, 999):
        if os.path.exists(f'{name_1}_{name_2}_{slice_num}_MII_ICI.csv'):
            try:

                with (open(f'{name_1}_{name_2}_{slice_num}_MII_ICI.csv', 'r+') as file):
                    ici_matrix = np.zeros((len(intf_res), len(intf_res)), float)
                    for line in file:
                        line = line.split(',')
                        if 'aa_x' not in line[0]:
                            pos_1 = line[0]
                            pos_2 = line[1]
                            num_pos_1 = intf_res[pos_1]
                            num_pos_2 = intf_res[pos_2]
                            ici = line[14].strip()
                            ici_matrix[intf_res[pos_1]][intf_res[pos_2]] = ici_matrix[intf_res[pos_2]][intf_res[pos_1]] = ici
                    #     sd_all.append(lower_triangle[r, c])
                    ici_matrix = np.tril(ici_matrix, k=-1) + np.triu(np.full_like(ici_matrix, np.nan), k=0)

                    # Flatten the matrix and filter out the NaN values
                    sd_slice.extend(ici_matrix[~np.isnan(ici_matrix)])

            except Exception as e_2:
                print(f'Error computing ICI standard deviation: {e_2}')
                break

            std_deviation = np.std(sd_slice)
            print(f"Standard Deviation of strictly lower triangle values from slice {slice_num}: {std_deviation}")
            sd_all.append(std_deviation)
            sd_slice = []
    ovrall_sd = np.mean(sd_all)

    print(f" Overall Standard Deviation: {ovrall_sd}")


    dis_all = []
    dis_slice = []

    for slice_num in range(1, 999):
        if os.path.exists(f'{name_1}_{name_2}_{slice_num}_dis_mtrx.npy'):
            try:

                dis_matrix = np.load(f'{name_1}_{name_2}_{slice_num}_dis_mtrx.npy')
                dis_matrix = np.tril(dis_matrix, k=-1) + np.triu(np.full_like(dis_matrix, np.nan), k=0)

                # Flatten the matrix and filter out the NaN values
                dis_slice.extend(dis_matrix[~np.isnan(dis_matrix)])

            except Exception as e_2:
                print(f'Error computing ICI standard deviation: {e_2}')
                break

            dis_std_deviation = np.std(dis_slice)
            print(f"Standard Deviation of strictly lower triangle values from slice {slice_num}: {dis_std_deviation}")
            dis_all.append(dis_std_deviation)
            dis_slice = []
    ovrall_dis_sd = np.mean(dis_all)

    print(f" Overall distance Standard Deviation: {ovrall_dis_sd}")

    create_and_save_plot(list(range(1, 22)), sd_all, title=f"{name_1} {name_2}", xlabel="step",
                         ylabel="ICI standard deviation")


def main():
    global parent_dir
    parent_dir = os.getcwd()
    global new_folder
    new_folder = f'{name_1}_{name_2}_MII_ICI_SD'
    global chimera_path
    chimera_path = 'C:/Program Files/ChimeraX/bin/chimerax.exe'

    sd_ICI_MD()


if __name__ == "__main__":
    # Example usage
    name_1 = 'QseC'
    name_2 = 'QseB'
    main()
