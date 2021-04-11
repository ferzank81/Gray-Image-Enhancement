function s = sobel_enh_conv (image)

 
%pgm to generate sobel enhanced image for use in evaluation function

m = [-1 -2 -1;0 0 0;1 2 1];
m2 = m';
i = image;

[si1 si2] = size(i);

result = conv2(m,i);
result1 = conv2 (m2,i);

result = result(2:si1+1, 2:si2+1);
result1 = result1(2:si1+1, 2:si2+1);

% SOBEL EDGE DETECTION
result1 = result1.^2;
result = result.^2;
final = result1 + result;
final = final.^(0.5);


s = final;

