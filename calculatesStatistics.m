function [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo, vectorDifferentObjects )
% tabelaEstatisticas = [algo - GT - acertopercentual - c1 - c2]
%   Detailed explanation goes here

erroAbsoluto = abs(vectorDifferentObjects - groundTruthVideo);
maxNoPeople = max(vectorDifferentObjects,groundTruthVideo);
maxNoPeople(maxNoPeople == 0) = 1;
acuracia = 1 - erroAbsoluto./maxNoPeople;
tabelaEstatisticas = [vectorDifferentObjects(:) groundTruthVideo(:) erroAbsoluto(:) acuracia(:)];
mediaErroAbsoluto = mean(erroAbsoluto);
mediaAcuracia = mean(acuracia);

mediaVetorCalculado = mean(vectorDifferentObjects);
mediaGroundTruth    = mean(groundTruthVideo);

end

