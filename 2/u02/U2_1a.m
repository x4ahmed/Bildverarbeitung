%% Aufgabe 2.1a
% Größen definieren
imgSize = [100,100];
squareSize = [30,30];

% leeres Bild mit obigen Dimensionen erstellen
newImg = zeros(imgSize);

% Grenzen des weißen Fensters ermitteln 
rowStart = 35;
rowEnd = 65;

colStart = 35;
colEnd = 65;

% Festerbereich im Bild auf 1 (weiß) setzen
newImg(rowStart:rowEnd,colStart:colEnd) = 1;

% Fast Fourier transformation
img_fft = fft2(newImg);

% fftshift anwenden
img_fft_shifted = fftshift(newImg);

% amplitudenbild
ampl = abs(img_fft_shifted);

% phasenbild
phase = angle(img_fft_shifted);

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
imshow(mat2gray(phase));
