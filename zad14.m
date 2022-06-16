n = 5;
alfa = [0 0.15 0.25 0.5 0.75 0.85 1]; % 0, 0.25, 0.5, 0.75, 0.85, 1
Jn = zeros(n,n)+1;
PG = [0   1/2 1/2  0   0;
      0    0   0   1   0;
      0   1/3  0  1/3 1/3;
      1    0   0   0   0;
      1/5 1/5 1/5 1/5 1/5;];
colors = ['b' 'g' 'y' 'r' 'k' 'm' 'c']
for a = 1:7
    MG = (1-alfa(a))*PG + alfa(a)*1/n*Jn;
    PI_i = zeros(1,n)+1/n;
    %blad = sum(abs(PI_i-PI_i*MG)); %% 11n ODKOMENTOWAC MOZE JEDNAK %%
    %plot(0,blad,'.','MarkerSize',20,'MarkerEdgeColor',colors(a)); hold on; grid on
    %disp("PI_0:")
    %disp(PI_i)
    for i=1:25
        PI_i = PI_i * MG;
       % disp("PI_" + i + ":")
      %  disp(PI_i)
        blad = sum(abs(PI_i-PI_i*MG));
        plot(i,blad,'.','MarkerSize',20,'MarkerEdgeColor',colors(a)); hold on; grid on
        legend("alfa = " + alfa(a))
        %title("alfa = " + alfa(a))
        xlabel('i')
        ylabel('Błąd (|PI_i-PI_i*MG|)')
    end
end
%'MarkerEdgeColor','b'