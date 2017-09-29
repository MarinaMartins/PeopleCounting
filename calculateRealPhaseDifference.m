function [ realPhaseDifference ] = calculateRealPhaseDifference( phase1, phase2 )
% Calculates the realPhaseDifference between the vectors
diff = abs(phase1 - phase2);
if diff < 180
    realPhaseDifference = diff;
else
    realPhaseDifference = 360 - diff;
end

end
