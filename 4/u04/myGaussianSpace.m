function [result2] = myGaussianSpace(img, kSize, sigma)

    %% Filtering in space domain

    % Kernel erstellen
    kernel = fspecial('gaussian',[kSize kSize], sigma);

    % in Grauwertbild umwandlen, falls notwendig
    if ndims(img) > 2
        img = rgb2gray(img);
    end
    % auf werte zwischen 0 und 1 skalieren
    img = mat2gray(img);


    %############################################
    % ab hier programmieren...
    %###########################################
    % Filtern

    % Bildrand mit Nullen auffüllen (Padding)
    padSize =floor(kSize/2);
    img_padded = padarray(img, [padSize padSize]);
    img_new = img_padded;

    disp('filtering in space domain...')
    tic;

    % iteriere über jede Zeile (ohne padding)
    for i = padSize+1:size(img_padded,1)-padSize
        
        % iteriere über jede Spalte (ohne padding)
        for j = padSize+1:size(img_padded,2)-padSize
            
            % Platzehalter für Wert der Faltung
            temp = 0;
            
            % Hier kommt die Faltung:
            for k = 1:kSize
                row = i + k - padSize - 1;
                for l = 1:kSize
                    col = j + l - padSize - 1;
                    % Pixelwert
                    val1 = img_padded(row,col);
                    
                    % Kernelwert
                    val2 = kernel(k,l);
                    
                    % aufaddieren
                    temp = temp + val1*val2;
                end
            end
            
            % speichere wert der Faltung an die ensprechende Position
            img_new(i,j) = temp; 
        end
    end
    
    elapsed = toc;

    img_new = img_new(padSize+1:end-padSize,padSize+1:end-padSize);
    result2 = img_new;

    disp(['elapsed time: ',num2str(elapsed)]);