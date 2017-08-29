function [blocksVel5, blocksMag5] = storesUpTo5Frames(N, height, width, frame, blocksVel, blocksMag, blocksVel5, blocksMag5)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

time = mod(frame, 5);
if time == 0
    time = 5;
end
blocksVel5(:, :, :,time) = blocksVel(:,:,:) ;
blocksMag5(:,:,time) = blocksMag(:,:);

if frame == 1
    blocksVel5(:, :, :,time) = zeros(height/N, width/N, 2) ;
    blocksMag5(:,:,time) = zeros(height/N, width/N);
end


end

