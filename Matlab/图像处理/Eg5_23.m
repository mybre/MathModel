Image=imread('house.png');
Image=rgb2gray(Image);
subplot(131),imshow(Image),title('ԭͼ��');
[h,w]=size(Image);
edgeImage=zeros(h,w);
for x=1:w-1
    for y=1:h-1
        edgeImage(y,x)=abs(Image(y,x+1)-Image(y,x))+abs(Image(y+1,x)-Image(y,x));
    end
end
sharpImage=Image+uint8(edgeImage);
subplot(132),imshow(edgeImage),title('�ݶ�ͼ��');
subplot(133),imshow(sharpImage),title('��ͼ��');
% imwrite(edgeImage,'�ݶ�ͼ��.jpg');
% imwrite(sharpImage,'��ͼ��.jpg');
