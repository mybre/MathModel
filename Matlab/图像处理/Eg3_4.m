clear all;close all;clc;
I=double(imread('football.jpg'));
J=double(imread('footballtemplet.jpg'));
Ip = imdivide(I, J);
subplot(131),imshow(uint8(I)),title('����ͼ');
subplot(132),imshow(uint8(J)),title('ģ��');
subplot(133),imshow(Ip),title('������');
% imwrite(Ip,'������.jpg');
