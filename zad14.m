n = 5;
alfa = 0.25; % 0, 0.25, 0.5, 0.75, 0.85, 1
Jn = zeros(n,n)+1;
PG = [0   1/2 1/2  0   0;
      0    0   0   1   0;
      0   1/3  0  1/3 1/3;
      1    0   0   0   0;
      1/5 1/5 1/5 1/5 1/5;];
MG = (1-alfa)*PG + alfa*1/n*Jn;
PI_i = zeros(1,n)+1/n;
disp("PI_0:")
disp(PI_i)
for i=1:25
    PI_i = PI_i * MG;
    disp("PI_" + i + ":")
    disp(PI_i)
end
