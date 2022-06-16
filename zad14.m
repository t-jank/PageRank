close all; clear all;
n = 5;
alfa = [0 0.15 0.25 0.5 0.75 0.85 1];
Jn = zeros(n,n)+1;
PG = [0   1/2 1/2  0   0;
      0    0   0   1   0;
      0   1/3  0  1/3 1/3;
      1    0   0   0   0;
      1/5 1/5 1/5 1/5 1/5;];
colors = ['b' "r" "#EDB120" "m" "#77AC30" "#4DBEEE", "#A2142F"];
figure
for a = 1:7
    MG = (1-alfa(a))*PG + alfa(a)*1/n*Jn;
    PI_i = zeros(1,n)+1/n;
    %blad = sum(abs(PI_i-PI_i*MG));
    %plot(0,blad,'.','MarkerSize',25,'MarkerEdgeColor',colors(a),'HandleVisibility','off'); hold on; grid on
    %disp("PI_0:")
    %disp(PI_i)
    for i=1:25
        PI_i = PI_i * MG;
        %disp("PI_" + i + ":")
        %disp(PI_i)
        blad = sum(abs(PI_i-PI_i*MG));
        if mod(i,25) == 1
            plot(i,blad,'.','MarkerSize',25,'MarkerEdgeColor',colors(a),'DisplayName',"\alpha = " + alfa(a)); hold on; grid on
        else
            plot(i,blad,'.','MarkerSize',25,'MarkerEdgeColor',colors(a),'HandleVisibility','off'); hold on; grid on
        end
        legend
        title("Zbieganie do rozkładu stacjonarnego dla różnych wartości \alpha")
        xlabel('i')
        ylabel("Błąd (|\pi_i-\pi_i*M_G|)")
    end
end

% ranking stron
figure
for a = 1:7
    MG = (1-alfa(a))*PG + alfa(a)*1/n*Jn;
    PI_i = zeros(1,n)+1/n;
    for i=1:50
        PI_i = PI_i * MG;
    end
    for pii = 1:5
        if a == 1
            plot(alfa(a),PI_i(pii),'.','MarkerSize',20,'MarkerEdgeColor',colors(pii),'DisplayName',"\pi(" + pii + ")"); hold on; grid on
        else
            plot(alfa(a),PI_i(pii),'.','MarkerSize',20,'MarkerEdgeColor',colors(pii),'HandleVisibility','off'); hold on; grid on
        end
    end
    legend
    title("Wpływ parametru \alpha na kolejność stron w rankingu PageRank")
    xlabel('\alpha = \{0,  0.15,  0.25,  0.5,  0.75,  0.85,  1\}')
    ylabel("\pi(i) (kryterium rankingu PageRank)")
end
