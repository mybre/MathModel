Image = im2double(imread('lena256.bmp'));
NewImage1 = imresize(Image,1.2,'nearest');
NewImage2 = imresize(Image,1.2,'bilinear');
% imwrite(NewImage1,'最近邻1.2倍插值.jpg');
% imwrite(NewImage2,'双线性1.2倍插值.jpg');
subplot(1,3,1),imshow(Image),title('原图');
subplot(1,3,2),imshow(NewImage1),title('最近邻1.2倍插值');
subplot(1,3,3),imshow(NewImage2),title('双线性1.2倍插值');
