function [] = showFrames(frameRGB, frameGrayFilteredMasked)
%showFrames shows Frames RGB and after preprocessing

% Display video frame with flow vectors with decimation

figure(1); hAxes = gca;
imshow(frameRGB, 'Parent', hAxes, 'Border','tight' )  ;
title(hAxes, 'Frame RGB', 'FontSize',35);
%         hold on
%         plot(flow, 'DecimationFactor', [4 4], 'ScaleFactor', 10)
%         hold off

figure(2);
imshow(frameGrayFilteredMasked, 'Border','tight');
title('Frame Tons de Cinza Mascarado', 'FontSize',35);

% figure(25);
% imshow(frameGrayFilteredMasked,'Border','tight');
% title('Frame com OpticalFlow', 'FontSize',35);
% hold on
% plot(flow, 'DecimationFactor', [4 4], 'ScaleFactor', 10)
% hold off

end

