n=4;
P = [ 0   3/10  1/10  3/5;
    1/10  1/10  7/10  1/10;
    1/10  7/10  1/10  1/10;
    9/10  1/10   0      0; ];

%%%%% podpunkt a %%%%%
PI_i = zeros(1,n)+1/n;
for i=0:99
    PI_i = PI_i * P;
end
disp("Rozkład stacjonarny:")
disp(PI_i)
%sprawdzenie
%A = PI_i * P;
%disp("Sprawdzenie PI*P:")
%disp(A)

%%%%% podpunkt b %%%%%
mprawdop32 = P^32;
disp("Prawdopodobieństwo znalezienia się w stanie 3 po 32 krokach, jeśli zaczynamy w stanie 0:")
disp(mprawdop32(1,4))

%%%%% podpunkt c %%%%%
mprawdop128 = P^128;
disp("Prawdopodobieństwo znalezienia się w stanie 3 po 128 krokach jeśli zaczynamy w losowym stanie:")
disp(mprawdop128(1,4) + mprawdop128(2,4) + mprawdop128(3,4) + mprawdop128(4,4))

%%%%% podpunkt d %%%%%

