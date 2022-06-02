% Laden Sie ein beliebiges Bild in Ihr Workspace
% Zeigen Sie das Bild an.
img = ...;

%%
% Berechnen Sie zunächst das Gradientenbild jeweils in x- und in y-Richtung 
% mittels 3x3 Sobel-Operator
% Sie dürfen die Funktion filter2(kernel, img) verwenden
% Vergleichen Sie das Ergebnis mit conv2(img,kernel,‘same‘)

xSobel = [ ... ];
ySobel = [ ... ];

img_xSobel_filter = ...;
img_ySobel_filter = ...;

img_xSobel_conv = ...;
img_ySobel_conv = ...;

figure;
subplot(2,2,1);
imshow(...);
subplot(2,2,2);
imshow(...);
subplot(2,2,3);
imshow(...);
subplot(2,2,4);
imshow(...);

%% 
% Machen Sie das gleiche mit einem 3x3 Prewitt-Operator.

xPrewitt = [ ... ];
yPrewitt = [ ... ];

img_xPrewitt_filter = ...;
img_yPrewitt_filter = ...;

img_xPrewitt_conv = ...;
img_yPrewitt_conv = ...;

figure;
subplot(2,2,1);
imshow(...);
subplot(2,2,2);
imshow(...);
subplot(2,2,3);
imshow(...);
subplot(2,2,4);
imshow(...);

%%
% Berechnen Sie das das Gradientenbetragsbild
grad_Sobel = ...;
grad_Prewitt = ...;

figure;
subplot(1,3,1);
imshow(mat2gray(img));
subplot(1,3,2);
imshow(mat2gray(grad_Sobel));
subplot(1,3,3);
imshow(mat2gray(grad_Prewitt));
