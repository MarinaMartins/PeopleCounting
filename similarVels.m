function [ similarVelReduced, cluster4] = similarVels( clusterVel, clusterMag)
%CLUSTERIZATION Summary of this function goes here
%   Detailed explanation goes here
nObjects = length(clusterMag);
[sortedClusterMag, indices] = sort(clusterMag, 'descend');
clusterVelX = clusterVel(:,1); sortedClusterVelX=clusterVelX(indices);
clusterVelY = clusterVel(:,2); sortedClusterVelY=clusterVelY(indices);
clusterPhase = atan2(sortedClusterVelY,sortedClusterVelX)*180/pi;
cluster4 = [sortedClusterMag, sortedClusterVelX, sortedClusterVelY, clusterPhase];
similarVelReduced = [sortedClusterVelX, sortedClusterVelY];

minMag=0.1*max(sortedClusterMag);
magThreshold = 0.5*max(sortedClusterMag);
phaseThreshold = 30;

for i = 1:nObjects
    if(cluster4(i,1)>minMag)
        for j = (i+1):nObjects
            if(cluster4(j,1)>minMag)
                if( abs(clusterPhase(i)-clusterPhase(j))< phaseThreshold && ((cluster4(i,1)-cluster4(j,1))<magThreshold))
                    similarVelReduced(j,:)=similarVelReduced(i,:);
                end
                
            end
            
        end
    end
    
end


end

