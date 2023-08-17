function [dist,path] = Floyd_algorithm(D)

n = size(D);
dist = D;

path = zeros(n);

for j =1:n
    path(:,j) = j;
end

for i = 1:n
    path(i,i) = -1;
end

for k = 1:n
    for i = 1:n
       for j = 1:n
           if dist(i,j) > dist(i,k)+dist(k,j)
               dist(i,j) = dist(i,k) + dist(k,j);
               path(i,j) = path(i,k);
               
           end
       end
    end
end
