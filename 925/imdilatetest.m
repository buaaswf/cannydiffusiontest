bw=imread('E:\geo\testbmps\0o.bmp');
bw1=im2bw(bw,0.6);
I=bw1;
% figure(1);
% imshow(bw1);
% s=ones(3);
% bw2=imdilate(bw1,s);
% figure(2);
% imshow(bw2)
% figure(1);
% se=strel('square',10);
% grad=imdilate(I,se)-imerode(I,se);
% imshow(grad);
im=imdilate(I,se);
imshow(im);
% se1=strel('line',10,180);
% figure(2),imshow(imdilate(I,se1));
se2=strel('line',10,90);
figure(3),imshow(imdilate(I,se2));
