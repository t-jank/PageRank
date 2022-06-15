n = 6;
alfa = 0.15; % 0, 0.15, 0.5, 1
Jn = zeros(n,n)+1;
PG = [1  0  0  0  0  0;
      0  0 1/2 0 1/2 0;
      1  0  0  0  0  0;
      0 1/2 0  0 1/2 0;
      0  0  0  1  0  0;
      0  0  1  0  0  0;];
MG = (1-alfa)*PG + alfa*1/n*Jn;

PI_i = zeros(1,n)+1/n;
for i=0:99
    PI_i = PI_i * MG;
end

disp("Rozkład stacjonarny dla alfa = " + alfa + ":")
disp(PI_i)
%sprawdzenie
%A = PI_i * MG;
%disp("Sprawdzenie PI*MG:")
%disp(A)

% likwidacja połączenia między stanami 2 i 3
PG(2,3)=0; PG(2,5)=1;
MG = (1-alfa)*PG + alfa*1/n*Jn;
PI_i = zeros(1,n)+1/n;
for i=0:99
    PI_i = PI_i * MG;
end
disp("Rozkład stacjonarny dla alfa = " + alfa + " po likwidacji połączenia 2-3:")
disp(PI_i)

%% Macierz alfa*1/n*Jn modeluje losowy skok internauty do innej strony. Gwarantuje to nieredukowalność ŁM, czyli
%% istnienie jednej klasy komunikacji (każdy się komunikuje z każdym), nawet jeśli prawdop. jest małe, to jest
%% możliwość komunkikacji między każdymi dwoma wierzchołkami. Nieredukowalność i nieokresowość implikuje istnienie
%% unikalnego rokładu stacjonarnego.
%% Współczynnik alfa nazywa się czasem współczynnikiem znudzenia, gdyż pokazuje on jak często się nudzimy - ile
%% linków z rzędu klikamy zanim się znudzimy i wykonamy skok. Tutaj dla alfa=0.15 nudzimy się średnio po 6 i 2/3
%% kliknięć linków i wykonujemy skok do innej strony.
