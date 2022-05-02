%img = imread('cameraman.tif');

img = zeros(100,100);
img(35:65,35:65) = 1;

%newImg = mat2gray(round(img));

%newImg2 = rescale(newImg, 0,11);

%newImg2 = newImg2 * (0.01);

newImg2 = imadjust(img);

subplot(222);imshow(img);title('Original Image');
subplot(223);imshow(newImg2);title('Normalized Image2');