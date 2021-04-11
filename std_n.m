function s = std_n (image, mn)
%function to compute local standard devaiation matrix of input image

i = image;
s = size (i);

%append values to get matrix to desired size for convolution
vr = zeros(1,s(2));
i1 =[vr;i;vr];
s2 = size(i1);
vc=zeros(s2(1),1);
i1=[vc i1 vc];

mn1 =[vr;mn;vr];
mn1=[vc mn1 vc];
i11 = zeros(size(i1));

%compute standard deviation
for lx=2:s(1)+1
    for ly=2:s(2)+1
       aa = i1(lx-1:lx+1,ly-1:ly+1);
       a1 = aa-(repmat(mn1(lx,ly),3,3));
       a1 = a1.^2;
       am = mean(a1(:));
       i11(lx,ly) = am.^0.5;
    end
end

%remove appended values to get original size matrix
s =  i11(2:s(1)+1,2:s(2)+1);


        








