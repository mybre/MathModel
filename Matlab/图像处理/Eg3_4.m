clear all;close all;clc;
I=double(imread('football.jpg'));
J=double(imread('footballtemplet.jpg'));
Ip = imdivide(I, J);
subplot(131),imshow(uint8(I)),title('背景图');
subplot(132),imshow(uint8(J)),title('模板');
subplot(133),imshow(Ip),title('相除结果');
% imwrite(Ip,'相除结果.jpg');
