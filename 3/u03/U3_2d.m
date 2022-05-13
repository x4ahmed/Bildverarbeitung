%% Aufgabe 3.2d

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
imshow(phase);

%%
% erstelle Maske mit Kreis in der Mitte
% ermittle die Größe der kürzeren Seite des transformierten Bildes
shortEdge = min(size(img_fft_shifted));

% setze Radius auf 1/10 dieser Seitenlänge
radius = shortEdge/10;

% erstelle ein quadratisches Gitter mit dieser Seitenlänge 
% x1 und x2 sind Matrizen(!), die die Indizes der Gitterpunktpositionen beinhalten
[x1, x2] = meshgrid(1:shortEdge);

% finde die Gitterpositionen, die einen Abstand von <= radius zur Mitte haben
% da x1 und x2 Matrizen sind, ist temp auch eine (logische) IndexMatrix
temp = sqrt((x1- shortEdge/2 ).^2+(x2- shortEdge/2).^2) <= radius;

% Erstelle nun die Maske; Sie soll genau so groß sein wie das
% transformierte Bild
circleMask = zeros(size(img_fft_shifted));

% Da temp quadratisch ist, kann es sein, dass circleMask an einer Seite absteht
pad1 = floor(size(circleMask,1) - size(temp,1))/2 ;
pad2 = floor(size(circleMask,2) - size(temp,2))/2 ;

% Positioniere temp (logische Matrix mit Einsen in der Mitte, die einen
% Kreis bilden) in circleMask hinein
startY = 1 + pad1;
startX = 1 + pad2;

endY = startY + size(temp,1) - 1;
endX = startX + size(temp,2) - 1;
circleMask(startY:endY, startX:endX) = temp;


% Verwende Maske, um Amplitude bei kleinen Frequenzen auf Null zu setzen
ampl_hp = ampl .* (1-circleMask);

% Fouriertransformierte aus geändertem Amplitudenspektrum un Phase rekonstruieren
img_ft_hp =  ifftshift(ampl_hp) .* exp(1i*ifftshift(phase));

% ifft2
img_hp = ifft2(img_ft_hp);
    
%normalisieren
img_hp = mat2gray(real(img_hp));


% Verwende Maske, um Amplitude bei großen Frequenzen auf Null zu setzen
ampl_lp = ampl .* (circleMask);

% Fouriertransformierte aus geändertem Amplitudenspektrum un Phase rekonstruieren
img_ft_lp =  ifftshift(ampl_lp) .* exp(1i*ifftshift(phase));

% ifft2
img_lp = ifft2(img_ft_lp);
    
%normalisieren
img_lp = mat2gray(real(img_lp));

% Anzeigen
subplot(2,2,1);
imshow(mat2gray(log(ampl_hp+1)));
subplot(2,2,2);
imshow(img_hp);
subplot(2,2,3);
imshow(mat2gray(log(ampl_lp+1)));
subplot(2,2,4);
imshow(img_lp);
