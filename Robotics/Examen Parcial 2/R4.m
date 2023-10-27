function img_out = R4(img_in)

[fil,col,c]=size(img_in);%tamaño de la imagen

img_in=double(img_in);%casteo de la imagen de entrada

img_out=zeros(fil, col);%crear imagen vacia

% img_R=img_in(:,:,1);%imagen en rojo
% img_G=img_in(:,:,2);%imagen en verde
% img_B=img_in(:,:,3);%imagen en azul


%imagenes ycbcr
img_YCbCr=zeros(fil,col,c);%imagen vacia para color YCbCr
M_YCbCr=[0.2568,0.5041,0.979;
    -0.1482,-0.2910,0.4392;
    0.4392,-0.3678,-0.0714];
Vector_YCbCr=[16;128;128];


for x = 1:fil
    for y = 1:col
        Vrgb=[img_in(x,y,1);img_in(x,y,2);img_in(x,y,3)];
        V_YCbCr=(M_YCbCr*Vrgb)+Vector_YCbCr;
        img_YCbCr(x,y,1)=V_YCbCr(1,1);%img_Y
        img_YCbCr(x,y,2)=V_YCbCr(2,1);%img_Cb
        img_YCbCr(x,y,3)=V_YCbCr(3,1);%img_Cr
    end
end

for x = 1:fil
    for y = 1:col
        if(img_YCbCr(x,y,3)>=img_YCbCr(x,y,2))
            img_out(x,y)=1;%valor de la imagen de salida
        else
            img_out(x,y)=0;%valor de la imagen de salida
        end
    end
end