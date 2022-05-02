function [newImg] = changeGrayscaleResolution(img, newScale)
%CHANGEGRAYSCALERESOLUTION Summary of this function goes here
%   Detailed explanation goes here

    if isa(img, 'uint8')
        newImg = mat2gray(img,[0 newScale-1]);
    else
        newImg = mat2gray(img,[0 newScale-1]);
    end
    
    %normalize
    %newImg = mat2gray(round(newImg));

    subplot(222);imshow(img);title('Original Image');
    subplot(223);imshow(newImg);title('Normalized Image');
end

