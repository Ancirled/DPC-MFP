clear all; close all; clc;
% st=cputime;
% fileName = 'Datasets/synthetic/Flame.txt';
% X = load(fileName);





T = X(:,end);                                  
X(:,end)=[];                                  
%% 
k = 42;
l = 19;
%% 
X=normalize(X);                              
dist = calculateDist(X);                     
n = size(dist,1);                             

% result=zeros(1,5);
% for k = 1:50
%     for l = 1:30
        
[rho] = calculateRho(dist,k);                 
[delta,nneigh] = calculateDelta(rho,dist);     
knn = kneighbors(X,dist,k);                    

%% 
[numCluster,clustInd,centerInd,selected] = featureSelect(dist,knn,rho,l);
%% 
[clustInd] = allocation(clustInd,nneigh,rho);

[NMI,ARI,Purity]=evaluation(T,clustInd,n,2);
