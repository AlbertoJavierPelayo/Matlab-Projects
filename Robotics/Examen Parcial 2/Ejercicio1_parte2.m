clear all
close all
img_rgb=imread('fire_forest.jpg');

[fil,col,c]=size(img_rgb);%tamaño de la imagen

img_R=img_rgb(:,:,1);%imagen en rojo
img_G=img_rgb(:,:,2);%imagen en verde
img_B=img_rgb(:,:,3);%imagen en azul

img_R1 = R1(img_rgb);%REGLA 1
img_R2 = R2(img_rgb);%REGLA 2
img_R3 = R3(img_rgb);%REGLA 3
img_R4 = R4(img_rgb);%REGLA 4
img_R5 = R5(img_rgb);%REGLA 5
img_R6 = R6(img_rgb);%REGLA 6
img_R7 = R7(img_rgb);%REGLA 7

img_fire=zeros(fil,col,c);

for x = 1:fil
    for y = 1:col
        if(img_R1(x,y)==1)&&(img_R2(x,y)==1)&&(img_R3(x,y)==1)&&(img_R4(x,y)==1)&&(img_R5(x,y)==1)&&(img_R6(x,y)==1)&&(img_R7(x,y)==1)
            img_fire(x,y,1)=0;%rojo
            img_fire(x,y,2)=255;%verde
            img_fire(x,y,3)=0;%azul
        else
            img_fire(x,y,1)=img_R(x,y);%rojo
            img_fire(x,y,2)=img_G(x,y);%verde
            img_fire(x,y,3)=img_B(x,y);%azul
        end
    end
end

img_fire = uint8(img_fire);

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_fire);