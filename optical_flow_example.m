clear all; close all; clc;
% Video must be in the same directory
videoName1 = strcat(pwd, '\videos\EnterExitCrossingPaths1cor.mpg'); % bom

% Reading the video
vidReader = VideoReader(videoName1);

% Taking video information

height  = vidReader.Height;
width   = vidReader.Width;
nFramesReal = vidReader.FrameRate * vidReader.Duration;


opticFlowLK = opticalFlowLK('NoiseThreshold', 0.009);
opticFlowHS = opticalFlowHS;
frameReal = 1; frame5to5 = 1; 
while hasFrame(vidReader)
    % Reading frame
    frameRGB = readFrame(vidReader);
    
    if(mod(frameReal, 2) == 0)
    
    % Converting to grayscale
    frameGray = rgb2gray(frameRGB);
    
    figure(1); hAxes = gca;
    imshow(frameRGB, 'Parent', hAxes, 'Border','tight' )  ;
    
    % Compute optical flow LK
    flowLK = estimateFlow(opticFlowLK, frameGray);
    
    vx=flowLK.Vx;
    vy=flowLK.Vy;
    auxVx = 10000*vx(end:-1:1,:);
    auxVy = 10000*vy(end:-1:1,:);  
        
    figure(2);quiver(auxVx,auxVy, 'LineWidth',4, 'color', [0 0 0]);
    title('Fluxo Óptico Lukas-Kanade',  'FontSize',40)
    set(gca,'DefaultTextFontSize',40)
    set(gca,'FontSize',40)
    axis([0 384 0 288])
    set(gca,'XTick', [0:50:350 384]);
    set(gca,'YTick', [0:50:250 288]);
    
    figure(3);quiver(auxVx,auxVy, 'LineWidth',4, 'color', [0 0 0]);
    title('Fluxo Óptico Lukas-Kanade com Zoom',  'FontSize',40)
    set(gca,'DefaultTextFontSize',40)
    set(gca,'FontSize',40)
    axis([100 292 100 244])
    set(gca,'XTick', [100:50:292 292]);
    set(gca,'YTick', [100:50:244 244]);
    
    figure(4);quiver(auxVx,auxVy, 'LineWidth',4, 'color', [0 0 0]);
    title('Fluxo Óptico Lukas-Kanade com Zoom',  'FontSize',40)
    set(gca,'DefaultTextFontSize',40)
    set(gca,'FontSize',40)
    axis([130 135 175 185])
    
    % Compute optical flow HS
    flowHS = estimateFlow(opticFlowHS, frameGray);
    
    vx=flowHS.Vx;
    vy=flowHS.Vy;
    auxVx = 10000*vx(end:-1:1,:);
    auxVy = 10000*vy(end:-1:1,:);
    
    figure(5);quiver(auxVx,auxVy, 'LineWidth',4, 'color', [0 0 0]);
    title('Fluxo Óptico Horn-Schunk',  'FontSize',40)
    set(gca,'DefaultTextFontSize',40)
    set(gca,'FontSize',40)
    axis([0 384 0 288])
    set(gca,'XTick', [0:50:350 384]);
    set(gca,'YTick', [0:50:250 288]);
    
    figure(6);quiver(auxVx,auxVy, 'LineWidth',4, 'color', [0 0 0]);
    title('Fluxo Óptico Horn-Schunk com Zoom',  'FontSize',40)
    set(gca,'DefaultTextFontSize',40)
    set(gca,'FontSize',40)
    axis([100 292 100 244])    
    set(gca,'XTick', [100:50:292 292]);
    set(gca,'YTick', [100:50:244 244]);
    
    figure(7);quiver(auxVx,auxVy, 'LineWidth',4, 'color', [0 0 0]);
    title('Fluxo Óptico Horn-Schunk com Zoom',  'FontSize',40)
    set(gca,'DefaultTextFontSize',40)
    set(gca,'FontSize',40)
    axis([130 135 175 185])
    
    frame5to5 = frame5to5 + 1;
    disp(frame5to5 );
    keyboard;
    end
   
    frameReal = frameReal + 1;
    
    
end