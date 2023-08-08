%读入原始图像
cover_object=imread('lena.bmp');
message=imread('xigua.jpg');
I1=imcrop(cover_object,[256 90 256 90]);
%利用裁剪函数imcrop裁剪图像，格式：I2=imcrop(I,[a b c d]);其中I为读入的待裁剪的图像,（a,b）表示裁剪后左上角像素在原图像中的位置；c表示裁剪后图像的宽，d表示裁剪后图像的高
I2=imcrop(message,[256 90 256 90])
figure(1)
subplot(1,2,1);
imshow(I1,[]);%直接用imshow（I）来显示，出来的只有黑白图像
%在imshow里面添加一个空矩阵[]，才能显示正常的灰度图像
xlabel('(a)');
subplot(1,2,2);
imshow(I2,[]);
xlabel('(b)');
