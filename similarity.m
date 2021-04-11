%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% All rights reserved.
% This work should only be used for nonprofit purposes.
% Please cite the paper when you use this code:
% KATIRCIOÐLU, F., & CÝNGÝZ, Z. (2020). A Novel Gray Image Enhancement 
% Using the Regional Similarity Transformation Function and Dragonfly Algorithm. 
% El-Cezeri Journal of Science and Engineering, 7(3), 1201-1219.
%
% AUTHOR:
%     Ferzan Katýrcýoðlu,Duzce University, TURKEY.
%     email:katirciogluferzan@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [S]= similarity(x)


[xlen ylen] =size(x);

S=zeros(xlen, ylen);

for i=2:1:xlen-1
    for j=2:1:ylen-1
        
            %--------------------------------------------------------
        %Getting the values in the mask
        maskGray=zeros(1,9) ;
        resim=zeros(1,9) ; 
          for b=1:9;
          [m]=ikomsu(b,i);
          [n]=jkomsu(b,j);
          [res]=resimdemi(m,n,xlen,ylen);
          resim(b)=res;
                        if(resim(b)==1)
                            gray= x(m,n); 
                            maskGray (b) =gray;
                        else
                            maskGray (b) =0;
                        end
          end
  % Distance and similarity are calculated between 9 pixels in the mask and the result is determined.
       DN=150;
       sim=0;
       sum=0;
      for b=1:9
                   sim (b)=similarity1(maskGray(b),maskGray(9),DN);
                   sum=sim(b)+sum;    
      end
         %---------------------------------------------------------
     
         
          S(i,j)=sum/9;
          
              
    end
end 


end
%------------------------------------------------------------------------
%FUNCTIONS
%-----------------------------------------------------------------------
function [ res ] = resimdemi(x,y,w,h )

 if(x<1 || x>w-1 || y<1 || y>h-1)
    res=0;
 else
    res=1;


 end
end
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
 elseif(komsuno ==9)
    x=i;
 else
 x=0;
 end


 end

 function [y] = jkomsu( komsuno, j )

 if(komsuno ==1)
    y= j-1;
 elseif(komsuno ==2)
    y= j-1;
 elseif(komsuno ==3)
   y= j-1;
 elseif(komsuno ==4)
   y= j;
 elseif(komsuno ==5)
   y= j;
 elseif(komsuno ==6)
   y= j+1;
 elseif(komsuno ==7)
   y= j+1;
 elseif(komsuno ==8)
   y= j+1;
 elseif(komsuno ==9)
    y= j;
 else
   y=0;
 end


 end

 
function [sim] = similarity1( k, o, DN)

 
 a=0;b=0;c=0;
 a=abs(k-o);
%  b=(abs(l-p))^2;
%  c=(abs(m-r))^2;
%  //Distance calculation based on the Euclidean relation
 dist=a;

% %  //Calculation of similarity based on linear function
 arahes=dist/DN;
 sim=1 - arahes;
%  sim=exp(-dist/DN);


end




