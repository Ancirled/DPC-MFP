function [delta,nneigh] = calculateDelta(rho,dist)
    n=size(dist,1);
    [~, ordrho] = sort(rho, 'descend');
    delta = zeros(n,1);
    for i = 2 : n
        delta(ordrho(i)) = max(dist(ordrho(i), :));
        for j = 1 : (i-1)
            if (dist(ordrho(i), ordrho(j)) < delta(ordrho(i)))
                delta(ordrho(i)) = dist(ordrho(i), ordrho(j));
                nneigh(ordrho(i))=ordrho(j);
            end
        end
    end
    delta(ordrho(1)) = max(delta);
end

