clear all;close all;clc;
Image = imread('football.jpg');
Templet = imread('footballtemplet.jpg');
result1 = bitcmp(Image );
result2 = bitand(Templet,Image );
result3 = bitor(Templet,Image );
result4 = bitxor(Templet,Image );
subplot(231),imshow(Image ),title('原图');
subplot(232),imshow(Templet),title('模板');
subplot(233),imshow(result1),title('求反');
subplot(234),imshow(result2),title('相与');
subplot(235),imshow(result3),title('相或');
subplot(236),imshow(result4),title('异或');
% imwrite(result1,'求反.jpg');
% imwrite(result2,'相与.jpg');
% imwrite(result3,'相或.jpg');
% imwrite(result4,'异或.jpg');
