function [blocksVel, blocksMag] = createBlocksNxN(N, height, width, medianFlowVx, medianFlowVy)
% createBlocksNxN Creates the blocks whose values are the mean value of the
% optical flow
% The resultant optical flow is divided into blocks of
% size N × N. For each block, a single optical flow magnitude
% is assigned by computing the mean of all the flow values in
% that block.

blocksVel = zeros(height/N, width/N, 2);
blocksMag = zeros(height/N, width/N);

for i = 1:N:height
    for j = 1:N:width
        blocksVel(((i-1)/N)+1, ((j-1)/N)+1, 1) = mean(mean(medianFlowVx(i:(i+N-1), j:(j+N-1))));
        blocksVel(((i-1)/N)+1, ((j-1)/N)+1, 2) = mean(mean(medianFlowVy(i:(i+N-1), j:(j+N-1))));
        blocksMag(((i-1)/N)+1, ((j-1)/N)+1 ) = sqrt(blocksVel(((i-1)/N)+1, ((j-1)/N)+1, 1)^2 + blocksVel(((i-1)/N)+1, ((j-1)/N)+1, 2)^2);
    end
end

end

