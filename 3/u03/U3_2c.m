%% Aufgabe 3.2c

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

%% Fouriertransformierte nur aus Phasenspektrum rekonstruieren
img_ft_phase_only = exp(1i*ifftshift(phase));

% ifft2
img_phase_only = ifft2(img_ft_phase_only);

% normalisieren
img_phase_only = mat2gray(real(img_phase_only));

%% Fouriertransformierte nur aus Amplitudenspektrum rekonstruieren
img_ft_ampl_only = ifftshift(ampl);

% ifft2
img_ampl_only = ifft2(img_ft_ampl_only);

% normalisieren
img_ampl_only = mat2gray((log(img_ampl_only+1)));

%% Alles anzeigen
subplot(2,2,1);
imshow(newImg);
subplot(2,2,2);
imshow(img_rec);
subplot(2,2,3);
imshow(img_phase_only);
subplot(2,2,4);
imshow(img_ampl_only);
