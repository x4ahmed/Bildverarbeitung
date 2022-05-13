%% Aufgabe 3.2a

load mri;

% Größe von D anzeigen lassen
sizeD = siz;

% Größe von map anzeigen lassen
sizeMap = size(map);

% maximalen Grauwert von D anzeigen lassen 
maxInt_D = max(D(:));

%%
% Axialbild extrahieren
h = 5;
newImg = D(:,:,:,h);

figure;
subplot(1,3,1)
imshow(newImg);
subplot(1,3,2)
imshow(mat2gray(newImg));
subplot(1,3,3)
imshow(newImg, map);
