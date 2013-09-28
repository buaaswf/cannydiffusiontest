I=imread('E:\geo\testbmps\2o.bmp');
figure,imshow(I);
%单尺度形态学边缘检测
se=strel('square',3);
grad=imdilate(I,se)-imerode(I,se);
imshow(grad);
imwrite(grad,'imerode.bmp');
se1=strel('square',1);
s2=strel('square',3);
s3=strel('square',5);
s4=strel('square',7);
% grad1=imerode((imdilate(I,se2)-imerode(I,s2)),se1);
grad1=imerode((imdilate(I,s2)-imerode(I,s2)),se1);
grad2=imerode((imdilate(I,s3)-imerode(I,s3)),s2);
grad3=imerode((imdilate(I,s4)-imerode(I,s4)),s3);
multiscaleGrad=(grad1+grad2+grad3)/3;
figure,imshow(multiscaleGrad)
imwrite( multiscaleGrad,'E:\geo\testbmps\2obmpmulti.bmp');
% grad1=imerode((imdilate(I,s2)-imerode(I,s2)),se1);
% grad2=imerode((imdilate(I,s3)-imerode(I,s3)),s2);
% grad3=imerode((imdilate(I,s4)-imerode(I,s4)),s3);
% multiscaleGrad=(grad1+grad2+grad3)/3;
% figure,imshow(multiscaleGrad)
% imwrite( multiscaleGrad,'multi.bmp');
 multiscaleGrad=rgb2gray(multiscaleGrad);
histeqmultiscaleGrad=histeq(multiscaleGrad);
imshow(histeqmultiscaleGrad);
imwrite(histeqmultiscaleGrad,'E:\geo\testbmps\Histeq2obmpmulti.bmp');