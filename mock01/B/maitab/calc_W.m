function [W,t] = calc_W(S_t_W,t_A_W)
W = zeros(7, 15);
t = zeros(7, 15);

for i = 1: 7
    for j = 1:15
        min1 = inf;
        min2 = 1;
        for k = 1: 17
            if min1 > (S_t_W(i,k)+t_A_W(j,k))
                min1 = S_t_W(i,k)+t_A_W(j,k);
                min2 = k;
            end
        end
        W(i,j) = min1;
        t(i,j) = min2;
    end
end
