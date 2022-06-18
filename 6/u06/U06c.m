%% Bild
img_orig = imread('cameraman.tif');

%% Glättung
kSize = 3;
sigma = 1.5;
kernel = fspecial('gaussian',[kSize kSize], sigma);
img = imfilter(img_orig,kernel);

%% Grauwertübergänge mit Sobel (2. Ableitung)
xSobel = [-1,0,1;-2,0,2;-1,0,1];
ySobel = xSobel';

GrX = conv2(img,xSobel,"same");
GrY = conv2(img,ySobel,"same");

GrXX = conv2(GrX,xSobel,"same");
GrYY = conv2(GrY,xSobel,"same");

%% 
Gm2 = sqrt(GrXX.^2 + GrYY.^2);

%%
figure;
subplot(1,2,1);
imshow(mat2gray(img_orig));
subplot(1,2,2);
imshow(mat2gray(Gm2));

%% GWK anhand des Schwellenwerts (2.Ableitung)
threshold = 150;
bin_img2 = imbinarize(Gm,threshold);

%%
figure;
subplot(1,2,1);
imshow(mat2gray(img_orig));
title('Original');
subplot(1,2,2);
imshow(bin_img2);
title('GWK anhand des Schwellenwerts (2.Ableitung)');
