function [ medianPixelsInTime ] = extractBackground( videoName )
% Returns the matrix with the medianPixels in time

% Reading the video
vidReader = VideoReader(videoName);
nFramesReal = vidReader.FrameRate * vidReader.Duration;

% Taking video information

height  = vidReader.Height;
width   = vidReader.Width;
frames = zeros(height, width, nFramesReal);
currentFrame = 1;
while hasFrame(vidReader)
    frameRGB = readFrame(vidReader);
    frameGray = rgb2gray(frameRGB);
    frames(:,:,currentFrame) = frameGray(:,:);
    currentFrame = currentFrame + 1;
end

medianPixelsInTime = uint8(median(frames,3)); % median in the third dimension - the time
imshow(medianPixelsInTime)
keyboard;
end

