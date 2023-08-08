clear all;close all;clc;
Image=im2double(imread('football.jpg'));
Templet=im2double(imread('footballtemplet.jpg'));
result=immultiply(Templet,Image);
% imwrite(result,'相乘结果.jpg');
subplot(131),imshow(Image),title('背景');
subplot(132),imshow(Templet),title('模板');
subplot(133),imshow(result),title('相乘结果');
