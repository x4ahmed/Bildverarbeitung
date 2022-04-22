%% Aufgabe 1.1
% Laden Sie das Bild cameraman.tif in den Workspace. 
% Nutzen Sie dazu img = imread(‘Pfad‘);
img = imread(...);

%% Bestimmen Sie die Ortsauflösung des Bildes.
disp('Die Ortsauflösung des Bildes:');
disp(['    Anzahl von Zeilen: ', num2str(...)]);
disp(['    Anzahl von Spalten: ', num2str(...)]);

%% Bestimmen Sie den Datentyp von der 'img' Variable
disp(class(img));

%% Schreiben Sie eine Funktion, die das Eingabebild auf Intensitätswerte zwischen -1 und 1 skaliert und ausgibt.
imgScaled = changeScale(img);

%% Normalisieren Sie entstehendes skaliertes Bild.
imgNormalized = mat2gray(imgScaled);

%% 
% Zeigen Sie jede von drei Bildern (original, skaliert, normalisiert) 
% in einem separaten Fenster mit imshow(img) an.
figure('Name','Original Image');
imshow(img);
figure('Name','Scaled Image');
imshow(imgScaled);
figure('Name','Normalized Image');
imshow(imgNormalized);

%% Zeigen Sie drei Bilder in einem Fenster an.
figure;
subplot(1,3,1);
imshow(img);
subplot(1,3,2);
imshow(imgScaled);
subplot(1,3,3);
imshow(imgNormalized);

%% Aufgabe 1.2
% Schreiben Sie eine Funktion, die die Ortsauflösung des Eingabebildes auf 100 mal 100 Pixel (herunter) skaliert und ausgibt.
% Zeigen Sie beide Bilder an.
newSize = [100, 100];
imgSmall = changeSize(...);

figure;
subplot(1,2,1);
imshow(img);
subplot(...);
imshow(...);

%% Aufgabe 1.3
% Schreiben Sie eine Funktion, die das Eingabebild mit 256 Graustufen auf 12 Graustufen herunterbricht und ausgibt.
% Zeigen Sie beide Bilder an.
imgGrayScalged = changeGrayscaleResolution(img, 12);

figure;
subplot(1,2,1);
imshow(img);
subplot(...);
imshow(...);

%% Aufgabe 1.4
% Laden Sie das Bild coloredChips.png in den Workspace.
% Bestimmen Sie die Ortsauflösung des Bildes.
img = imread('coloredChips.png');
disp(...);

%% Zeigen Sie farbiges Bild und seine drei Farbkanäle
% R,G und B separat als Graustufenbilder an.

figure;
subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imshow(...);
subplot(2,2,3);
imshow(...);
subplot(2,2,4);
imshow(...);

%% Vertauschen Sie die Kanäle R und B im Originalbild und zeigen Sie das neue Farbbild an
% gbrImg = zeros(size(img), 'uint8');
gbrImg = zeros(size(img));
bgrImg(...) = img(...);
bgrImg(...) = img(...);
bgrImg(...) = img(...);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(gbrImg);

%% Aufgabe 1.5
% Laden Sie das Bild mri.tif in den Workspace.
% Schreiben Sie eine Funktion, die den Kontrast des Bildes um x% erhöht.
% Erhöhen Sie den Kontrast jeweils 
%     um 2%
%     um 10%
%     um das 2-fach
% Was stellen Sie fest?

img = imread('mri.tif');
img2 = changeContrast(img,2);
img10 = changeContrast(img,10);
img100 = changeContrast(img,img100);

figure;
subplot(1,4,1);
imshow(img);
subplot(1,4,2);
imshow(img2);
subplot(1,4,3);
imshow(img10);
subplot(1,4,4);
imshow(img100);
