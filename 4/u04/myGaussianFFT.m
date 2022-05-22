function [result1] = myGaussianFFT(img, kSize, sigma)

    %% Filtering with FFT

    % Kernel erstellen
    kernel = fspecial('gaussian',[kSize kSize], sigma);

    % in Grauwertbild umwandlen, falls notwendig
    if ndims(img) > 2
        img = rgb2gray(img);
    end
    % auf werte zwischen 0 und 1 skalieren
    img = mat2gray(img);


    % Filtern
    disp('filtering in frequency domain...')

    % Zeit erfassen
    tic;

    %############################################
    % FFT des Bildes
    img_ft = fft2(img);
    % fftshift 
    img_ft = fftshift(img_ft);

    % FFT des Kernels
    kernel_ft = fft2(kernel, size(img,1), size(img,2));
    % fftshift 
    kernel_ft = fftshift(kernel_ft);

    % Filtern in Fourier Domain
    img_ft = img_ft .* kernel_ft;

    % reconstruction
    img_recon = ifftshift(img_ft);
    img_recon = ifft2(img_recon);


    elapsed = toc;
    disp(['elapsed time FFT-version: ',num2str(elapsed)]);
    result1 = mat2gray(abs(img_recon));
