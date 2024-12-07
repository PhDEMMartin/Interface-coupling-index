import os
import subprocess

parent_dir = 'C:\\Users\\faits\\Documents\\GitHub\\MIp_new'
new_folder = 'All_TCS'
name_1 = 'CpxA'
name_2 = 'CpxR'

cmd = [
                "weblogo",
                "-f", f"{parent_dir}\\{new_folder}\\{name_1}_{name_2}_interface_alignment.fa",  # Input file
                "-D", "fasta",
                "-A", "protein",  # Specify amino acid sequences
                "--scale-width", "Yes",
                "-c", "chemistry",
                "--fineprint", "",
                "-s", "large",
                "-o", f"{parent_dir}\\{new_folder}\\{name_1}_{name_2}_interface_seqlogo.png",  # Output file
                "-F", "png_print",  # Output format
            ]
subprocess.run(cmd)
print(f"Amino acid WebLogo saved as: {parent_dir}\\{new_folder}\\{name_1}_{name_2}_interface_seqlogo.png")