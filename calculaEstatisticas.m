function [ tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual] = calculaEstatisticas( groundTruthVideo, vectorDifferentObjects, cc1, cc2 )
% tabelaEstatisticas = [algo - GT - acertopercentual - c1 - c2]
%   Detailed explanation goes here

erroAbsoluto = abs(vectorDifferentObjects - groundTruthVideo);
maxNoPeople = max(vectorDifferentObjects,groundTruthVideo);
acertoPercentual = 1 - erroAbsoluto./maxNoPeople;
tabelaEstatisticas = [vectorDifferentObjects(:) groundTruthVideo(:) erroAbsoluto(:) acertoPercentual(:) cc1(:) cc2(:)];
mediaErroAbsoluto = mean(erroAbsoluto);
mediaAcertoPercentual = mean(acertoPercentual);

plot(vectorDifferentObjects, 'bo-')
hold on
plot(groundTruthVideo1, 'rx-')

end

