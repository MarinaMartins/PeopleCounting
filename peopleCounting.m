
% People Counting baseado em Crowd Density Estimation Based on Optical Flow
% and Hierarchical Clustering - Rao et al

clear all; close all; clc;
% Video must be in the same directory
videoName1 = strcat(pwd, '\videos\EnterExitCrossingPaths1cor.mpg'); % bom
videoName2 = strcat(pwd, '\videos\EnterExitCrossingPaths1front.mpg'); % ruim no comeco pq acha coisas no nada e depois uma pessoa tem vários vetores
videoName3 = strcat(pwd, '\videos\OneLeaveShop1cor.mpg'); % ruim pq pessoas andando com a mesma velocidade acha que é um só
videoName4 = strcat(pwd, '\videos\OneLeaveShop1front.mpg'); % aceitavel
videoName5 = strcat(pwd, '\videos\OneLeaveShopReenter1cor.mpg'); % ruim pq uma mesma pessoa tem varios vetores
videoName6 = strcat(pwd, '\videos\OneLeaveShopReenter1front.mpg'); % MAIS OU MENOS
videoName7 = strcat(pwd, '\videos\Meet_WalkTogether1.mpg');
videoName8 = strcat(pwd, '\videos\Walk1.mpg'); % ruim pq uma pessoa tem varios vetores
videoName9 = strcat(pwd, '\videos\ThreePastShop1cor.mpg'); % MAIS OU MENOS
videoName10 = strcat(pwd, '\videos\UmaPessoa.mp4');
videoName11 = strcat(pwd, '\videos\DuasPessoas.mp4');
videoName12 = strcat(pwd, '\videos\tresPessoas.mp4');
videoName13 = strcat(pwd, '\videos\casal.mp4');
videoName14 = strcat(pwd, '\videos\carlos1.mp4');
videoName15 = strcat(pwd, '\videos\carlos_gabi.mp4');
videoName16 = strcat(pwd, '\videos\TwoLeaveShop2cor.mpg'); % ruim
videoName17 = strcat(pwd, '\videos\WalkByShop1cor.mpg');% MAIS OU MENOS
videoName18 = strcat(pwd, '\videos\WalkByShop1front.mpg'); %ruim
videoName19 = strcat(pwd, '\videos\EnterExitCrossingPaths2cor.mpg'); % DA PRA APROVEITAR ALGUNS FRAMES
videoName20 = strcat(pwd, '\videos\EnterExitCrossingPaths2front.mpg'); %DA PRA APROVEITAR

% Block size N can be 8,16,32
N = 32;

% Reading the video
vidReader = VideoReader(videoName17);

% Taking video information

height  = vidReader.Height;
width   = vidReader.Width;
nFramesReal = vidReader.FrameRate * vidReader.Duration;

nFrames = floor(nFramesReal/5);


blockFramesMag = zeros(height/N, width/N, nFrames);

blocksMag5 = zeros(height/N, width/N, 5);
blocksVel5 = zeros(height/N, width/N, 2, 5);

clusterVel = zeros(height*width / (N*N), 2);
clusterVel5 = [];

opticFlow = opticalFlowLK('NoiseThreshold', 0.009);


frameReal = 1; frame5to5 = 1; frame25to25 = 1;
% medianPixelsInTime = extractBackground( videoName1 );

while hasFrame(vidReader)
    % Reading frame
    frameRGB = readFrame(vidReader);
    
    % Defining ROI
    if(frameReal == 1)
        % BW = roipoly(frameRGB);
        load('BW7.mat')
    end
    
    % Skipping 5 frames
    if(mod(frameReal, 5) == 1)
        % Converting to grayscale
        frameGray = rgb2gray(frameRGB);
        
        % Filtrando usando imfilter - ficaram praticamente iguais
        G = fspecial('gaussian',[5 5],0.5);
        frameGrayFiltered = imfilter(frameGray, G,'same');
        frameGrayFilteredMasked = frameGrayFiltered.*uint8(BW);
        
        %         frameGrayFilteredMasked = frameGrayFilteredMasked-medianPixelsInTime;
        %         imshow(frameGrayFilteredMasked);
        %         keyboard;
        
        % Compute optical flow
        flow = estimateFlow(opticFlow, frameGrayFilteredMasked);
        
        
        % A median filter of 5×5 is used to filter out noise
        medianFlowMag = medfilt2(flow.Magnitude, [5 5]);
        medianFlowVx = medfilt2(flow.Vx, [5 5]);
        medianFlowVy = medfilt2(flow.Vy, [5 5]);
        
        % Creating magnitude and velocity blocks NxN
        % Each block value is the mean of pixels values
        [blocksVel, blocksMag] = createBlocksNxN(N, height, width, medianFlowVx, medianFlowVy);
        % plotBlocksVelAsQuiver( blocksVel );
        
        [blocksVel5, blocksMag5] = storesUpTo5Frames(N, height, width, frame5to5, blocksVel, blocksMag, blocksVel5, blocksMag5);
        % keyboard;
        if(mod(frame5to5, 5) == 0)
            [blocksMagTemporalFiltered, indicesOfMax] = max(blocksMag5,[],3);
            
            for i = 1:(height/N)
                for j = 1:(width/N)
                    index = indicesOfMax(i,j);
                    blocksVelTemporalFiltered(i,j, :) = blocksVel5(i,j,:,index);
                    blocksVelTemporalFilteredMag(i,j) = (blocksVelTemporalFiltered(i,j, 1)^2 + blocksVelTemporalFiltered(i,j, 2)^2)^(1/2);
                end
            end
            
            plotBlocksVelTemporalFiltered( blocksVelTemporalFiltered, 'nofilter' );
            
            % Transforming multidimensional array in matrix Nx2, with velx and vely
            clusterVel = reshape(blocksVelTemporalFiltered, height*width / (N*N), 2);
            % Transforming multidimensional array in matrix Nx1, with magnitudes
            clusterMag= reshape(blocksMagTemporalFiltered, height*width / (N*N), 1);
            
            % Filtering similar velocity vectors
            [ similarVelReduced, cluster4] = filterSimilarVels( clusterVel, clusterMag );
            
            % Creating multidimensional array (height/N)x(width /N, 2), in
            % order to visualize
            blocksVelTemporalFiltered2 = reshape(similarVelReduced, height/N,width /N, 2);
            plotBlocksVelTemporalFiltered( blocksVelTemporalFiltered2, 'withFilter' );
            
            % Hierarchical Clustering
            [ distances, links, c, dend ] = hierarchicalClustering( clusterVel, 'nofilter', frame25to25 );
            [ distances2, links2, c2, ~ ] = hierarchicalClustering( similarVelReduced, 'withFilter',  frame25to25 );
            
            % Estimated number of people
            vectorDifferentObjectsWithFilter(frame25to25) = countDifferentObjects(links2, 0.15, 0.1);
            
            vectorDifferentObjectsNoFilter(frame25to25) = countDifferentObjects(links, 0.35, 0.1);
            disp('Number of Different Objects No Filter= ')
            disp(vectorDifferentObjectsNoFilter(frame25to25))
            
            disp('Number of Different Objects With Filter= ')
            disp(vectorDifferentObjectsWithFilter(frame25to25))
            
            disp('Frame25to25 = ')
            disp(frame25to25)
            
            blocksMag5 = zeros(height/N, width/N, 5);
            blocksVel5 = zeros(height/N, width/N, 2, 5);
            
            frame25to25 = frame25to25 + 1;
            keyboard;
        end
        
        showFrames(frameRGB, frameGrayFilteredMasked); % if want to show flow, add parameter flow
        % showBlocksOriginalDimensions(N, height, width, blocksMag);
        % keyboard;
        frame5to5 = frame5to5 + 1;
    end
    % a1 = [ 2     2     3     3     2     2     2     3     4     4     2     2     2     2     2]
    
    frameReal = frameReal + 1;
end