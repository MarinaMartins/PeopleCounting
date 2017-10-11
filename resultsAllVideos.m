% 15 frames bons
% 9 acertos em 15
% bons exemplos de 3 pessoas
vectorDifferentObjects1x32  = [2 2 2 4 2 3 3 3 3 3 2 2 2 2 2];
vectorDifferentObjects1min6 = [2,2,2,4,2,3,3,3,3,3,2,2,2,2,2];
              vector1NOVONF = [2,2,2,3,2,2,2,2,2,2,2,2,2,2,2];
vectorDifferentObjects1Fase = [2,2,2,3,2,2,2,2,2,2,2,2,2,2,2];
vectorDifferentObjects1NoFilter = [3,3,3,3,1,4,4,4,4,3,5,4,1,1,1];
          vector1NOVOSF     = [2,3,3,3,1,4,4,4,4,3,5,4,1,1,1];
groundTruthVideo1 =          [2 2 3 3 3 3 3 3 3 3 3 3 3 2 2];
vectorDifferentObjects1x16 = [2,3,2,3,2,3,4,4,3,3,2,4,2,2,4];
vectorDifferentObjects1x8  = [3,2,3,3,3,5,3,3,3,3,3,4,2,2,5];
cc1 = [0.9658 0.9615 0.9471 0.9314 0.9584 0.9534 0.9519 0.9385 0.9196 0.9299 0.8982 0.9657 0.9803 0.9864 0.9985];
cc2 = [0.9909 0.9969 0.9944 0.9870 0.9663 0.9943 0.9965 0.9625 0.9682 0.9872 0.9998 0.9990 0.9816 0.9974 0.9985];

%[tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo1, vectorDifferentObjects1NoFilter );



% 11 frames bons
vectorDifferentObjects4 =        [1,2,1,1,2,1,2,2,3,2,1];
vectorDifferentObjects4min6 =    [1,2,1,1,2,1,2,2,3,2,1];
vectorDifferentObjects4Fase =    [1,3,1,1,2,1,2,2,3,2,1];                                 
vectorDifferentObjects4NoFilter= [1,1,1,1,2,2,1,1,3,1,1];
groundTruthVideo4 =              [1 1 1 1 2 2 2 2 2 1 1];

% [tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo4, vectorDifferentObjects4min6 )
% [tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo4, vectorDifferentObjects4Fase )
% [tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo4, vectorDifferentObjects4NoFilter )



% 28 frames bons
% vectorDifferentObjects7 =         [0,0,2,0,0,3,3,0,0,0,3,2,2,2,3,2,1,1,3,1,3,3,0,3,2,0,3,4];
% vectorDifferentObjects7min6 =     [0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,2,1,1,0,0,0,0,0,0,0,0,0,0];
% vectorDifferentObjects7Fase =     [0,0,2,0,0,3,3,0,0,0,3,2,2,2,3,2,1,1,3,1,3,3,0,3,2,0,3,4];
vectorDifferentObjects7FaseWF =   [0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,2,1,1,0,0,0,0,0,0,0,0,0,0];
vectorDifferentObjects7NoFilter = [0,0,0,0,0,0,0,0,0,0,0,4,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0,0];
groundTruthVideo7 =               [0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0,0];
% 
% [tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo7, vectorDifferentObjects7FaseWF )
% [tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo7, vectorDifferentObjects7NoFilter )


% 18 frames bons
% vectorDifferentObjects9 =         [3,1,2,1,2,2,3,5,2,2,  3,4,3,4,4,3,3,0,0, 0,0,3,3,2,1,2,2,3, 4,4,3,3,2,4,4,4,3, 2,2,2,3,3,3,3,3,3, 4,3,3,4,3,3, 3,4,3,3,2,3,2,2,1,3,3,4,3,6];
% vectorDifferentObjects9min6 =     [3,1,2,1,2,2,3,5,3,2,  3,4,3,4,4,3,3,0,0, 0,0,3,3,2,1,2,2,3, 4,4,3,3,2,4,4,4,3, 2,2,2,3,3,3,3,3,3, 4,3,3,4,3,3, 3,4,3,3,2,3,2,2,1,3,3,4,3,6];
vectorDifferentObjects9WF   =     [3,1,2,1,1,2,3,2,3,2,  3,3,3,3,4,3,3,0,0, 0,0,2,3,2,1,2,2,3, 4,4,3,3,2,4,3,3,3, 2,2,2,3,3,3,3,3,2, 4,3,3,4,3,3, 3,4,1,1,2,2,2,2,1,2,3,3,3,5];
vectorDifferentObjects9NoFilter = [4,4,3,3,2,1,1,4,2,4,  3,2,2,2,3,4,2,0,0, 0,0,2,4,2,3,1,3,2, 3,3,4,1,3,2,2,3,4 ,3,1,4,4,4,4,4,4,5, 5,4,5,6,6,3, 3,2,4,2,3,3,2,4,1,3,2,4,2,4];
groundTruthVideo9 =               [3,3,3,2,1,1,2,2,2,2,  3,3,1,1,1,1,1,0,0, 0,0,1,1,1,1,1,1,1, 2,4,4,4,4,4,4,4,4, 4,4,4,4,4,4,4,4,4, 5,4,4,4,4,4, 3,4,2,2,2,2,2,2,1,1,1,1,1,1];
% 
% [tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo9, vectorDifferentObjects9min6 )
% [tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo9, vectorDifferentObjects9NoFilter )



% 20 frames bons
% tem exemplos bons de 2 e 4 pessoas
% vectorDifferentObjects17 =         [0,0,0,0,3,0,0,0,2,3,2,2,1,0,0,0,0,0,0,2,4,1,1,1,2,1,2,2,2,2,3,3,2,1,1,2,2,3,2,5,2,3,2,2,2,1,2,3,1,3,3,4,3,4,4,4,3,3,3,3,3,5,3,3,3,5,1,3,2,1,1,3,3,3,2,3,3,3,4,2,4,4,3,2,3,4,3,3,3,3,3,2,3,3];
% vectorDifferentObjects17min6 =     [0,0,0,0,0,0,0,0,2,3,2,3,2,0,0,0,0,0,0,2,4,1,1,1,2,1,2,2,2,2,2,3,2,1,2,3,2,2,4,0,1,0,2,1,1,1,2,2,2,2,3,4,3,4,2,4,4,4,3,3,3,5,4,3,2,2,1,2,2,1,1,3,2,3,3,4,3,2,4,3,5,3,3,2,3,3,2,4,3,3,3,3,3,3];
vectorDifferentObjects17WF   =     [0,0,0,0,0,0,0,0,2,3,2,3,2,0,0,0,0,0,0,2,4,1,1,1,2,1,2,2,2,2,2,3,2,1,2,3,2,2,4,0,1,0,2,1,1,1,2,2,2,2,2,3,3,3,2,3,4,4,3,1,3,5,4,3,2,2,1,2,2,1,1,3,2,3,2,2,2,3,3,2,4,3,3,2,3,3,2,2,5,4,1,1,2,2];
vectorDifferentObjects17NoFilter = [0,0,0,0,0,0,0,0,4,3,2,2,1,0,0,0,0,0,0,2,3,2,3,2,1,1,2,1,2,2,1,2,1,2,1,1,1,1,3,0,1,0,2,2,1,1,4,2,3,2,2,2,2,2,6,4,3,2,4,2,4,4,3,2,0,1,2,1,2,3,2,3,2,2,3,1,3,1,3,3,3,3,3,1,3,2,2,3,3,1,2,5,3,1];
groundTruthVideo17               = [0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1 2 2 2 2 2 2 2 2 2 2 3 4 4 4 4 4 3 3 3 3 3 2 2 2 2 2 2 2 2 2 2 3 3 4 4 3 3 3 3 3 3 2 2 2 3 3 3 3 3 3 3 3];
% groundTruthVideo17       =       [0,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,4,4,4,4,3,3,3,3,3,3,2,2,2,2,2,2,2,2,2,2,3,3,4,3,3,3,3,3,3,3,2,2,2,3,2,3,3,3,3,3,2,1];


%[tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo17, vectorDifferentObjects17min6 )
%[tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo17, vectorDifferentObjects17NoFilter )

groundTruthVideo19 =               [2 2 3 3 3 1 1 1 1 1 1 1 1 1 1 1 1 1 0];
vectorDifferentObjects19min6Fase = [3,2,3,3,2,2,1,2,3,1,2,1,1,1,2,1,2,2,0];
vectorDifferentObjects19NoFilter = [4,2,4,4,4,1,3,3,2,4,1,3,2,2,3,4,1,4,0];

%[tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo19, vectorDifferentObjects19min6Fase )
% [tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo19, vectorDifferentObjects19NoFilter )



groundTruthVideo20               = [2 2 2 2 2 2 2 3 3 3 4 4 4 3 4 4 4 4 4];
vectorDifferentObjects20min6Fase = [1,1,2,2,2,1,3,2,2,3,3,2,2,2,2,1,2,3,2];
vectorDifferentObjects20NoFilter = [1,3,1,2,3,2,2,2,1,1,4,4,2,3,3,3,3,4,1];

%[tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo20, vectorDifferentObjects20min6Fase )
[tabelaEstatisticas, mediaErroAbsoluto, mediaAcertoPercentual, mediaVetorCalculado, mediaGroundTruth] = calculatesStatistics( groundTruthVideo20, vectorDifferentObjects20NoFilter )
