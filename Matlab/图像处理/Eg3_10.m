Image=im2double(imread('cameraman.tif '));
NewImage1=imrotate(Image,20);
NewImage2=imrotate(Image,20,'bilinear');
% imwrite(NewImage1,'rotate11.jpg');
% imwrite(NewImage2,'rotate12.jpg');
subplot(1,3,1),imshow(Image),title('ԭͼ');
subplot(1,3,2),imshow(NewImage1),title('����ڲ�ֵ��ת���');
subplot(1,3,3),imshow(NewImage2),title('˫���Բ�ֵ��ת���');
