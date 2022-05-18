# CHEME7770-Report
CHEME777006052022---Presentation

TXTL was performed by downloading the FASTA for RBCS from NCBI website for Zee Mays (Maize).
Run TXTL_RBCS in folder TXTL Palsen after inputting the name of the file containing nucleotide count (RBCSNucleotide.txt) and Amino Acid sequence (RBCSAmino-Acid sequence-FASTA.txt). The code should generate "result.txt" containing reactions 6 main reactions and several exchange fulxes from the Palssen template 

The code to generate stoichiometric matrix is described by "Transcription_calculation.jl". Running the code should generate a txt file with the relevant S V matrix.

To model transcription/translation limits, the matlab code Wt_Wx_TXTL is used. After selecting specific transcription/translation parameters correspodning to the system/transcription of interest, the code is run to generate the transcription and translation limits. The transcription limit is represented as "Lt = Wt = Ut="Trnascription output from code", while the translation limit is denoted by "0=Wx="Output from code".

Lastly, optimizer is run after changing the limits of the desired reaction of interest following syntax provided in file. A matrix is generated and the fluxes thus obtained are the optimised flux of species being maximised.

