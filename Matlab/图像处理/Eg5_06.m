clear all;close all;clc;
Image=imread('lena256.bmp');
histgram=zeros(256);                                    
[h w]=size(Image);
for x=1:w
    for y=1:h                                         %ѭ��ɨ��
        histgram(Image(y,x)+1)=histgram(Image(y,x)+1)+1;   %ͳ�Ʋ��ۼ�
    end
end
figure,imshow(Image);title('�Ҷ�ͼ��');
figure,stem(histgram(),'.'); title('����ͳ��ֱ��ͼ');
axis tight;
%colormap(white)
figure,imhist(Image); title('ϵͳ����ͳ��ֱ��ͼ');
axis tight;
%colormap(white);
