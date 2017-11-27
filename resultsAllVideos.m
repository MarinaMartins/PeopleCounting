% VIDEO 1
% 15 frames bons
% 9 acertos em 15
% bons exemplos de 3 pessoas
% vectorDifferentObjects1min6BeforePhase = [2,2,2,4,2,3,3,3,3,3,2,2,2,2,2];
% vectorDifferentObjects1x16 = [2,3,2,3,2,3,4,4,3,3,2,4,2,2,4];
% vectorDifferentObjects1x8  = [3,2,3,3,3,5,3,3,3,3,3,4,2,2,5];
% cc1 = [0.9658 0.9615 0.9471 0.9314 0.9584 0.9534 0.9519 0.9385 0.9196 0.9299 0.8982 0.9657 0.9803 0.9864 0.9985];
% cc2 = [0.9909 0.9969 0.9944 0.9870 0.9663 0.9943 0.9965 0.9625 0.9682 0.9872 0.9998 0.9990 0.9816 0.9974 0.9985];

vector1NoFilter   = [3,3,3,3,1,4,4,4,4,3,5,4,1,1,1];
vector1WithFilter = [2,2,2,3,2,2,2,2,2,2,2,2,2,2,2];
groundTruthVideo1 = [2 2 3 3 3 3 3 3 3 3 3 3 3 2 2];         
% 
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 1 NO FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo1, vector1NoFilter )
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 1 WITH FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo1, vector1WithFilter )

% plotResults( groundTruthVideo1, vector1NoFilter,vector1WithFilter );

% VIDEO 4
% 11 frames bons
% vectorDifferentObjects4BeforePhase            =    [1,2,1,1,2,1,2,2,3,2,1];
% % vectorDifferentObjects4min6BeforePhase        =    [1,2,1,1,2,1,2,2,3,2,1];

vector4NoFilter   = [1,1,1,1,2,2,1,1,3,1,1];
vector4WithFilter = [1,3,1,1,2,1,2,2,3,2,1];
groundTruthVideo4 = [1 1 1 1 2 2 2 2 2 1 1];
% 
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 4 NO FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo4, vector4NoFilter )
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 4 WITH FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo4, vector4WithFilter )

% plotResults( groundTruthVideo4, vector4NoFilter,vector4WithFilter );

% VIDEO 7
% 28 frames bons
% vectorDifferentObjects7 =         [0,0,2,0,0,3,3,0,0,0,3,2,2,2,3,2,1,1,3,1,3,3,0,3,2,0,3,4];
% vectorDifferentObjects7min6 =     [0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,2,1,1,0,0,0,0,0,0,0,0,0,0];
% vectorDifferentObjects7Fase =     [0,0,2,0,0,3,3,0,0,0,3,2,2,2,3,2,1,1,3,1,3,3,0,3,2,0,3,4];

vector7NoFilter   = [0,0,0,0,0,0,0,0,0,0,0,4,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0,0];
vector7WithFilter = [0,0,0,0,0,0,0,0,0,0,3,2,2,2,3,2,1,1,0,0,0,0,0,0,0,0,0,0];
groundTruthVideo7 = [0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,1,1,0,0,0,0,0,0,0,0,0,0];
% 
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 7 NO FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo7, vector7NoFilter )
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 7 WITH FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo7, vector7WithFilter )
% plotResults( groundTruthVideo7, vector7NoFilter,vector7WithFilter );
% 

% VIDEO 9
% 18 frames bons
% vectorDifferentObjects9 =         [3,1,2,1,2,2,3,5,2,2,  3,4,3,4,4,3,3,0,0, 0,0,3,3,2,1,2,2,3, 4,4,3,3,2,4,4,4,3, 2,2,2,3,3,3,3,3,3, 4,3,3,4,3,3, 3,4,3,3,2,3,2,2,1,3,3,4,3,6];
% vectorDifferentObjects9min6 =     [3,1,2,1,2,2,3,5,3,2,  3,4,3,4,4,3,3,0,0, 0,0,3,3,2,1,2,2,3, 4,4,3,3,2,4,4,4,3, 2,2,2,3,3,3,3,3,3, 4,3,3,4,3,3, 3,4,3,3,2,3,2,2,1,3,3,4,3,6];

vector9NoFilter   = [4,4,3,3,2,1,1,4,2,4,  3,2,2,2,3,4,2,0,0, 0,0,2,4,2,3,1,3,2, 3,3,4,1,3,2,2,3,4, 3,1,4,4,4,4,4,4,5, 5,4,5,6,6,3, 3,2,4,2,3,3,2,4,1,3,2,4,2,4];
vector9WithFilter = [3,1,2,1,1,2,3,2,3,2,  3,3,3,3,4,3,3,0,0, 0,0,2,3,2,1,2,2,3, 4,4,3,3,2,4,3,3,3, 2,2,2,3,3,3,3,3,2 ,4,3,3,4,3,3, 3,4,1,1,2,2,2,2,1,2,3,3,3,5]; 
groundTruthVideo9 = [3,3,3,2,1,1,2,2,2,2,  3,3,1,1,1,1,1,0,0, 0,0,1,1,1,1,1,1,1, 2,4,4,4,4,4,4,4,4, 4,4,4,4,4,4,4,4,4, 5,4,4,4,4,4, 3,4,2,2,2,2,2,2,1,1,1,1,1,1];
%%%%OK

% 
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 9 NO FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo9, vector9NoFilter )
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 9 WITH FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo9, vector9WithFilter )
% plotResults( groundTruthVideo9, vector9NoFilter,vector9WithFilter );
% 

% VIDEO 17
% 20 frames bons
% tem exemplos bons de 2 e 4 pessoas
% vectorDifferentObjects17 =         [0,0,0,0,3,0,0,0,2,3,2,2,1,0,0,0,0,0,0,2,4,1,1,1,2,1,2,2,2,2,3,3,2,1,1,2,2,3,2,5,2,3,2,2,2,1,2,3,1,3,3,4,3,4,4,4,3,3,3,3,3,5,3,3,3,5,1,3,2,1,1,3,3,3,2,3,3,3,4,2,4,4,3,2,3,4,3,3,3,3,3,2,3,3];
% vectorDifferentObjects17min6 =     [0,0,0,0,0,0,0,0,2,3,2,3,2,0,0,0,0,0,0,2,4,1,1,1,2,1,2,2,2,2,2,3,2,1,2,3,2,2,4,0,1,0,2,1,1,1,2,2,2,2,3,4,3,4,2,4,4,4,3,3,3,5,4,3,2,2,1,2,2,1,1,3,2,3,3,4,3,2,4,3,5,3,3,2,3,3,2,4,3,3,3,3,3,3];

vector17NoFilter   = [0,0,0,0,0,0,0,0,4,3,2,2,1,0,0,0,0,0,0,2,3,2,3,2,1,1,2,1,2,2,1,2,1,2,1,1,1,1,3,0,1,0,2,2,1,1,4,2,3,2,2,2,2,2,6,4,3,2,4,2,4,4,3,2,0,1,2,1,2,3,2,3,2,2,3,1,3,1,3,3,3,3,3,1,3,2,2,3,3,1,2,5,3,1];
vector17WithFilter = [0,0,0,0,0,0,0,0,2,3,2,3,2,0,0,0,0,0,0,2,4,1,1,1,2,1,2,2,2,2,2,3,2,1,2,3,2,2,4,0,1,0,2,1,1,1,2,2,2,2,2,3,3,3,2,3,4,4,3,1,3,5,4,3,2,2,1,2,2,1,1,3,2,3,2,2,2,3,3,2,4,3,3,2,3,3,2,2,5,4,1,1,2,2];
groundTruthVideo17 = [0 0 0 0 0 0 0 0 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 1 1 2 2 2 2 2 2 2 2 2 2 3 4 4 4 4 4 3 3 3 3 3 2 2 2 2 2 2 2 2 2 2 3 3 4 4 3 3 3 3 3 3 2 2 2 3 3 3 3 3 3 3 3];
%OK
% 
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 17 NO FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo17, vector17NoFilter )
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 17 WITH FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo17, vector17WithFilter )
% plotResults( groundTruthVideo17, vector17NoFilter,vector17WithFilter );
% 

% VIDEO 19
vector19NoFilter   = [4,2,4,4,4,1,3,3,2,4,1,3,2,2,3,4,1,4,0];
vector19WithFilter = [3,2,3,3,2,2,1,2,3,1,2,1,1,1,2,1,2,2,0];
groundTruthVideo19 = [2 2 3 3 3 1 1 1 1 1 1 1 1 1 1 1 1 1 0];% OK
% 
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 19 NO FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo19, vector19NoFilter )
% disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 19 WITH FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
% [mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo19, vector19WithFilter )
% plotResults( groundTruthVideo19, vector19NoFilter,vector19WithFilter );


% VIDEO 20
vector20NoFilter   = [1,3,1,2,3,2,2,2,1,1,4,4,2,3,3,3,3,4,1];
vector20WithFilter = [1,1,2,2,2,1,3,2,2,3,3,2,2,2,2,1,2,3,2];
groundTruthVideo20 = [2 2 2 2 2 2 2 3 3 3 4 4 4 3 4 4 4 4 4]; %OK

disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 20 NO FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
[mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo20, vector20NoFilter )
disp('%%%%%%%%%%%%%%%%%%%%%%% VIDEO 20 WITH FILTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%')
[mediaVetorCalculado, mediaGroundTruth, mediaErroAbsoluto, mediaAcuracia, tabelaEstatisticas] = calculatesStatistics( groundTruthVideo20, vector20WithFilter )
plotResults( groundTruthVideo20, vector20NoFilter,vector20WithFilter );
