function [result3] = myGaussianSpaceSep(img, kSize, sigma)

    %% Filtering in space domain

    % Kernel erstellen
    kernel1D = fspecial('Gaussian', [kSize 1], sigma);

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
    padSize = floor(kSize/2);
    img_padded = padarray(img, [padSize padSize]);
    img_new = img_padded;

    disp('filtering in space domain...with gauss seperation!')
    tic;

    % vertikal filtern
    % iteriere über jede Zeile (ohne padding)
    for i = padSize+1:size(img_padded,1)-padSize
        
        % iteriere über jede Spalte (ohne padding)
        for j = padSize+1:size(img_padded,2)-padSize
            
            % Platzehalter für Wert der Faltung
            temp = 0;
            
            % Hier kommt die Faltung:
            for k = 1:kSize
                col = j + k - padSize - 1;
                    % Pixelwert
                    val1 = img_padded(i,col);
                    
                    % Kernelwert
                    val2 = kernel1D(k);
                    
                    % aufaddieren
                    temp = temp + val1*val2;
            end
            
            % speichere wert der Faltung an die ensprechende Position
            img_new(i,j) = temp; 
        end
    end

    %Horizontal filtern (genauso)
    temp_img = img_new;
    for i = padSize+1:size(img_padded,1)-padSize
        for j = padSize+1:size(img_padded,2)-padSize
            temp = 0;
            for k = 1:kSize
                row = i + k - padSize - 1;
                    val1 = temp_img(row,j);
                    val2 = kernel1D(k);
                    temp = temp + val1*val2;
            end
            img_new(i,j) = temp; 
        end
    end

    elapsed = toc;
    disp(['elapsed time: ',num2str(elapsed)]);

    img_new = img_new(padSize+1:end-padSize,padSize+1:end-padSize);
    result3 = mat2gray(img_new);
