%% Bild
img_orig = imread('cameraman.tif');

%% Glättung
kSize = 3;
sigma = 1.5;
kernel = ...;
img = ...;

%% Grauwertübergänge mit Sobel (1. Ableitung)
xSobel = ...;
ySobel = ...;

GrX = ...;
GrY = ...;
%% Gradientenbetragsbild
Gm = ...;

%%
figure;
subplot(1,2,1);
imshow(mat2gray(img_orig));
subplot(1,2,2);
imshow(mat2gray(Gm));

%% GWK anhand des Schwellenwerts (1.Ableitung)
threshold = ...;
bin_img = ...;

%%
figure;
subplot(1,2,1);
imshow(mat2gray(img_orig));
title('Original');
subplot(1,2,2);
imshow(bin_img);
title('GWK anhand des Schwellenwerts (1.Ableitung)');
