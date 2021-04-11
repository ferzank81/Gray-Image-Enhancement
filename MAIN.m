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
%THIS IS A DEMO FOR NOVEL IMAGE ENHANCEMENT USING GRAVÝTATÝONAL SEARCH ALGORITHM 
clc;
clear all;
close all;

%READ IMAGE
i=imread('test5.bmp');
i=imresize(i,1);  

%--------------------------------------------------------------------------
%GLOBAL MEAN
frekans=zeros(256,1);

% It records by counting how many times each pixel value is.

for k=1:size(i,1)
    for l=1:size(i,2)

        value=i(k,l);
       frekans(value+1)=frekans(value+1)+1; 

    end
end
deger=max(frekans);
for k=1:256
    if deger==frekans(k)
        D=k;
    end
end
D=double(D/255);
image = im2double(i);
global_mean = D;
%--------------------------------------------------------------------------
% LOCAL MEAN
Bmean = mean_n(image);
%--------------------------------------------------------------------------
%SIMILARITY
[S]=similarity(i);
B=double(S);
%--------------------------
C = std_n(image,Bmean);
im_size = size(image);
%-------------------------------------------------------------------------
%OPTIMIZATION PARAMETERS
N=15; % Agent number;
Max_iteration=15;
%-------------------------------------------------------------------------
%CALL FUNCTION 

[parameters Fbest BestChart MeanChart] = GSA_enhancement2(image,global_mean,B,C,im_size, N, Max_iteration);

enh = trans(i,image, B, C, global_mean, parameters(1),parameters(2),parameters(3),parameters(4) );

figure;
imshow(image);
figure;
imshow(enh);
   
