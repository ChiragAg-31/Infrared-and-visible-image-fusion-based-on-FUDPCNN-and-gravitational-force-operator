function R=FUDPCNN(A,B) %Unit linking dual channel PCNN

itt=200;
%Absolute values can be used
alpha_u=0.2232; % alpha_f

V_E=40;
delta=0.01;


betaA=0.2;
betaB=0.2;

%PAULDCPCNN

[p,q]=size(A);
F1=abs(A);
F2=abs(B);
U=zeros(p,q);
Y=zeros(p,q);
E=ones(p,q);


W=[1 1 1;1 0 1;1 1 1];
%while min(T(:))==0
for it=1:itt
    %ti=it+1;
    K1 = conv2(Y,W,'same');
    K=(K1>0); 
    U1=F1.* (1 + betaA .* K);
    U2=F2.* (1 + betaB .* K);
    map=(U1>=U2);
    U3=map.*U1+~map.*U2;
    U = exp(-alpha_u) * U + U3;
    Y = im2double( U > E );
    E = E + V_E * Y-delta;
   
end
R =(U1>=U2);
end


