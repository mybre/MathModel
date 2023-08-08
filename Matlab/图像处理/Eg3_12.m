Image=im2double(imread('lena256.bmp'));
tform1=maketform('affine',[1 0 0;0.5 1 0; 0 0 1]);
tform2=maketform('affine',[1 0.5 0;0 1 0; 0 0 1]);
NewImage1=imtransform(Image,tform1);
NewImage2=imtransform(Image,tform2);
subplot(1,2,1),imshow(NewImage1),title('水平错切');
subplot(1,2,2),imshow(NewImage2),title('垂直错切');
% imwrite(NewImage1,'水平错切.bmp');
% imwrite(NewImage2,'垂直错切.bmp');
