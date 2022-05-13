%% Aufgabe 3.2b

load mri;

% Größe von D anzeigen lassen
sizeD = size(D)

% Größe von map anzeigen lassen
sizeMap = size(map)

% maximalen Grauwert von D anzeigen lassen 
maxInt_D = max(D(:))

%%
% Axialbild extrahieren
h = 5;
newImg = D(:,:,:,h);

% Bild normalisieren
newImg = mat2gray(newImg);

% FFT
img_fft = fft2(newImg);

% FFTshift
img_fft_shifted = fftshift(img_fft);

% amplitudenbild
ampl = abs(img_fft_shifted);

% phasenbild
phase = angle(img_fft_shifted);

%% Fouriertransformierte aus Amplituden und Phasenspektrum rekonstruieren
% Prinzipiell gilt die Formel: amplitude * exp(1i* phase)
img_ft_rec =  ifftshift(ampl) .* exp(1i*ifftshift(phase));

% ifft2
img_rec = ifft2(img_ft_rec);

% normalisieren
img_rec = mat2gray(abs(img_rec));

% Bilder anzeigen;
figure;
subplot(1,3,1);
% Originalbild
imshow(newImg);

subplot(1,3,2);
% Log-Amplitudenbild
imshow(mat2gray(log(ampl+1)));

subplot(1,3,3);
% Phasenbild
imshow(img_rec);
