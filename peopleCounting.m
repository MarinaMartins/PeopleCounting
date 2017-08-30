
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
% OLHAR DE NOVO E FAZER 19 E 20






% Block size N can be 4,8,16,32
N = 32;

% Reading the video
vidReader = VideoReader(videoName7);

% Taking video information

height  = vidReader.Height;
width   = vidReader.Width;
nFramesReal = vidReader.FrameRate * vidReader.Duration;

nFrames = floor(nFramesReal/5);

showBlocks = zeros(height, width);
blockFramesMag = zeros(height/N, width/N, nFrames);

blocksMag5 = zeros(height/N, width/N, 5);
blocksVel5 = zeros(height/N, width/N, 2, 5);

clusterVel = zeros(height*width / (N*N), 2);
clusterVel5 = [];

opticFlow = opticalFlowLK('NoiseThreshold', 0.009);


frameReal = 1; frame5to5 = 1; frame25to25 = 1;
while hasFrame(vidReader)
    % Reading frame
    frameRGB = readFrame(vidReader);
    
    % Defining ROI
    if(frameReal == 1)
        % BW = roipoly(frameRGB);
    end
    
    % Skipping 5 frames
    if(mod(frameReal, 5) == 1)
        % Converting to grayscale
        frameGray = rgb2gray(frameRGB);
        
        % Filtrando usando imfilter - ficaram praticamente iguais
        G = fspecial('gaussian',[5 5],0.5);
        frameGrayFiltered = imfilter(frameGray, G,'same');
        load('BW7.mat')
        frameGrayFilteredMasked = frameGrayFiltered.*uint8(BW);
        
        % Compute optical flow
        flow = estimateFlow(opticFlow, frameGrayFilteredMasked);
        
        
        % A median filter of 5×5 is used to filter out noise
        medianFlowMag = medfilt2(flow.Magnitude, [5 5]);
        medianFlowVx = medfilt2(flow.Vx, [5 5]);
        medianFlowVy = medfilt2(flow.Vy, [5 5]);
        
        % Creating magnitude and velocity blocks NxN
        % Each block value is the mean of pixels values
        [blocksVel, blocksMag] = createBlocksNxN(N, height, width, medianFlowVx, medianFlowVy);
        
        figure(5);quiver(blocksVel(:,:,1),blocksVel(:,:,2));
        
        [blocksVel5, blocksMag5] = storesUpTo5Frames(N, height, width, frame5to5, blocksVel, blocksMag, blocksVel5, blocksMag5);
        
        %         residuo = blocksMag5<0.01;
        %         blocksMag5(residuo) = 0;
        
        if(mod(frame5to5, 5) == 0)
            [blocksMagTemporalFiltered, indicesOfMax] = max(blocksMag5,[],3);
            
            for i = 1:(height/N)
                for j = 1:(width/N)
                    index = indicesOfMax(i,j);
                    blocksVelTemporalFiltered(i,j, :) = blocksVel5(i,j,:,index);
                end
            end
            
            figure(8);
            subplot(2,2,1);
            plot(blocksVelTemporalFiltered(:,:,1),blocksVelTemporalFiltered(:,:,2), 'bx');
            axis([-.5 .5 -.5 .5]);
            subplot(2,2,2);
            
            % blocksVelTemporalFilteredPlot(:,:) = blocksVelTemporalFiltered(end:-1:1);
            
            
            quiver(blocksVelTemporalFiltered(:,:,1),blocksVelTemporalFiltered(:,:,2));
            % Transforming multidimensional array in matrix Nx2, with velx and vely
            clusterVel = reshape(blocksVelTemporalFiltered, height*width / (N*N), 2);
%             clusterVelSemZeros = [];
%             for i = 1:(length(clusterVel))
%                 if(clusterVel(i,:) ~= [0 0])
%                     clusterVelSemZeros = [clusterVelSemZeros ;clusterVel(i,:)];
%                 end
%             end
            
            % Calculating distances between velocities
            distances = pdist(clusterVel);
            % Calculating links
            links = linkage(distances);
            
            c(frame25to25) = cophenet(links, distances);
            disp(c(frame25to25));
            
            %inconsistency = inconsistent(links);
            %maxInconsistency = max(inconsistency(:,4));
            %T = cluster(links,'cutoff',0.8);
            %numberClusters = length(unique(T));
            % Creating and plotting dendrogram
            
            subplot(2,2,3);
            %figure(3);
            dend = dendrogram(links);
            % Plotting distances * distances
            subplot(2,2,4);
            %figure(4);
            plot(links(:,3), links(:,3),'bo')
            
            
            % Transforming multidimensional array in matrix Nx2, with velx and vely
            %clusterVel = reshape(blocksVelTemporalFiltered, height*width / (N*N), 2);
            clusterMag= reshape(blocksMagTemporalFiltered, height*width / (N*N), 1);
            [ similarVelReduced, cluster4] = similarVels( clusterVel, clusterMag );
            
%             similarVelReducedSemZeros = [];
%             for i = 1:(length(similarVelReduced))
%                 if(similarVelReduced(i,:) ~= [0 0])
%                     similarVelReducedSemZeros = [similarVelReducedSemZeros ;similarVelReduced(i,:)];
%                 end
%             end
            
            % Calculating distances between velocities
            distances2 = pdist(similarVelReduced);
            % Calculating links
            links2 = linkage(distances2);
            
            
            c2(frame25to25) = cophenet(links2, distances2);
            %inconsistency = inconsistent(links);
            %maxInconsistency = max(inconsistency(:,4));
            %T = cluster(links,'cutoff',0.8);
            %numberClusters = length(unique(T));
            % Creating and plotting dendrogram
            figure(10);
            
            blocksVelTemporalFiltered2 = reshape(similarVelReduced, height/N,width /N, 2);
            
            subplot(2,2,1);
            plot(blocksVelTemporalFiltered2(:,:,1),blocksVelTemporalFiltered2(:,:,2), 'rx');
            axis([-.5 .5 -.5 .5]);
            subplot(2,2,2);
            quiver(blocksVelTemporalFiltered2(:,:,1),blocksVelTemporalFiltered2(:,:,2));
            
            
            subplot(2,2,3);
            %figure(3);
            dend2 = dendrogram(links2);
            % Plotting distances * distances
            subplot(2,2,4);
            %figure(4);
            plot(links2(:,3), links2(:,3),'bo')
            
            
            nDifferentObjects = countDifferentObjects(links2, 0.15, 0.1);
            disp('Number of Different Objects = ')
            disp(nDifferentObjects)
            vectorDifferentObjects(frame25to25) = nDifferentObjects;
            
            frame25to25 = frame25to25 + 1;
            
            
            blocksMag5 = zeros(height/N, width/N, 5);
            blocksVel5 = zeros(height/N, width/N, 2, 5);
            % keyboard;
        end
        
        
        % Display video frame with flow vectors with decimation
        figure(1);
        subplot(2,1,1);
        %figure(1);
        imshow(frameGrayFilteredMasked)
        hold on
        plot(flow, 'DecimationFactor', [4 4], 'ScaleFactor', 10)
        hold off
        
        
        % Display blocks
        % In order to show the magnitudes, we go back to the
        % original dimensions(instead of the blocked dimensions), so we can have a better visualization
        for i = 1:N:height
            for j = 1:N:width
                showBlocks(i:(i+N-1), j:(j+N-1)) = blocksMag(((i-1)/N)+1, ((j-1)/N)+1 ) ;
            end
        end
        figure(1);
        f2 = subplot(2,1,2);
        %figure(2);
        imshow(showBlocks);
        colormap(f2, 'jet');
        
        %         Display video frames with flow vectors without decimation
        %         figure(3);imshow(frameRGB)
        %         hold on
        %         plot(flow, 'ScaleFactor', 10)
        %         hold off   s
        
        % keyboard;
        frame5to5 = frame5to5 + 1;
    end
    % a1 = [ 2     2     3     3     2     2     2     3     4     4     2     2     2     2     2]
    
    frameReal = frameReal + 1;
end