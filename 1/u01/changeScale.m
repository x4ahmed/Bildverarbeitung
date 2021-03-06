function [img] = changeScale(img)
%CHANGESCALE: This function takes img as a parameter and plots original,
%scaled and normalized versions of it

% img1 is now the scaled version of img, the scaling is between [0,1]
    img1 = im2double(img);

% scaledImg is now the scaled version of img, the scaling is between [-1,1]
    scaledImg = rescale(img1,-1,1);

% normImg is now the scaled version of img, the scaling is between [0,1]
    normImg = rescale(scaledImg);
    
% Plot functions
    subplot(221);imshow(img);title('Original Image');
    subplot(222);imshow(scaledImg);title('Scaled Image');
    subplot(223);imshow(normImg);title('Normalized Image');

end

