clear al;close all;clc;
Image = imread('football.jpg'); %��ͼ�񲢽�����ֵת����[0,1]
gray=rgb2gray(Image);
im=im2bw(gray);
subplot(231),imshow(Image),title('��ɫͼ��');
subplot(232),imshow(gray),title('�Ҷ�ͼ��');
subplot(233),imshow(im),title('��ֵͼ��');
%��ʽʵ��ת��
r = Image( : , : ,1); %��ȡ��ɫͨ��
g = Image( : , : ,2); %��ȡ��ɫͨ��
b = Image( : , : ,3); %��ȡ��ɫͨ��
Y = 0.299*r + 0.587*g + 0.114*b; %��������ֵYʵ�ֻҶȻ�
I = (r + g + b)/3; %��������ֵIʵ�ֻҶȻ�
BW = zeros(size(Y));
BW(Y>80) = 1; %��ֵΪ80,ʵ�ֻҶ�ͼ��ֵ��
subplot(234),imshow(Y),title('����ͼ Y');
subplot(235),imshow(I),title('�Ҷ�ͼ��I ');
subplot(236),imshow(BW),title('��ֵͼ��');
imwrite(gray,'gray.jpg');
imwrite(im,'im.jpg');
imwrite(Y,'����ͼ Y.jpg');
imwrite(I,'�Ҷ�ͼI.jpg');
imwrite(BW,'�Զ���ֵ��ֵͼ.jpg');
