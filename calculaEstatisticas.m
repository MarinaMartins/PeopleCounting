function [ tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculaEstatisticas( groundTruthVideo, vectorDifferentObjects )
% tabelaEstatisticas = [algo - GT - acertopercentual - c1 - c2]
%   Detailed explanation goes here

erroAbsoluto = abs(vectorDifferentObjects - groundTruthVideo);
maxNoPeople = max(vectorDifferentObjects,groundTruthVideo);
maxNoPeople(maxNoPeople == 0) = 1;
acertoPercentual = 1 - erroAbsoluto./maxNoPeople;
tabelaEstatisticas = [vectorDifferentObjects(:) groundTruthVideo(:) erroAbsoluto(:) acertoPercentual(:)];
mediaErroAbsoluto = mean(erroAbsoluto);
mediaAcertoPercentual = mean(acertoPercentual);

mediaVetorCalculado = mean(vectorDifferentObjects);
mediaGroundTruth    = mean(groundTruthVideo);


plot(vectorDifferentObjects, 'bo-')
hold on
plot(groundTruthVideo, 'rx-')
axis([1 length(vectorDifferentObjects) 0 5])

end

