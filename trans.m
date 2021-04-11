function g= trans(i,image,B, C, global_mean, a,b,c,k)
%function to transform image to enhanced version

% global_mean = mean(image(:));
im_size = size(image);

g = zeros(im_size);
%--------------------------
% [S]=similarity(image); %Burasý yeni
% B=double(S);
%-----------------------------
% B = mean_n(image);
% C = std_n(image,B);
Bmean = mean_n(image);
x=C+b;
w=k.*global_mean;
K=w./x;
g=[abs(c*B.*image-k*global_mean)./(B+b)]+[(B.^a).*image];
% g=(c-B)+image*a+K;

