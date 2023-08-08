img5=imread('lena.bmp');
se=translate(strel(1),[20 20]);%将一个平面结构化元素分别向下和向右移动20个位置  %前一个20是向下平移量，后一个20是向右平移量 
img6=imdilate(img5,se);%利用膨胀函数平移图像
figure,imshow(img6);
figure('name','对比')
subplot(121);imshow(img5), title('原图')
subplot(122);imshow(img6), title('移动后的图像');