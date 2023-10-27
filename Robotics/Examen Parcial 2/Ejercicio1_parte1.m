clear all
close all
img_rgb=imread('fire_forest.jpg');


%regla 1
img_R1 = R1(img_rgb);

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_R1);

%regla 2
img_R2 = R2(img_rgb);

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_R2);

%regla 3
img_R3 = R3(img_rgb);

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_R3);

%regla 4
img_R4 = R4(img_rgb);

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_R4);

%regla 5
img_R5 = R5(img_rgb);

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_R5);

%regla 6
img_R6 = R6(img_rgb);

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_R6);

%regla 7
img_R7 = R7(img_rgb);

figure;
subplot(1,2,1);
imshow(img_rgb);
subplot(1,2,2);
imshow(img_R7);
