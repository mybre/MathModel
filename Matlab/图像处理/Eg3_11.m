Image = im2double(imread('lena256.bmp'));
NewImage1 = imresize(Image,1.2,'nearest');
NewImage2 = imresize(Image,1.2,'bilinear');
% imwrite(NewImage1,'�����1.2����ֵ.jpg');
% imwrite(NewImage2,'˫����1.2����ֵ.jpg');
subplot(1,3,1),imshow(Image),title('ԭͼ');
subplot(1,3,2),imshow(NewImage1),title('�����1.2����ֵ');
subplot(1,3,3),imshow(NewImage2),title('˫����1.2����ֵ');
