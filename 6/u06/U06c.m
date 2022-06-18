%% Bild
img_orig = imread('cameraman.tif');

%% Glättung
kSize = 3;
sigma = 1.5;
kernel = ...;
img = ...;

%% Grauwertübergänge mit Sobel (2. Ableitung)
xSobel = ...;
ySobel = ...;

GrX = ...;
GrY = ...;

GrXX = ...;
GrYY = ...;

%% 
Gm2 = ...;

%%
figure;
subplot(1,2,1);
imshow(mat2gray(img_orig));
subplot(1,2,2);
imshow(mat2gray(Gm2));

%% GWK anhand des Schwellenwerts (2.Ableitung)
threshold = ...;
bin_img2 = ...;

%%
figure;
subplot(1,2,1);
imshow(mat2gray(img_orig));
title('Original');
subplot(1,2,2);
imshow(bin_img2);
title('GWK anhand des Schwellenwerts (2.Ableitung)');
