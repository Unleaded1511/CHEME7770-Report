%Transcription and Translation bounds 

%Equation for Wt= Transcription rate-
%Wt= Vt_max*(Gp/Kt+Gp)
%Vt_max= RT*vt/lg * u

Rt=75;  %nM
vt= 25; %nt/s
lg=990; %Extracted from RBCSnucleotide fasta file (NCBI)
u=0.9; 
Gp=5; %nM
Kt=116; %nM
Wt=Rt*vt*u*Gp/((Kt+Gp)*lg); %uM/s

%for Translation

%equation wx= Vxmax*(mRNA/ Kx + mRNA)
% Vxmax= (Kp*Rx*vx/lp)
%mRNA(t+ del t)= mRNA(t) + (wt- mRNA*lambda)*del t

Kp=10; 
Rx=1.6; %uM
vx=2; %aa/s/ribosome
lp=170; %aa from FASTA file of RBCS amino acid
Kx=45; %uM

Vxmax= Kp*Rx*vx/lp;

mRNA=2; %For "wild"/unaltered species: mRNA Abundance = 1, for transgenic : mRNA = 2 (Value extracted from literature; citation in main text)


Wx= Vxmax*(mRNA/Kx + mRNA);
disp(Wt)
disp(Wx)