function [F]=MAIN_FUSION_FUDPCNN_Grav_Force(A,B)
addpath(genpath('nsct_toolbox'));
pfilt = '9-7';
dfilt = 'pkva';
nlevs = [0,1,3,4,4];
nsctA=nsctdec(A,nlevs,dfilt,pfilt); % NSCT Decompostion of A
nsctB=nsctdec(B,nlevs,dfilt,pfilt); % NSCT Decompostion of B
n = length(nsctA); %Number of 2nd dimension cell array
Fused=nsctA; 

%disp('Process in  Lowpass subbands...')
ALow1= nsctA{1};
BLow1 =nsctB{1};
A1=Grav_Force(ALow1);
B1=Grav_Force(BLow1);
map1=A1>=B1;
Fused{1}=map1.*ALow1+~map1.*BLow1;  


%disp('Process in  Bandpass subbands...')
Ahigh=nsctA{2};
Bhigh=nsctB{2};
AH=abs(Ahigh);
BH=abs(Bhigh);
map=FUDPCNN(AH,BH);
Fused{2}=map.*Ahigh+~map.*Bhigh;                
                
for i = 3:n
    for d = 1:length(nsctA{i})
        Ahigh = nsctA{i}{d};
        Bhigh = nsctB{i}{d};
        AH=abs(Ahigh);
        BH=abs(Bhigh);
        map=FUDPCNN(AH,BH);
        Fused{i}{d}=map.*Ahigh+~map.*Bhigh;  
    end    
end
F=nsctrec(Fused, dfilt, pfilt);
end
        







