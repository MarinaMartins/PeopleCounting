NumCluster = 3;
rand('state', 7)
data = [rand(10,3); rand(10,3)+1; rand(10,3)+2]; 
dist = pdist(data, 'euclidean');
link = linkage(dist, 'complete');
clust = cluster(link, 'maxclust', NumCluster); 
color = link(end-NumCluster+2,3)-eps;
[H,T,perm] = dendrogram(link, 0, 'colorthreshold', color);