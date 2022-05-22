img = imread('lena_std.tif');

%%
kSize = 7;
sigma = 2;

%%
[result1] = myGaussianFFT(img, kSize, sigma);
[result2] = myGaussianSpace(img, kSize, sigma);

%%
figure;
subplot(2,2,1); imshow(rgb2gray(img));
subplot(2,2,2); imshow(result1);
subplot(2,2,3); imshow(result2);