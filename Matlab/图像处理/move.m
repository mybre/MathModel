img5=imread('lena.bmp');
se=translate(strel(1),[20 20]);%��һ��ƽ��ṹ��Ԫ�طֱ����º������ƶ�20��λ��  %ǰһ��20������ƽ��������һ��20������ƽ���� 
img6=imdilate(img5,se);%�������ͺ���ƽ��ͼ��
figure,imshow(img6);
figure('name','�Ա�')
subplot(121);imshow(img5), title('ԭͼ')
subplot(122);imshow(img6), title('�ƶ����ͼ��');