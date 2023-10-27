function img_out = F1(img_in)

[fil,col,c]=size(img_in);%tamaño de la imagen

%img_in=double(img_in);%casteo de la imagen de entrada

img_out=zeros(fil, col);%crear imagen vacia

% img_R=img_in(:,:,1);%imagen en rojo
% img_G=img_in(:,:,2);%imagen en verde
% img_B=img_in(:,:,3);%imagen en azul

img_hsv=rgb2hsv(img_in);

for x = 1:fil
    for y = 1:col
        if(img_hsv(x,y,1)>0.03)&&(img_hsv(x,y,1)<0.13)&&(img_hsv(x,y,3)>=0.95)
            img_out(x,y)=1;%valor de la imagen de salida
        else
            img_out(x,y)=0;%valor de la imagen de salida
        end
    end
end
