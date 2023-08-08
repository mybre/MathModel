clear al;close all;clc;
Image = imread('football.jpg'); %打开图像并将像素值转化到[0,1]
gray=rgb2gray(Image);
im=im2bw(gray);
subplot(231),imshow(Image),title('彩色图像');
subplot(232),imshow(gray),title('灰度图像');
subplot(233),imshow(im),title('二值图像');
%公式实现转换
r = Image( : , : ,1); %提取红色通道
g = Image( : , : ,2); %提取绿色通道
b = Image( : , : ,3); %提取蓝色通道
Y = 0.299*r + 0.587*g + 0.114*b; %计算亮度值Y实现灰度化
I = (r + g + b)/3; %计算亮度值I实现灰度化
BW = zeros(size(Y));
BW(Y>80) = 1; %阈值为80,实现灰度图二值化
subplot(234),imshow(Y),title('亮度图 Y');
subplot(235),imshow(I),title('灰度图像I ');
subplot(236),imshow(BW),title('二值图像');
imwrite(gray,'gray.jpg');
imwrite(im,'im.jpg');
imwrite(Y,'亮度图 Y.jpg');
imwrite(I,'灰度图I.jpg');
imwrite(BW,'自定阈值二值图.jpg');
