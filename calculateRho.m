function [rho] = calculateRho(dist,k)
    n=size(dist,1);
    rho = ones(n,1);
    for i=1:n
        [~,orddist] = sort(dist(i,:),'ascend');
        for j=1:k
             rho(i) =rho(i)*exp(-dist(i,orddist(j))/k); 
        end
    end
end
