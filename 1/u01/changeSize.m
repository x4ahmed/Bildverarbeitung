function [newImg] = changeSize(img, newSize)
%   INPUT:  img      -  Grauwertbild
%           newSize  -  neue (kleinere) Auflösung (Zeilen*Spalten)
%
%   OUTPUT: newImg   -  verkleinertes Bild

    % Überprüfen, ob neue Bildauflösung kleiner ist
    if ((newSize(1) > size(img,1)) || (newSize(2) > size(img,2)))
        disp('Error: New dimensions need to be smaller! Returning input image...');
        newImg = img;
    else
        
        %leeres Bild mit neuer Auflösung erstellen
        newImg = ...;
    
        %Schrittweite (bzw. Fenstergröße) ermitteln
        %damit rechter und unterer Rand nicht abgeschnitten werden,
        %hier erstmal nicht abrunden
        stepY = (size(img,1)/newSize(1));
        stepX = ...;
        
        %jeden Pixel des neuen Bildes durchiterieren
        for y = ...
            for x = ...
                
                %Fensterabgrenzungen bestimmen (hier muss gerundet werden!)
                startY = 1+floor((y-1)*stepY);
                startX = ...;

                %aufpassen, dass der (End-)Index nicht out of bounds ist
                endY = min([size(img,1), 1+floor(y*stepY)]);
                endX = ...;

                %Fenster aus Eingabebild isolieren
                tempPatch = img(...);

                %Durchschnittliche Intensität des Fensters wird im Pixel
                %abgespeichert
                newImg(y,x) = mean(tempPatch(:));
                
                %% Alternativen
                %newImg(y,x) = max(tempPatch(:));    %Maximale Intensität im Fenster wird im Pixel abgespeichert
                %newImg(y,x) = min(tempPatch(:));    %Minimale Intensität im Fenster wird im Pixel abgespeichert
                %newImg(y,x) = median(tempPatch(:)); %Intensitätsmedian des Fensters wird im Pixel abgespeicher
            end
        end
        
    end
    
    %da momentan Fließkommazahlen im Array gespeichert sind, werden alle
    %Werte >= 1 als weiß interpretiert. Daher...
    newImg = uint8(newImg);     % Bild mit Grauwerten aus {0,1,2,..., 255}
    
    %oder: 
    %newImg = mat2gray(newImg)  % Bild mit (double) Grauwerten im Intervall [0,1]

    %'return' nicht notwendig. Matlab gibt die ganz oben gennante Variable
    %zurück, sofern sie innerhalb der Funktion angelegt wurde, ansonsten
    %kommt eine Fehlermeldung 
end

