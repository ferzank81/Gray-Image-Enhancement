function s1= mean_n (image)
%function to compute local mean values

i = image;
[si1 si2] = size(i);

mask = [1 1 1; 1 1 1; 1 1 1];
result = conv2(mask,i);
s = result./9;

%remove extra values from convolved matrix
s1 = s(2:si1+1,2:si2+1);



