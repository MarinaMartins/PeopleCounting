function nDifferentObjects = countDifferentObjects(links2, thresholdNoObjects, thresholdSameObject);
% UNTITLED Summary of this function goes here
%   Detailed explanation goes here
distances = links2(:,3);
maxDistance = max(distances);

if(maxDistance<0.006)
    nDifferentObjects = 0;
else
    % excluding distances less than the thresholdNoObjects
    distances = distances(distances > thresholdNoObjects*maxDistance);
    
    initialNumberOfObjects = length(distances);
    
    for i = 1:initialNumberOfObjects
        for j = (i+1):initialNumberOfObjects
            if( abs(distances(i)-distances(j))<thresholdSameObject*maxDistance)
                distances(j)=distances(i);
            end
        end
    end
    
    nDifferentObjects = length(unique(distances));
end
end

