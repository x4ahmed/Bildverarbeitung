%% Bild
img_orig = imread('cameraman.tif');

%% Glättung
kSize = 3;
sigma = 1.5;
kernel = fspecial('gaussian',[kSize kSize], sigma);
img = imfilter(img_orig,kernel);

%% Grauwertübergänge mit Sobel (1. Ableitung)
xSobel = [-1,0,1;-2,0,2;-1,0,1];
ySobel = xSobel';

GrX = conv2(img,xSobel,"same");
GrY = conv2(img,ySobel,"same");
%% Gradientenbetragsbild
Gm = sqrt(GrX.^2 + GrY.^2);

%%
figure;
subplot(1,2,1);
imshow(mat2gray(img_orig));
subplot(1,2,2);
imshow(mat2gray(Gm));

%% GWK anhand des Schwellenwerts (1.Ableitung)
threshold = 150;
bin_img = imbinarize(Gm,threshold);

%%
figure;
subplot(1,2,1);
imshow(mat2gray(img_orig));
title('Original');
subplot(1,2,2);
imshow(bin_img);
title('GWK anhand des Schwellenwerts (1.Ableitung)');
