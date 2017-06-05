
%objeto1.
mu = [30 30];
Sigma = [1 .5; .5 2]; 
R = chol(Sigma);
z1 = repmat(mu,100,1) + randn(100,2)*R;

%objeto2.
mu = [20,50];
Sigma = [1 .5; .5 2]; 
R = chol(Sigma);
z2 = repmat(mu,100,1) + randn(100,2)*R;

%objeto3.
mu = [15, 35];
Sigma = [1 .5; .5 2]; 
R = chol(Sigma);
z3 = repmat(mu,100,1) + randn(100,2)*R;

pontos = [z1 ; z2 ; z3];

figure;
plot(pontos(:,1), pontos(:,2), 'rx')

Y = pdist(pontos);
newZ = linkage(Y);

figure;
dendrogram(newZ);

figure;
plot(newZ(:,3), newZ(:,3),'bo')