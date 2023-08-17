function S_t_W = calc_wight(S_t)

W = xlsread('data.xlsx',2,'A1:C53');
S_t_W = zeros(size(S_t));

for i = 1:size(S_t,1)
   for j = 1:size(S_t,2)
      k = 1;
      while ~(S_t(i,j)>=W(k,1) & S_t(i,j)<=W(k,2))
          k = k+1;
      end
      S_t_W(i,j) = W(k,3);
   end
end