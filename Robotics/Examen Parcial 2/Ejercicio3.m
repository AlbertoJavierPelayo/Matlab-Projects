clear all
close all
img_rgb=imread('leaf_disease.jpg');

[fil,col,c]=size(img_rgb);%tamaño de la imagen
img_R=img_rgb(:,:,1);
img_G=img_rgb(:,:,2);
img_B=img_rgb(:,:,3);

img_hsv=rgb2hsv(img_rgb);
img_ycbcr=rgb2ycbcr(img_rgb);
%figure;
%imshow(img_hsv);

img_out = uint8(zeros(fil,col,c));

img_s=img_ycbcr(:,:,2);

img_F1 = F1(img_rgb);%REGLA 1 hsv canal 1
img_F2 = F2(img_rgb);%REGLA 2 hsv canal 2
img_F3 = F3(img_rgb);%REGLA 3 ycbcr canal 1 - y
img_F4 = F4(img_rgb);%REGLA 4 ycbcr canal 2 -cb
img_F5 = F5(img_rgb);%REGLA 5 ycbcr canal 3 - cr
img_F6 = F6(img_rgb);%REGLA 6 rgb
img_F7 = F7(img_rgb);%REGLA 7 hsv canal 3


for x = 1:fil
    for y = 1:col
        if(img_F1(x,y)==1)&&(img_F2(x,y)==1)&&(img_F3(x,y)==1)&&(img_F4(x,y)==1)&&(img_F5(x,y)==1)&&(img_F6(x,y)==1)&&(img_F7(x,y)==1)
            img_out(x,y,1)=0;%rojo
            img_out(x,y,2)=0;%verde
            img_out(x,y,3)=0;%azul
        else
            img_out(x,y,1)=img_R(x,y);%rojo
            img_out(x,y,2)=img_G(x,y);%verde
            img_out(x,y,3)=img_B(x,y);%azul
        end
    end
end

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_out);
