I=imread('cameraman.tif');
J=I*0.5;
K=I*2;
imwrite(J,'���ԻҶȱ䰵.jpg');
imwrite(K,'���ԻҶȱ���.jpg');
subplot(2,2,1);imshow(I);title('ԭͼ');
subplot(2,2,2);imshow(J);title('k=0.5,�䰵');
subplot(2,2,3);imshow(K);title('k=2,����');

