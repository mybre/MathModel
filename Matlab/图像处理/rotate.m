img1=imread('lena.bmp');
figure,imshow(img1);
img2=imrotate(img1,45);%˫���Բ�ֵ����תͼ�񣬲��ü�ͼ��ʹ���ԭͼ���Сһ��
%A=imrotate��A��angle,'��תʵ�ֵķ���'��'BBox'��: 'nearest'    'bilinear'
%'bicubic';bbox :��һ����2��ѡ�� һ���ǡ�loose�� ����һ���ǡ�crop��
img3=imrotate(img1,90);
img4=imrotate(img1,135);
figure,imshow(img2);
figure,imshow(img3);
figure,imshow(img4);
imwrite(img1,'��ת1.jpg');
imwrite(img2,'��ת2.jpg');
imwrite(img3,'��ת3.jpg');
imwrite(img4,'��ת4.jpg');
