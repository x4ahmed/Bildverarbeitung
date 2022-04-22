function [newImg] = changeGrayscaleResolution(img, newScale)
%CHANGEGRAYSCALERESOLUTION Summary of this function goes here
%   Detailed explanation goes here

    if isa(img, 'uint8')
        newImg = ...
    else
        newImg = ...;
    end
    
    %normalize
    newImg = mat2gray(round(newImg));

end

