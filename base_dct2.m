function imf=base_dct2(A1,A2)
%compute  DCT for each 2*2 block and apply  DCT ,fusion rule and IDCT or if
%the image size is divisible by 4 then 4*4 block is also preferable

[r,c]=size(A1);
s=2;  %This is set based on rows and coloumns of images are even and divided by 2
for i=1:s:r
    for j=1:s:c
        s1 = A1(i:i+s-1,j:j+s-1);
        s2 = A2(i:i+s-1,j:j+s-1);
         P1=dct2(s1);
         P2=dct2(s2);
         C= fusionrule(P1,P2,P1,P2);
        bbf=idct2(C); %Block based fused base image
        imf(i:i+s-1,j:j+s-1)=bbf;        
    end
end

