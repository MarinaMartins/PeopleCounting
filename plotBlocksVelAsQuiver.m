function [] = plotBlocksVelAsQuiver( blocksVel)
%plotBlocksVelAsQuiver plot BlocksVel as vector in quiver
aux = blocksVel(:,:,1);
aux = aux(end:-1:1,:);
aux2 = blocksVel(:,:,2);
aux2 = aux2(end:-1:1,:);
figure(55);quiver(aux,aux2, 'LineWidth',4);
title('Velocidades por Blocos N x N',  'FontSize',40)
set(gca,'DefaultTextFontSize',40)
set(gca,'FontSize',40)
set(gca, 'XTick',0:2:12, 'FontSize',40)  % 0:2:12 , 0:4:24, 0:8:48
set(gca, 'YTick',0:2:10, 'FontSize',40)  % 0:2:10 , 0:3:18, 0:9:36

end

