
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


set(gca,'fontsize',24);



% Block size N can be 4,8,16,32
N = 32;

% Reading the video
vidReader = VideoReader(videoName1);

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
% medianPixelsInTime = extractBackground( videoName1 );

while hasFrame(vidReader)
    % Reading frame
    frameRGB = readFrame(vidReader);
    
    % Defining ROI
    if(frameReal == 1)
        % BW = roipoly(frameRGB);
        load('BW1.mat')
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
        aux = blocksVel(:,:,1);
        aux = aux(end:-1:1,:);
        figure(55);quiver(aux,blocksVel(:,:,2), 'LineWidth',4);
        title('Velocidades por Blocos',  'FontSize',40)
            set(gca,'DefaultTextFontSize',40)           
            set(gca,'FontSize',40)
            set(gca, 'XTick',0:2:12, 'FontSize',40)  
            set(gca, 'YTick',0:2:10, 'FontSize',40)
        
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
            
            figure(3);
            
            % subplot(2,2,1);
            plot(blocksVelTemporalFiltered(:,:,1),blocksVelTemporalFiltered(:,:,2), 'bx', 'LineWidth',4, 'MarkerSize', 30);
            axis([-.5 .5 -.5 .5]);
            title('Velocidades como Pontos', 'FontSize',40)
            set(gca,'DefaultTextFontSize',35)           
            set(gca,'FontSize',35)
            set(gca, 'XTick',-.5:0.1:.5, 'FontSize',35)  
            set(gca, 'YTick',-.5:0.25:.5, 'FontSize',35) 
            
            
            figure(4);
            % subplot(2,2,2);            
            % blocksVelTemporalFilteredPlot(:,:) = blocksVelTemporalFiltered(end:-1:1);  
            aux = blocksVelTemporalFiltered(:,:,1);
            aux = aux(end:-1:1,:);
            quiver(aux,blocksVelTemporalFiltered(:,:,2), 'LineWidth',4);
            title('Velocidades por Blocos',  'FontSize',40)
            set(gca,'DefaultTextFontSize',40)           
            set(gca,'FontSize',40)
            set(gca, 'XTick',0:2:12, 'FontSize',40)  
            set(gca, 'YTick',0:2:10, 'FontSize',40)
            
            % Transforming multidimensional array in matrix Nx2, with velx and vely
            clusterVel = reshape(blocksVelTemporalFiltered, height*width / (N*N), 2);
           
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
            
            % subplot(2,2,3);
            figure(5);
            dend = dendrogram(links);
            set(dend,'LineWidth',4)
            set(gca,'DefaultTextFontSize',24)           
            set(gca,'FontSize',24)
            xlabel('Índices dos objetos', 'FontSize',40) 
            ylabel('Distância dos clusters', 'FontSize',40)
            title('Dendrograma', 'FontSize',40)
            
   
            
            % Plotting distances * distances
            %subplot(2,2,4);
            figure(6);
            plot(links(:,3), links(:,3),'bo', 'LineWidth',4, 'MarkerSize', 30)
            set(gca,'DefaultTextFontSize',35)           
            set(gca,'FontSize',35)
            title('Distância x Distância', 'FontSize',40)
            xlabel('Distância dos clusters', 'FontSize',40) 
            ylabel('Distância dos clusters', 'FontSize',40)
            
            
            
            
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
           
            
            blocksVelTemporalFiltered2 = reshape(similarVelReduced, height/N,width /N, 2);
            
            %subplot(2,2,1);
            figure(10);
            plot(blocksVelTemporalFiltered2(:,:,1),blocksVelTemporalFiltered2(:,:,2), 'rx','LineWidth',4, 'MarkerSize', 30); 
            axis([-.5 .5 -.5 .5]);
            title('Velocidades como Pontos', 'FontSize',40)
            set(gca,'DefaultTextFontSize',35)           
            set(gca,'FontSize',35)
            set(gca, 'XTick',-.5:0.1:.5, 'FontSize',35)  
            set(gca, 'YTick',-.5:0.25:.5, 'FontSize',35) 
            
            %subplot(2,2,2);
            figure(11);
            quiver(blocksVelTemporalFiltered2(:,:,1),blocksVelTemporalFiltered2(:,:,2),'color', [1 0 0], 'LineWidth',4);           
            title('Velocidades por Blocos',  'FontSize',40)
            set(gca,'DefaultTextFontSize',40)           
            set(gca,'FontSize',40)
            set(gca, 'XTick',0:2:12, 'FontSize',40)  
            set(gca, 'YTick',0:2:10, 'FontSize',40)
            
            %subplot(2,2,3);
            figure(12);
            dend2 = dendrogram(links2); 
            set(dend2,'Color','red')
            set(dend2,'LineWidth',4)
            set(gca,'DefaultTextFontSize',24)           
            set(gca,'FontSize',24)
            xlabel('Índices dos objetos', 'FontSize',40) 
            ylabel('Distância dos clusters', 'FontSize',40)
            title('Dendrograma', 'FontSize',40)
            
            
       
            % Plotting distances * distances
            % subplot(2,2,4);
            figure(13);
            plot(links2(:,3), links2(:,3),'ro', 'LineWidth',4, 'MarkerSize', 30)
             title('Distância x Distância', 'FontSize',40)
            xlabel('Distância dos clusters', 'FontSize',40) 
            ylabel('Distância dos clusters', 'FontSize',40)
            set(gca,'DefaultTextFontSize',35)           
            set(gca,'FontSize',35)
            
           
            vectorDifferentObjects(frame25to25) = countDifferentObjects(links2, 0.15, 0.1);
            
            vectorDifferentObjectsNoFilter(frame25to25) = countDifferentObjects(links, 0.35, 0.1);
            disp('Number of Different Objects No Filter= ')
            disp(vectorDifferentObjectsNoFilter(frame25to25))
            
            disp('Number of Different Objects With Filter= ')
            disp(vectorDifferentObjects(frame25to25))
            
            disp('Frame25to25 = ')
            disp(frame25to25)
            
            
          
            blocksMag5 = zeros(height/N, width/N, 5);
            blocksVel5 = zeros(height/N, width/N, 2, 5);
            
            frame25to25 = frame25to25 + 1;
           % keyboard;
        end
        
        
        % Display video frame with flow vectors with decimation
              
        f1 = figure(1); hAxes = gca;        
        imshow(frameRGB, 'Parent', hAxes, 'Border','tight' )  ;    
        title(hAxes, 'Frame RGB', 'FontSize',35);
%         hold on
%         plot(flow, 'DecimationFactor', [4 4], 'ScaleFactor', 10)
%         hold off
        
        figure(2);
        
        imshow(frameGrayFilteredMasked, 'Border','tight');
        title('Frame Tons de Cinza Mascarado', 'FontSize',35);
        
        figure(25);
        
        imshow(frameGrayFilteredMasked,'Border','tight');
        title('Frame com OpticalFlow', 'FontSize',35);
        
        hold on
        plot(flow, 'DecimationFactor', [4 4], 'ScaleFactor', 10)
        hold off
        
        
        
        
        % Display blocks
        % In order to show the magnitudes, we go back to the
        % original dimensions(instead of the blocked dimensions), so we can have a better visualization
        for i = 1:N:height
            for j = 1:N:width
                showBlocks(i:(i+N-1), j:(j+N-1)) = blocksMag(((i-1)/N)+1, ((j-1)/N)+1 ) ;
                %showBlocksTemporalFiltered(i:(i+N-1), j:(j+N-1)) = blocksVelTemporalFilteredMag(((i-1)/N)+1, ((j-1)/N)+1 ) ;

            end
        end
        
        f2 = figure(35);
        
        imshow(showBlocks, 'Border','tight');
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