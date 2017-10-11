function [] = showBlocksOriginalDimensions(N, height, width, blocksMag)
% showBlocksOriginalDimensions Displays blocks in the original dimensions
% Display blocks
% In order to show the magnitudes, we go back to the
% original dimensions(instead of the blocked dimensions), so we can have a better visualization

showBlocks = zeros(height, width);

for i = 1:N:height
    for j = 1:N:width
        showBlocks(i:(i+N-1), j:(j+N-1)) = blocksMag(((i-1)/N)+1, ((j-1)/N)+1 ) ;
        %showBlocksTemporalFiltered(i:(i+N-1), j:(j+N-1)) = blocksVelTemporalFilteredMag(((i-1)/N)+1, ((j-1)/N)+1 ) ;
        
    end
end

f2 = figure(35);

imshow(showBlocks, 'Border','tight');
colormap(f2, 'jet');


end

