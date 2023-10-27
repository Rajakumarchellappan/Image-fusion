
%Please cite this paper if you use this code
% Rajakumar, C. and Satheeskumaran, S., 2021. 
% QRCP decomposition-based hybrid approach for fusion of visible and infrared images. Circuits, Systems, and Signal Processing, 40(12), 
% pp.6146-6172.
% Proper selection of x in qrcp_1.m , window size(default value=3)in SFR.m and threshold value(default value=0.015) in fusionrule.m 
% provides good result. 
close all
clear all
clc
IR=double(imread('C:\Users\User\Desktop\IV images\IR2.png'));  % Set your own  path to read infrared image
VI=double(imread('C:\Users\User\Desktop\IV images\VIS2.jpg'));  % Set your own  path to read visible image
[qi,ri,pi]=qr(IR);
[qv,rv,pv]=qr(VI);
x=input('Number of rank -1 matrix for base layer=')  % Prefered value is 50 to 150 or it may vary depending on the image
b1=qi(:,1:x)*qi(:,1:x)'*IR;
b2=qv(:,1:x)*qv(:,1:x)'*VI;
figure(1)
imshow([b1,b2],[])
title('Base Layer')
% Construction of Weight Map
w1=b1./(b1+b2);
w2=b2./(b1+b2);
figure(2)
imshow([w1,w2],[])
title('weight Maps')
% Detail Layer Fusion
d1=IR-b1;% detail layer infrared
d2=VI-b2; % detail layer visible
d=(w1.*d1)+(w2.*d2);
figure(3)
imshow(d,[])
title('fused detail layer')
 % Base Layer Fusion
imf=base_dct2(b1,b2);
%Final Fused Layer
F=imf+d;
figure(4)
imshow(F,[])
title('Fused Image')



