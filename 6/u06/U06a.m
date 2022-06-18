% Schachbrettmuster erstellen
img = checkerboard(64);

%% SUSAN
kSize = 5;
padSize = floor(kSize/2);

img_padded = padarray(img, [padSize padSize]);
resultImg =img_padded;

% Fenster läuft über Bild
for i = padSize+1:size(img_padded,1)-padSize
   for j = padSize+1:size(img_padded,2)-padSize
       
       centerVal = img_padded(i,j);
       counter = 0;
       
       for k = 1:kSize
           row = i + k - padSize - 1;
           for l = kSize
               col = j + l - padSize - 1;
                % Zählen, wie viele Pixel innerhalb der Fensterumgebung gleichen Grauwert haben, 
                % wie Pixel in Fenstermitte
               if img_padded(row,col) == centerVal; 
                   counter = counter + 1;
               end
           end
       end
       resultImg(i,j) = counter;
    end    
end

resultImg = resultImg(padSize+1:end-padSize,padSize+1:end-padSize);

%% Filterantwort wird mit Schwellenwert binarisiert
threshold = 4;

finalImg = imbinarize(resultImg,threshold);

%% Ergebnisse zeigen
figure;
subplot(1,3,1);
imshow(mat2gray(img));
title('Original');
subplot(1,3,2);
imshow(mat2gray(resultImg));
title('Binärbild');
subplot(1,3,3);
imshow(mat2gray(finalImg));
title('Grauwertecken');

%% Ausdünnen
