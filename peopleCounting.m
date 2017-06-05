
% People Counting baseado em Crowd Density Estimation Based on Optical Flow
% and Hierarchical Clustering - Rao et al 

clear all; close all; clc;

videoName1 = 'C:\Users\Marina\Desktop\8 semestre\1-Projeto Final\4-Codigo\EnterExitCrossingPaths1cor.mpg';
videoName2 = 'C:\Users\Marina\Desktop\8 semestre\1-Projeto Final\4-Codigo\OneLeaveShop1cor.mpg';


% Block size N can be 4,8,16,32
N = 32;

% Reading the video
vidReader = VideoReader(videoName2);

% Taking video information

height  = vidReader.Height;
width   = vidReader.Width;
nFramesReal = vidReader.FrameRate * vidReader.Duration;

nFrames = floor(nFramesReal/5);

blocks = zeros(height/N, width/N);
showBlocks = zeros(height, width);
blockFramesMag = zeros(height/N, width/N, nFrames);
blocksVel = zeros(height/N, width/N, 2);
blocksMag5 = zeros(height/N, width/N, 5);
blocksVel5 = zeros(height/N, width/N, 2, 5);
clusterVel = zeros(height*width / (N*N), 2);
clusterVel5 = [];

opticFlow = opticalFlowLK('NoiseThreshold', 0.009);


frameReal = 1; frame = 1;
while hasFrame(vidReader)
    % Reading frame 
    frameRGB = readFrame(vidReader);
    
    % Defining ROI 
    if(frameReal == 1)
        BW = roipoly(frameRGB);
    end
    
    % Skipping 5 frames
    if(mod(frameReal, 5) == 1)
        % Converting to grayscale
        frameGray = rgb2gray(frameRGB);
        
        % Filtrando usando imfilter - ficaram praticamente iguais
        G = fspecial('gaussian',[5 5],0.5);
        frameGrayFiltered = imfilter(frameGray, G,'same');
        frameGrayFilteredMasked = frameGrayFiltered.*uint8(BW);
        
        % Compute optical flow
        flow = estimateFlow(opticFlow, frameGrayFilteredMasked);
        % A median filter of 5×5 is used to filter out noise
        medianFlowMag = medfilt2(flow.Magnitude, [5 5]);
        medianFlowVx = medfilt2(flow.Vx, [5 5]);
        medianFlowVy = medfilt2(flow.Vy, [5 5]);
        
        % Creating magnitude and velocity blocks NxN
        % Each block value is the mean of pixels values 
        for i = 1:N:height
            for j = 1:N:width
                blocks(((i-1)/N)+1, ((j-1)/N)+1 ) = mean(mean(medianFlowMag(i:(i+N-1), j:(j+N-1))));
                blocksVel(((i-1)/N)+1, ((j-1)/N)+1, 1) = mean(mean(medianFlowVx(i:(i+N-1), j:(j+N-1))));
                blocksVel(((i-1)/N)+1, ((j-1)/N)+1, 2) = mean(mean(medianFlowVy(i:(i+N-1), j:(j+N-1))));
            end
        end
        
        
        blocksVel5(:, :, :,mod(frame, 5)) = blocksVel(:,:,:) ;
        keyboard;
        
        if(mod(frame, 5) ~= 4)
            % Transforming multidimensional array in matrix Nx2, with velx and vely
            clusterVel = reshape(blocksVel, height*width / (N*N), 2);
        else
            clusterVel5 = [clusterVel5; clusterVel];
             % Calculating distances between velocities
             distances = pdist(clusterVel5);
             % Calculating links 
             links = linkage(distances);         
             
             
             c = cophenet(links, distances);
             disp(c);
             clusterVel5 = [];
             %inconsistency = inconsistent(links);
             %maxInconsistency = max(inconsistency(:,4));
             %T = cluster(links,'cutoff',0.8);
             %numberClusters = length(unique(T));
            % Creating and plotting dendrogram
            figure(3); dend = dendrogram(links);
            % Plotting distances * distances 
            figure(4); plot(links(:,3), links(:,3),'bo')
            
        end
        
        
        % Display video frame with flow vectors with decimation
        figure(1);imshow(frameGrayFilteredMasked)
        hold on
        plot(flow, 'DecimationFactor', [4 4], 'ScaleFactor', 10)
        hold off   
        frame = frame + 1;
        
        % Display blocks
        
        for i = 1:N:height
            for j = 1:N:width
                showBlocks(i:(i+N-1), j:(j+N-1)) = blocks(((i-1)/N)+1, ((j-1)/N)+1 ) ;
            end
        end
        
        figure(2); imshow(showBlocks, [0 0.1]);
        colormap(2,'jet');
        
%         % Display video frames with flow vectors without decimation
%         figure(3);imshow(frameRGB)
%         hold on
%         plot(flow, 'ScaleFactor', 10)
%         hold off   s
        
        keyboard;
        frame = frame + 1;
    end
    
    frameReal = frameReal + 1;
end