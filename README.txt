Interface coupling index
========================
Is a tool that computes the mutual information between all pairs of columns in a multiple sequence alignment and returns
the interface coupling index for each pair of amino acids in the interface from a heterodimer protein complex.

Introduction
------------

Mutual information (MI) theory is often applied to predict positional correlations in a multiple sequence alignment,
to make possible the analysis of those positions structurally or functionally important in a given fold or protein
family.  In order to identify co-evolving positions between putative cognate prototypical Two-component systems proteins
(TCS), orthologue protein Multiple sequence alignment datasets of prototypical TCSs coded in Actinobacillus
pleuropneumoniae were used to compute MIp.  Which accurately estimates and removes background information from phylogeny
and entropy, correctly identifying co-evolving positions (Dunn et al 2016).  The wMIp parameter introduced in the
methodology allows to adjust for positions which are not completely represented in a Multiple sequence alignment. The
interface coupling index (ICI) estimates both co-evolution and close contact for residue pairs.

Installation
------------

pip install numpy

Numpy is used to make arrays of all amino acid and gap pairs possible, to make the division of two arrays and save data
into csv files.

pip install Biopython

Biopython is an Api that is mainly used to acquire the previously processed alignments and extract the information for
each pair of column positions in the alignment.

pip install math

Math is used to compute the logarithm base 20 for Sharon´s entropy calculations .

pip install csv23

Csv23 is used to read csv files.


Usage
-----

Before using the software a couple of preprocessing stages are required:

1. Build a fasta file with the sequences of the heterodimer you would like to work with. Both sequences must belong to
the same organism and is highly recommended that both are coded in the same operon. Is necessary that both sequences are
joined as a single sequence (concatenated). The previous file has to have at least 125 sequences for best performance.

2. The previous file has to be aligned using your preferred multiple sequence alignment tool, clustal omega is
recommended (http://www.clustal.org/omega/). If the file contains more than 1400 sequences you will need to download
clustal omega and run it locally. Further manual processing of the files is recommended, according to the user's
criteria.

Once the preprocessing stages have been completed:

3. The name of the fasta file needs to be entered in line 5 of the MIp.py file, the file must be in the same folder
where the software was downloaded or point the complete file's route. Multiple fasta files can be processed at a time
i.e. [file1.fa, file2.fa,...,filen.fa], though this will take considerably more time.

The output files will be named according to the first 5 letter of your fasta file. It is recommended that you add an
additional identifier [*] to the output files in lines 197, 257, 275, 289, and 296, the files are save as
*_MI_matrix[*].csv, *_APC_matrix[*].csv, *_MIp_matrix.csv[*], and *_wMIp_matrix[*].csv, and *_MIp_detailed[*].csv,
respectively. i. e. file1.fa will save files as file1_MIp_detailed[*].csv [*] being the additional identifier.

4. Run $ python3 MIp.py.

The software will return five different CSV file _MI_matrix.csv, _APC_matrix.csv, _MIp_matrix.csv, _wMIp_matrix.csv,
and _MIp_detailed.csv, the first four files contain raw data, the latter contains detailed information by amino acid
pairs. aa_x, aa_y, h_x, h_y, h_xy, MI, APC, MIp, w, and wMIp, file´s column headers contain the following information
amino acid x's position in the alignment, amino acid y's position in the alignment, Shannon's entropy for position x,
Shannon's entropy for position y, Joint Shannon´s entropy for positions x and y, mutual information x and y positions,
average product correction, mutual information, mutual information independent of entropy [1], position's occupancy, and
weighted mutual information independent of entropy, respectively.

5. Acquire heterodimer protein complex's interface residues, this can be done with ChimeraX
(https://www.rbvi.ucsf.edu/chimerax/) or Swiss-PdbViewer (https://spdbv.unil.ch/), use a related protein model to the
heterodimer proteins you are trying to analyse for interface residues. The interface residues need to be
listed according to its parental alignment, interface residue position's in the PDB file need to be matched to its
sequence's  relative position in the multiple sequence alignment. The program will try to match automatically the file's
name with the header in the interface residue list, as the files were named by the complexed proteins that were worked
with i.e. CpxAR.fa will try to match with a CpxAR header.

6. Enter the file's name to be worked with in line 110 of the PII retriever.py, the file must be in the same folder
where the software was downloaded or point the complete file's route. This file is one of the output files from 4.
exactly *_MIp_detailed.csv file, these file contains all the alignment information by positions pair. Do the same for
the file that contains the relative position of the interface residues, but now in line 111 of the PII retriever file.

7. Run $ python3 PII retriever.py.

This program will return a file ending as *wMIp_final_4[*].csv that will contain the information of the residues in the
prototypical interaction interface of the heterodimer you are working with. The output file will be named according to
the first 5 letter of your fasta file in place of *. It is recommended that you add an additional identifier [*] to the
output file in line 56 in PII retriever.py. The files headers are the following aa_x, aa_y, h_x, h_y, h_xy, MI, APC,
MIp, w, and wMIp, which contain the following information amino acid x's position in the alignment, amino acid y's
position in the alignment, Shannon's entropy for position x, Shannon's entropy for position y, Joint Shannon´s entropy
for positions x and y, mutual information x and y positions, average product correction, mutual information, mutual
information independent of entropy [1], position's occupancy, and weighted mutual information independent of entropy,
respectively.

To obtain the interface coupling index some postprocessing will be required.

8. Enter heterodimer's working name and pdb file in AA_min_distance.py file lines 5 and 6, respectively. The pdb file
must be in the same folder where the software was downloaded or point the complete file's route.

9. The interface residues must be modified in line 19 in AA_min_distance.py as an array, be sure to add these with its
positions as if it was a single sequence.

10. Modify the value in line 44, this will modify the loops for the interface amino acids. The range of iteration from
the first loop's end is equal to the number of amino acids in the interface of protein A of your AB heterodimer minus
one, the second iteration loop's start is equal to the number of amino acids in the interface of protein A of your AB
heterodimer.

11. Values in lines 49, 50, and 51 in AA_min_distance.py have to be modified, these are specific to the PDB's
structure used as model and the subunits that are being worked with. To determine the values that need to be entered in
PDB_entry_start, PDB_subunit_end, and non_aa_entries, from lines 49, 50, and 51, respectively, you can print res_list.
The first residue in the structure under the name resseq= is the value that needs to be entered in PDB_entry_start. The
last amino acid's resseq= number from the first subunit is the value that needs to be entered in PDB_subunit_end. The
value for non_aa_entries is the number of non amino acid entries between the first and the second subunit entries, if
you are familiarized with the amino acid three letter code you will detect them right away as they are none of the 20.

12. Run $ python3 AA_min_distance.py, the program will return the minimum distance between amino acid pairs in the
interface. This distance will be used to divide the absolute distance between amino acid pairs in the interface, a more
detailed explanation about it can be found in the paper "Two-component systems interface discrimination in
Actinobacillus pleuropneumoniae" currently under reviewing process.

To obtain the Interface coupling index additional manual processing is required so far, though in the near future it
will be fully automated.

13. In the file ending as *wMIp_final_4[*].csv from point 7, you will need to enter the distance values for each pair.
The file should contain m = n^2 lines when n = number of amino acids in the interface, therefore the values for each
amino acid with itself must be added, add these entries either as NA or 0. Three additional headers have to be added
dis, amd, and ICI,  which are distance between amino acids, adjusted minimal distance, and interface coupling index.




Authors and history
---------------------------

Jorge Soriano, Jesus Adrian Lozano, Christian Macias, and Roberto Carreón worked in the early developing stages of the
program as part of a miniproject from the Universidad Autónoma de Aguascalientes. Special thanks to Dr. Rogelio Salinas
whom kindly guide me through several statistical concepts making them easier to understand and program. The original
author of this software and current file is Eduardo M Martin.

1. Dunn SD, Wahl LM, Gloor GB. Mutual information without the influence of phylogeny or entropy dramatically improves
residue contact prediction. Bioinformatics (2008) 24:333–340. doi:10.1093/bioinformatics/btm604