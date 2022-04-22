%% Nullmatrix
A = zeros(8,10);

%% Zufallsmatrix
B = rand(5,5);

%% B in A als C
C = A;                  % Eine Kopie von A erstellen und als C speichern
zeilenB = size(B,1);    % Anzahl der Zeilen von B
spaltenB = size(B,2);   % Anzahl der Spalten von B

zeilenC = size(C,1);    % Anzahl der Zeilen von C
spaltenC = size(C,2);   % Anzahl der Spalten von C

% Offset berechnen; 
% abrunden, falls nicht exakt in Mitte positioniert werden kann
% (dann ist die Differenz nämlich ungerade)
zeilenOffset = round((zeilenC-zeilenB)/2 - 0.5);
spaltenOffset = floor((spaltenC-spaltenB)/2);

% StartPosition in der Matrix ermitteln (aufpassen: Indizierung fängt bei 1 an)
% (würde die Indizierung wie in C++ bei 0 beginnen, wäre diese Überlegung nicht notwendig)
startZeilen = 1 + zeilenOffset;
startSpalten = 1 + spaltenOffset;

% Endposition ermitteln 
% wir addieren einfach Höhe und Breite der Teilmatrix auf die Startposition dazu
% anschließend muss 1 subtrahiert werden, da Teilmatrix sonst zu groß
% (würde die Indizierung wie in C++ bei 0 beginnen, wäre diese Überlegung nicht notwendig)
endeZeilen  = startZeilen + zeilenB - 1;
endeSpalten  = startSpalten +  spaltenB - 1;

% B in C einsetzen
C(startZeilen:endeZeilen,startSpalten:endeSpalten) = B;

%% C transponieren
C_transpose = C';

%% 3. Zeile von C
C_z3 = C(3,:);

%% Größe ändern
new_size =  [20,4];
% prüfen, ob reshape möglich ist
if (numel(C) == prod(new_size))
    C_reshape = reshape(C,new_size);
else
    disp('Reshape ist nicht möglich!... Dimensionen sind nicht kompatibel');
end

%% Zufälliger Vektor V
V = rand(1,100);

%% jedes 2. Element gleich Null setzen
V2 = V;
V2(2:2:100) = 0;

%% jedes 2. Element aus Vektor eliminieren
V3 = V(1:2:100);

%% Matrix 1000x4
M = rand(1000,4);

%% Für jede 'kleine' Matrix [a11 a12; a21 a22] berechnen wir: (a11*a22)-(a21*a12)
% Da die Matrizen als Zeilenvektoren abgelegt sind, können wir einfach Spaltenumformungen durchführen 
MyDet = det(reshape(M(1,:),2,2));
