function o = tr_op(global_mean,B,C,im_size,image,a,b,c,k)
%function to compute transformed image and its cost value as well
Bmean = mean_n(image);
%compute transformed image
g = zeros(im_size);
x=C+b;
w=k.*global_mean;
K=w./x;
% g=(c-B)+image*a+K;
g=[abs(c*B.*image-k*global_mean)./(B+b)]+[(B.^a).*image];



%compute cost value
image = g;
entropy_image = entropy (image);
aa = edge(image,'sobel');
h_s = im_size(1);
v_s = im_size(2);
edge_pix = sum(sum(aa));
enh = sobel_enh_conv(image);
edge_intensity = sum(enh(:));
% o = (log(log(edge_intensity)))* (edge_pix* (exp(entropy_image)))/(h_s*v_s);
o = (log(log(edge_intensity)))* (edge_pix* ((entropy_image)))/(h_s*v_s);








