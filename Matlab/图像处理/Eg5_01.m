I=imread('cameraman.tif');
J=I*0.5;
K=I*2;
imwrite(J,'线性灰度变暗.jpg');
imwrite(K,'线性灰度变亮.jpg');
subplot(2,2,1);imshow(I);title('原图');
subplot(2,2,2);imshow(J);title('k=0.5,变暗');
subplot(2,2,3);imshow(K);title('k=2,变亮');

