%% Aufgabe 5a

img = ...;

%% Impulsrauschen simulieren
img_noisy = ...;

figure;
subplot(1,2,1);
imshow(...);
subplot(1,2,2);
imshow(...);

%% Rangordnungsfilter (Median)
kSize = 3;
rang = ...; % median

padSize = ...
% periodische Fortsetzung des Bildes
img_padded = padarray(..., 'circular');

img_denoised = img_padded; % Platzehalter für Ausgangsbild

% iteriere über jede Zeile (ohne padding)
for i = ...
        
    % iteriere über jede Spalte (ohne padding)
    for j = ...
        
        % [kSize x kSize] Abschnitt des Bildes.
        % Von diesem Fenster muss ein Element gewählt werden
        window = img_padded(...);
        
        % Zuert reshapen wir den Abschnitt als eine lange Zeil.
        % Danach sortieren wir diese Zeile in aufsteigender Rheinfolge.
        window_as_row = reshape(window, ...);
        window_as_row_sorted = sort(window_as_row);
        
        % Median-Werte auswählen und im Ausgansbild setzen
        img_denoised(i,j) = ...;
    end
end

img_denoised = img_denoised(padSize+1:end-padSize,padSize+1:end-padSize);

%%
img_denoised_matlab = medfilt2(img_noisy, [kSize, kSize], 'symmetric');

%%
figure;
subplot(2,2,1);
imshow(...);
subplot(2,2,2);
imshow(...);
subplot(2,2,3);
imshow(...);
subplot(2,2,4);
imshow(...);
