fileid=fopen("Transcription Matrix.txt");
format= "%c";
S=fscanf(fileid,format);
S=str2num(S);
Array_bounds= bounds;

lbarray= Array_bounds(1:33,1);
ubarray= Array_bounds(1:33,2);

 lbarray(2)=0.0704; %Transcription lower limit
 ubarray(2)=0.0704; %Transcription upper limit

 lbarray(5)= 0; %Translation lower limit
 ubarray(5)= 0.1924; %Translation upper limit

 R=zeros(25,1); %Metabolites
 c=zeros(1,33); %Reactions

 c(5)=1; %Objective function


ve= linprog(-c,[],[],S,R,lbarray,ubarray); %Maximise c
disp(ve)
