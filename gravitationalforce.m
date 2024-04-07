function force = gravitationalforce(k, o)


% a=0;
 e=0.01;
 %a=(abs(k-(o+e)))^2;
d=abs(k-o-e);
%  //Distance calculation according to the Euclidean relation
 %dist1=sqrt(a);


%  //Calculation of similarity based on Exponential function

 force=10*[(k+e)*(o+e)]/(d);





end

