I=imread('E:\geo\testbmps\0o.bmp');
% imshow(I)
%  I=rgb2gray(I);
I=double(I);
%laplace ÔöÇ¿
% h=[0 1 0,1 -4 1,0 1 0];
% Ilaplace=conv2(I,h,'same');
% I=I-Ilaplace;
% imshow(I);
[Ix,Iy]=gradient(I);

direction=[(Iy+1)./(Ix+1)];
dirction=direction;
I1=I;
[m,n]=size(dirction);
d=1;
for j=d+1:1:n-d
for i=d+1:1:m-d
% if(dirction(i,j)>1&&Ix(i,j)>0) dirction(i,j)=I(i,j)* (Ix(i,j).^2+Iy(i,j).^2)/(1+(Ix(i,j).^2+Iy(i,j).^2))+I(i+1,j+1)*1/(1+(Ix(i,j).^2+Iy(i,j).^2));
% if(dirction(i,j)>1&&Iy(i,j)<0)dirction(i,j)=I(i,j)* (Ix(i,j).^2+Iy(i,j).^2)/(1+(Ix(i,j).^2+Iy(i,j).^2))+I(i+1,j-1)*1/(1+(Ix(i,j).^2+Iy(i,j).^2));
% if(dirction(i,j)<1&&dirction(i,j)>0&&Ix(i,j)>0)dirction(i,j)=I(i,j)* (Ix(i,j).^2+Iy(i,j).^2)/(1+(Ix(i,j).^2+Iy(i,j).^2))+I(i,j+1)*1/(1+(Ix(i,j).^2+Iy(i,j).^2));
% if(dirction(i,j)<1&&dirction(i,j)>0&&Ix(i,j)<0)dirction(i,j)=I(i,j)* (Ix(i,j).^2+Iy(i,j).^2)/(1+(Ix(i,j).^2+Iy(i,j).^2))+I(i,j-1)*1/(1+(Ix(i,j).^2+Iy(i,j).^2));
% if(dirction(i,j)<0&&dirction(i,j)>-1&&Ix(i,j)<0)dirction(i,j)=I(i,j)* (Ix(i,j).^2+Iy(i,j).^2)/(1+(Ix(i,j).^2+Iy(i,j).^2))+I(i,j+1)*1/(1+(Ix(i,j).^2+Iy(i,j).^2));
% if(dirction(i,j)<0&&dirction(i,j)>-1&&Ix(i,j)>0)dirction(i,j)=I(i,j)* (Ix(i,j).^2+Iy(i,j).^2)/(1+(Ix(i,j).^2+Iy(i,j).^2))+I(i,j-1)*1/(1+(Ix(i,j).^2+Iy(i,j).^2));
% if(dirction(i,j)<-1&&Iy(i,j)<0)dirction(i,j)=I(i,j)* (Ix(i,j).^2+Iy(i,j).^2)/(1+(Ix(i,j).^2+Iy(i,j).^2))+I(i,j-1)*1/(1+(Ix(i,j).^2+Iy(i,j).^2));
% if(dirction(i,j)<-1&&Iy(i,j)>0)dirction(i,j)=I(i,j)* (Ix(i,j).^2+Iy(i,j).^2)/(1+(Ix(i,j).^2+Iy(i,j).^2))+I(i,j+1)*1/(1+(Ix(i,j).^2+Iy(i,j).^2));
% G=sqrt(Ix(i,j).^2+Iy(i,j).^2);
 G=exp((Ix(i,j).^2+Iy(i,j).^2));
%  G=1/G;
% G=1/sqrt(Ix(i,j).^2+Iy(i,j).^2);
delta=50;
condition=abs(Ix(i,j))<delta&&abs(Iy(i,j))<delta;
if(dirction(i,j)>=0.42447&&dirction(i,j)<=2.4751&&Ix(i,j)>=0&&Iy(i,j)>=0&&condition)
    I1(i,j)=I(i,j)* G/(1+G)+I(i+1*d,j+1*d)*	1/(1+G);
elseif(dirction(i,j)>=0.42447&&dirction(i,j)<=2.4751&&Ix(i,j)<0&&Iy(i,j)<=0&&condition)
    I1(i,j)=I(i,j)* G/(1+G)+I(i-d,j-d)*1/(1+G);
elseif(((dirction(i,j)<=-2.3559)||(dirction(i,j)>=2.4751))&&(Iy(i,j)>=0)&&condition) 
    I1(i,j)=I(i,j)* G/(1+G)+I(i,j+d)*1/(1+G);
elseif((dirction(i,j)<=-2.3559||dirction(i,j)>=2.4751)&&(Iy(i,j)<=0)&&condition)
    I1(i,j)=I(i,j)* G/(1+G)+I(i,j-d)*1/(1+G);
elseif((dirction(i,j)>=-2.3559&&dirction(i,j)<=-0.21256)&&Ix(i,j)<=0&&Iy(i,j)>=0&&condition)
    I1(i,j)=I(i,j)* G/(1+G)+I(i-d,j+d)*1/(1+G);
elseif((dirction(i,j)>=-2.3559&&dirction(i,j)<=-0.21256)&&Ix(i,j)<=0&&Iy(i,j)>=0&&condition)
    I1(i,j)=I(i,j)* G/(1+G)+I(i+d,j-d)*1/(1+G);
elseif((dirction(i,j)>-0.21256&&dirction(i,j)<=0.42447)&&Ix(i,j)<0&&condition) 
    I1(i,j)=I(i,j)* G/(1+G)+I(i-d,j)*1/(1+G);
elseif((dirction(i,j)>=-0.21256&&dirction(i,j)<=0.42447)&&Ix(i,j)>=0&&condition)
    I1(i,j)=I(i,j)* G/(1+G)+I(i+d,j)*1/(1+G);
else I1(i,j)=I(i,j);
% if(dirction(i,j)>0.42447&&dirction(i,j)<2.4751&&Ix(i,j)>0&&Iy(i,j)>0)
% %     I1(i,j)=I(i,j)* (Ix(i,j)+Iy(i,j))/(1+(Ix(i,j)+Iy(i,j)))+I(i+1,j+1)*1/(1+(Ix(i,j)+Iy(i,j)));
%  I1(i,j)=I(i,j)* 1/4+I(i+1,j+1)*3/4;   
% elseif(dirction(i,j)>0.42447&&dirction(i,j)<2.4751&&Ix(i,j)<0&&Iy(i,j)<0)
%  I1(i,j)=I(i,j)* 1/4+I(i-1,j-1)*3/4;   
% elseif(((dirction(i,j)<-2.3559)||(dirction(i,j)>2.4751))&&(Iy(i,j)>0)) 
%     I1(i,j)=I(i,j)* 1/4+I(i,j+1)*3/4;   
% elseif((dirction(i,j)<-2.3559||dirction(i,j)>2.4751)&&(Iy(i,j)<0))
%    I1(i,j)=I(i,j)* 1/4+I(i+1,j-1)*3/4;
% elseif((dirction(i,j)>-2.3559&&dirction(i,j)<-0.21256)&&Ix(i,j)<0&&Iy(i,j)>0)
%     I1(i,j)=I(i,j)* 1/4+I(i-1,j+1)*3/4;
% elseif((dirction(i,j)>-2.3559&&dirction(i,j)<-0.21256)&&Ix(i,j)<0&&Iy(i,j)>0)
%     I1(i,j)=I(i,j)* 1/4+I(i+1,j-1)*3/4;
% elseif((dirction(i,j)>-0.21256&&dirction(i,j)<0.42447)&&Ix(i,j)<0) 
%     I1(i,j)=I(i,j)* 1/4+I(i-1,j)*3/4;
% elseif((dirction(i,j)>-0.21256&&dirction(i,j)<0.42447)&&Ix(i,j)>0)
%      I1(i,j)=I(i,j)* 1/4+I(i+1,j)*3/4;
% else I1(i,j)=I(i,j);
end
end
end
% end
% end
% end
% end
% 
% end
% end
% end

% I=imread('E:\geo\testbmps\1.bmp');
I=uint8(I);
I1=uint8(I1);
if(I1==I)
    disp('aaa');
end
% figure,imshow(I);
% dirction=im2uint8(dirction);
% Iaaa=I./2+dirction./2;
% figure,imshow(Iaaa);
imshow(I1);
imwrite(I1,'E:\geo\testbmps\t0oebgconditiond1.bmp');
figure,imshow(I1-I);
imwrite(histeq(I1),'E:\geo\testbmps\histeqtestline2925.bmp');
%%# Read an image
%# Create the gaussian filter with hsize = [5 5] and sigma = 2
G = fspecial('gaussian',[5 5],2);
%# Filter it
Ig = imfilter(I1,G,'same');
%# Display
imshow(Ig)
imwrite(Ig,'E:\geo\testbmps\t0oeguass.bmp');