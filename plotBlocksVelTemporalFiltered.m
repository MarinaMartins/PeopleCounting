function [ ] = plotBlocksVelTemporalFiltered( blocksVelTemporalFiltered, filter )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if(strcmp('nofilter', filter))
    plotMarker = 'bx';
    str = '';
    color = [0 0 1];
    value = 0;
else
    plotMarker = 'rx';
    str = ' (após a Filtragem)';
    color = [1 0 0];
    value = 10;
end


figure(3 + value);

% subplot(2,2,1);
plot(blocksVelTemporalFiltered(:,:,1),blocksVelTemporalFiltered(:,:,2), plotMarker, 'LineWidth',4, 'MarkerSize', 30);
axis([-.5 .5 -.5 .5]);
title(strcat('Velocidades como Pontos', str), 'FontSize',40)
set(gca,'DefaultTextFontSize',35)
set(gca,'FontSize',35)
set(gca, 'XTick',-.5:0.1:.5, 'FontSize',35)
set(gca, 'YTick',-.5:0.25:.5, 'FontSize',35)


figure(4 + value);
% subplot(2,2,2);
% blocksVelTemporalFilteredPlot(:,:) = blocksVelTemporalFiltered(end:-1:1);
aux = blocksVelTemporalFiltered(:,:,1);
aux = aux(end:-1:1,:);
aux2 = blocksVelTemporalFiltered(:,:,2);
aux2 = aux2(end:-1:1,:);
quiver(aux,aux2, 'color', color, 'LineWidth',4);
title(strcat('Velocidades por Blocos', str),  'FontSize',40)
set(gca,'DefaultTextFontSize',40)
set(gca,'FontSize',40)
set(gca, 'XTick',0:2:12, 'FontSize',40)
set(gca, 'YTick',0:2:10, 'FontSize',40)

end

