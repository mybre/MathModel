clear all;close all;clc;
Image=im2double(imread('house.png'));
Image=rgb2gray(Image);
figure,imshow(Image),title('ԭͼ��');
BW= edge(Image,'canny');
figure,imshow(BW),title('Canny��Ե���');
% imwrite(Image,'ԭͼ��.jpg');
% imwrite(BW,'Canny��Ե���.jpg');
