clear all;close all;clc;
Image=im2double(imread('football.jpg'));
Templet=im2double(imread('footballtemplet.jpg'));
result=immultiply(Templet,Image);
% imwrite(result,'��˽��.jpg');
subplot(131),imshow(Image),title('����');
subplot(132),imshow(Templet),title('ģ��');
subplot(133),imshow(result),title('��˽��');
