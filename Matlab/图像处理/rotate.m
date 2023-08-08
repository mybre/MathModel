img1=imread('lena.bmp');
figure,imshow(img1);
img2=imrotate(img1,45);%双线性插值法旋转图像，并裁剪图像，使其和原图像大小一致
%A=imrotate（A，angle,'旋转实现的方法'，'BBox'）: 'nearest'    'bilinear'
%'bicubic';bbox :这一项有2个选择 一个是‘loose’ 另外一个是‘crop’
img3=imrotate(img1,90);
img4=imrotate(img1,135);
figure,imshow(img2);
figure,imshow(img3);
figure,imshow(img4);
imwrite(img1,'旋转1.jpg');
imwrite(img2,'旋转2.jpg');
imwrite(img3,'旋转3.jpg');
imwrite(img4,'旋转4.jpg');
