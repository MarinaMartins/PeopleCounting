function [] = plotResults( groundTruth, vectorNoFilter,vectorWithFilter )
% plotResults plot the graph results
plot(groundTruth, 'ko-', 'LineWidth',4, 'MarkerSize', 30)
hold on
plot(vectorNoFilter, 'bd-', 'LineWidth',4, 'MarkerSize', 30)
hold on
plot(vectorWithFilter, 'rx-', 'LineWidth',4, 'MarkerSize', 30)
hold on

l = legend('Valor de Referência','Sem Filtragem', 'Com Filtragem');
set(l,'FontSize',25);

maxY = max(max(vectorNoFilter),5) ;
axis([0 length(vectorNoFilter) 0 maxY])
title('Resultados', 'FontSize',40);
set(gca,'DefaultTextFontSize',35)
set(gca,'FontSize',35)
xlabel('Número do Frame');
ylabel('Número de Pessoas');
set(gca,'XTick', 0:1:length(vectorNoFilter));
set(gca,'XTickLabel', (0:1:length(vectorNoFilter))*5);
end

