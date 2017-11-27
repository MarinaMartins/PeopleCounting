pontos = [0.5 1.5;
          0.3 1.5; 
          2 1.5;
          2.2 2;                   
          1 4];
      
distancias = pdist(pontos);
links = linkage(distancias);
figure(1)
dend = dendrogram(links);

set(dend,'LineWidth',7)
set(gca,'DefaultTextFontSize',40)
set(gca,'FontSize',40)
title('Dendrograma', 'FontSize',40)
xlabel('Índices dos objetos', 'FontSize',40)
ylabel('Distância dos clusters', 'FontSize',40)
      
figure(2)
plot(pontos(:,1), pontos(:,2), 'bx', 'LineWidth',7, 'MarkerSize', 30);
axis([0 3 0 5]);
title('Pontos', 'FontSize',40)
set(gca,'DefaultTextFontSize',40)
set(gca,'FontSize',40)
% set(gca, 'XTick',-.5:0.1:.5, 'FontSize',35)
% set(gca, 'YTick',-.5:0.25:.5, 'FontSize',35)