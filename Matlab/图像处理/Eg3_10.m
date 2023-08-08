Image=im2double(imread('cameraman.tif '));
NewImage1=imrotate(Image,20);
NewImage2=imrotate(Image,20,'bilinear');
% imwrite(NewImage1,'rotate11.jpg');
% imwrite(NewImage2,'rotate12.jpg');
subplot(1,3,1),imshow(Image),title('原图');
subplot(1,3,2),imshow(NewImage1),title('最近邻插值旋转结果');
subplot(1,3,3),imshow(NewImage2),title('双线性插值旋转结果');
