function cp=SFR(matrix)
% Compute the spatial frequency (SF) of image or subbbands of NSCT.

% X.B. Qu, J.W. Yan, H.Z. Xiao, et al., Image fusion algorithm based on spatial
% frequency-motivated pulse coupled neural networks in nonsubsampled
% contourlet transform domain, Acta Automatica Sinica 34 (12) (2008) 1508¨C
% 1514.

%=============================================================
% disp('SF is computing...')
[row,column]=size(matrix);
cp=zeros(row,column);
window_wide=3;
spread=(window_wide-1)/2;
matrix_en=padarray(matrix,[spread spread],'symmetric');
temp=matrix_en.*0;
for i=1:row
    for j=1:column
        temp(i,j)=((matrix_en(i+1,j+1)-matrix_en(i+1,j))^2+(matrix_en(i+1,j+1)-matrix_en(i,j+1))^2);
    end
end
for i=1:row
    for j=1:column
        window=temp(i:1:(i+2*spread),j:1:(j+2*spread));
        cp(i,j)=sqrt(sum(window(:))./(window_wide.^2));
    end
end