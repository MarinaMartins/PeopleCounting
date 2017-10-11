function [ distances, links, c, dend ] = hierarchicalClustering( clusterVel, filter,  frame25to25  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Calculating distances between velocities

if(strcmp('nofilter', filter))
    plotMarker = 'bo';
    str = '';
    value = 0;
else
    plotMarker = 'ro';
    str = ' (após a Filtragem)';
    value = 10;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clusterVelSemZeros = [];
for i = 1:(length(clusterVel))
    if(hypot(clusterVel(i,1),clusterVel(i,2))> 0.0008)
        clusterVelSemZeros = [clusterVelSemZeros ;clusterVel(i,:)];
    end
end
clusterVel = clusterVelSemZeros;
figure(200+value)
% subplot(2,2,1);
plot(clusterVelSemZeros(:,1), clusterVelSemZeros(:,2), 'bx', 'LineWidth',4, 'MarkerSize', 30);
axis([-.5 .5 -.5 .5]);
title(strcat('Velocidades como Pontos', 'SEM ZEROS'), 'FontSize',40)
set(gca,'DefaultTextFontSize',35)
set(gca,'FontSize',35)
set(gca, 'XTick',-.5:0.1:.5, 'FontSize',35)
set(gca, 'YTick',-.5:0.25:.5, 'FontSize',35)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
distances = pdist(clusterVel); % clusterVel
% Calculating links
links = linkage(distances);

c(frame25to25) = cophenet(links, distances);
disp(c(frame25to25));

%inconsistency = inconsistent(links);
%maxInconsistency = max(inconsistency(:,4));
%T = cluster(links,'cutoff',0.8);
%numberClusters = length(unique(T));
% Creating and plotting dendrogram

% subplot(2,2,3);
figure(5+value);
dend = dendrogram(links);
set(dend,'LineWidth',4)
if(strcmp('withFilter', filter))
    set(dend,'Color','red')
end
set(gca,'DefaultTextFontSize',24)
set(gca,'FontSize',24)
title(strcat('Dendrograma', str), 'FontSize',40)
xlabel('Índices dos objetos', 'FontSize',40)
ylabel('Distância dos clusters', 'FontSize',40)


% Plotting distances * distances
%subplot(2,2,4);
figure(6+value);
plot(links(:,3), links(:,3),plotMarker, 'LineWidth',4, 'MarkerSize', 30)
set(gca,'DefaultTextFontSize',35)
set(gca,'FontSize',35)
title(strcat('Distância x Distância', str), 'FontSize',40)
xlabel('Distância dos clusters', 'FontSize',40)
ylabel('Distância dos clusters', 'FontSize',40)

end

