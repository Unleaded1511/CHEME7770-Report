%this simplified model assumes that all the amino acids that are present
%are of equal numbers, and hence is represented only by AA symbol
%Only the nucleotides and their constituent Phosphates are assumed to be
%unique
%This model also incorporates the promoter Gene and the production of RNAP
%tRNA, ribosome also.
% the gene that is used here to generate a stoichiometric matrix are
% eukaryotic and not prokaryotic.
% The gene is assumed to be recombined with the T7RNAP. 

Gene=input("Enter in gene name",'s');
Protein= input("Enter in protein created",'s');
Geneact= strcat(Gene,'*');
[NPi2,sumNTP,ATP,UTP,GTP,CTP]=geneSequence('RBCSNucleotide.txt'); 
[A,U,G,C]=nucleotideCount('RBCSNucleotide.txt'); 
AMP= strcat(A,'AMP');
GMP= strcat(G,'GMP');
UMP= strcat(U,'UMP');
CMP= strcat(C,'CMP');

AAcount_1=170; %RBCS amino acid count
AAcount_2= 2*AAcount_1;
AAcount_1=num2str(AAcount_1);
AAcount_2=num2str(AAcount_2);

%modify this with the required GENE.txt file that has the nucleotide sequence in it
rx2part1= strcat(Geneact,'+',ATP,'+',UTP,'+',GTP,'+',CTP);
rx2part2= strcat('mRNA','+',Gene,'+','RNAP','+',NPi2);

%I'm showing all AA as AA, not specially calling them individually
rx5part1= strcat('rib*','+',AAcount_1,'*AAtRNA','+',AAcount_2,'GTP');
rx5part2= strcat(AAcount_1,'tRNA','+', AAcount_2,'GDP','+',AAcount_2,'Pi','+','rib','+','mRNA','+',Protein);

%reaction set for Gene of Interest
rx1=strcat(Gene,'+','RNAP','=',Geneact);
rx2= strcat(rx2part1,'=',rx2part2);
rx3= strcat('mRNA','=',AMP,'+',UMP,'+',GMP,'+',CMP);
rx4= strcat('mRNA','+','rib','=','rib*');
rx5= strcat(rx5part1,'=',rx5part2);
rx6= strcat('AA','+','tRNA','+','ATP','=','AMP','+','2Pi','+','AAtRNA');

%exchange fluxes for Gene of Interest
b1= strcat(AAcount_1,'AA','=',AAcount_1,'AA'); %the first AA is external
b2= strcat(A,'ATP','=', A,'ATP'); %the first ATP is external
b3= strcat(U,'UTP','=', U,'UTP'); %the first UTP is external
b4= strcat(G,'GTP','=', G,'GTP'); %the first GTP is external
b5= strcat(C,'CTP','=', C,'CTP'); %the first CTP is external
b6= strcat(Protein,'=',Protein); %the first protein is external
b7= strcat(A,'AMP','=', A,'AMP'); %the first AMP is external
b8= strcat(G,'GMP','=', G,'GMP'); %the first GMP is external
b9= strcat(U,'UMP','=', U,'UMP'); %the first UMP is external
b10=strcat(C,'CMP','=', C,'CMP'); %the first CMP is external
b11= strcat('Pi','=','Pi'); %the first Pi is external


%reactions needed for RNAP tRNA production

[NPi2_1,sumNTP_1,ATP_1,UTP_1,GTP_1,CTP_1]=geneSequence('rbcsAmino-acid sequence.txt'); 
[A1,U1,G1,C1]=nucleotideCount('RBCSAmino-acid sequence.txt');
AAcount_3=1207; %GALNT1 specific excluding T7RNAP
AAcount_4= 2*AAcount_3;
AAcount_3=num2str(AAcount_3);
AAcount_4=num2str(AAcount_4);
AMP_1= strcat(A1,'AMP');
GMP_1= strcat(G1,'GMP');
UMP_1= strcat(U1,'UMP');
CMP_1= strcat(C1,'CMP');


GeneP='T7RNAP';
GeneAct1= 'T7RNAP*';
rx7= strcat(GeneP,'+','RNAP','=',GeneAct1);
rx8part1=strcat(GeneAct1,'+',ATP_1,'+',GTP_1,'+',UTP_1,'+',CTP_1);
rx8part2=strcat('mRNAp','+',GeneP,'+','RNAP','+',NPi2_1);
rx8= strcat(rx8part1,'=',rx8part2);
rx9= strcat('mRNAp','=',ATP_1,'+',GTP_1,'+',UTP_1,'+',CTP_1);
rx10= strcat('mRNAp','+','rib','=','ribp*');
rx11part1= strcat('ribp*','+',AAcount_3,'AAtRNA','+',AAcount_4,'GTP');
rx11part2= strcat(AAcount_3,'tRNA','+',AAcount_4,'GDP','+',AAcount_4,'Pi','+','rib','+','mRNAP','+','RNAP');
rx11= strcat(rx11part1,'=',rx11part2);

%use different genes for ribosome Just assume that they are called Gene t
%and Gene r. Also for the nt and nr, bound them with the np and nt values

rx12= strcat('Gt','RNAP','=','Gt*');
rx13part1= strcat('Gt*','+',ATP_1,'+',UTP_1,'+',GTP_1,'+',CTP_1);
rx13part2= strcat('tRNA','+ Gt + RNAP +',NPi2,'Pi');
rx13= strcat(rx13part1,'=',rx13part2);
rx14= strcat('Gr + RNAP =','Gr*');
rx15part1= strcat('Gr*',ATP_1,'+',GTP_1,'+',UTP_1,'+',CTP_1);
rx15part2= strcat('Gr+ rib + RNAP',NPi2_1);
rx15= strcat(rx15part1,'=',rx15part2);










R=cell(25,1);
R{1}=rx1;
R{2}=rx2;
R{3}=rx3;
R{4}=rx4;
R{5}=rx5;
R{6}=rx6; 
R{7}=b1;
R{8}=b2;
R{9}=b3;
R{10}=b4;
R{11}=b5;
R{12}=b6;
R{13}=b7;
R{14}=b8;
R{15}= b9;
R{16}= b10;
R{17}= b11;
R{18}= rx7;
R{19}=rx8;
R{19}=rx9;
R{20}=rx10;
R{21}= rx11;
R{22}= rx12;
R{23}=rx13;
R{24}= rx14;
R{25}= rx15;
writecell(R,'Result.txt')
