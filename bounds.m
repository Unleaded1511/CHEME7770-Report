%bounds for the reactions. The driver code will change bounds(5,:) each run
%Units of bounds are in uM/s
%negative flux indicates depletion
%positive flux means supply

function bound= bounds

bounds= [-100	100
-100	100
-100	100
-100	100
-100	100
-100	100
-100	100
-100	100
-100	100
-50	100
-50	100
-50	100
-50	100
-50	100
-50	100
-100	100
-100	100
-100	100
-100	100
-100	100
-50	100
-100	100
-100	100
-100	100
-100	100
-50	100
-100	100
-100	100
-100	100
-100	100
-100	100
-100	100
-100	100
-100	100
-50	100


% bounds(1,1)= -100; % Gene initiation to Gene complex
% bounds(2,1)= -100; %transcription elongation- calc with formula
% bounds(3,1)= -100; %mRNA degradation
% bounds(4,1)= -100; %translation initiation
% bounds(5,1)= -100; %translation- to minimze this
% bounds(6,1)= -100; %tRNA charging

 bound=bounds;
