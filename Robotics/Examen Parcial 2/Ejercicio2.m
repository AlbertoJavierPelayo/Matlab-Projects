clear all
close all
img_rgb=imread('baboon.png');

[fil,col,c]=size(img_rgb);%tamaño de la imagen
img_rgb = double(img_rgb);
img_rot = zeros(fil,col,c);

angulo_theta=pi/4;
M_angulos=[cos(angulo_theta),sin(angulo_theta);-sin(angulo_theta),cos(angulo_theta)];
aux=zeros(2,2);
M_const  = [0;362];

for x = 1:fil
    for y = 1:col
        M_val=[x;y];
        aux=(M_angulos*M_val)+M_const;
        v=round(aux(1));
        s=round(aux(2));
        %if(v<=fil)&&(s<=col)&&(v>=1)&&(s>=1)
            img_rot(v,s,:)=img_rgb(x,y,:);
        %end

        
    end
end



img_rec=zeros(fil,col,c);

[filas,columnas,canales]=size(img_rot);%tamaño de la imagen

filas_aux=round((filas-fil)/2);
columnas_aux=round((columnas-col)/2);
for x = 1:fil
    for y = 1:col
        img_rec(x,y,:)=img_rot(x+filas_aux,y+columnas_aux,:);
               
    end
end

img_rot = uint8(img_rot);
img_rgb = uint8(img_rgb);
img_rec = uint8(img_rec);


figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_rec);