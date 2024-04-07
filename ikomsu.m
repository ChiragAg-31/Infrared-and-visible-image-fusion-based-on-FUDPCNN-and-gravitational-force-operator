function [x] = ikomsu( komsuno, i)


 if(komsuno ==1)
     x=i-1;
 elseif(komsuno ==2)
    x= i;
 elseif(komsuno ==3)
    x= i+1;
 elseif(komsuno ==4)
    x= i-1;
 elseif(komsuno ==5)
    x= i+1;
 elseif(komsuno ==6)
   x= i-1;
 elseif(komsuno ==7)
   x= i;
 elseif(komsuno ==8)
   x= i+1;
 else
    x=i;
 
 end


end