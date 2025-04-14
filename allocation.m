function [clustInd] = allocation(clustInd,nneigh,rho,n)
    n=size(rho,1);
    [~, ordrho] = sort(rho, 'descend');
    for i=1:n
        if (clustInd(ordrho(i))==0)
            clustInd(ordrho(i))=clustInd(nneigh(ordrho(i)));
        end
    end
end

