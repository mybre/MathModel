%����ԭʼͼ��
cover_object=imread('lena.bmp');
message=imread('xigua.jpg');
I1=imcrop(cover_object,[256 90 256 90]);
%���òü�����imcrop�ü�ͼ�񣬸�ʽ��I2=imcrop(I,[a b c d]);����IΪ����Ĵ��ü���ͼ��,��a,b����ʾ�ü������Ͻ�������ԭͼ���е�λ�ã�c��ʾ�ü���ͼ��Ŀ�d��ʾ�ü���ͼ��ĸ�
I2=imcrop(message,[256 90 256 90])
figure(1)
subplot(1,2,1);
imshow(I1,[]);%ֱ����imshow��I������ʾ��������ֻ�кڰ�ͼ��
%��imshow�������һ���վ���[]��������ʾ�����ĻҶ�ͼ��
xlabel('(a)');
subplot(1,2,2);
imshow(I2,[]);
xlabel('(b)');
