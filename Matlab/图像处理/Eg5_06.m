clear all;close all;clc;
Image=imread('lena256.bmp');
histgram=zeros(256);                                    
[h w]=size(Image);
for x=1:w
    for y=1:h                                         %循环扫描
        histgram(Image(y,x)+1)=histgram(Image(y,x)+1)+1;   %统计并累加
    end
end
figure,imshow(Image);title('灰度图像');
figure,stem(histgram(),'.'); title('定义统计直方图');
axis tight;
%colormap(white)
figure,imhist(Image); title('系统函数统计直方图');
axis tight;
%colormap(white);
