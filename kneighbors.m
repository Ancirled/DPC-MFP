function [knn] = kneighbors(X,dist,k)
    n=size(dist,1);
    knn = zeros(n,k);

    kdtree = KDTreeSearcher(X,'bucketsize',1); 
    [index,~] = knnsearch(kdtree,X,'k',k+1);
    for i=1:n
        knn(i,1:k) = index(i,2:k+1);
    end
end

