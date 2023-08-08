clear all;close all;clc;
Image=im2double(imread('house.png'));
Image=rgb2gray(Image);
figure,imshow(Image),title('Ô­Í¼Ïñ');
BW= edge(Image,'canny');
figure,imshow(BW),title('Canny±ßÔµ¼ì²â');
% imwrite(Image,'Ô­Í¼Ïñ.jpg');
% imwrite(BW,'Canny±ßÔµ¼ì²â.jpg');
