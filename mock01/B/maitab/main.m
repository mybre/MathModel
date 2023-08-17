%main函数
clear;clc;
% 铁路-中转初始邻接矩阵
D1 = xlsread('data.xlsx',1,'B2:Y25');

for i=1:size(D1,1)
   D1(i,i) = 0; 
end

line = isnan(D1);
[row, col] = find(line==1);

for i=1:length(row)
   D1(row(i),col(i)) = inf; 
end

[dist1,path1] = Floyd_algorithm(D1); %dist1返回最短路径长度，path1返回路径信息

print_path(path1,dist1,19,1);

S = [7, 18, 19, 20, 22, 14, 17]; % 第i个钢厂的编号

S_t = zeros(7, 17); %钢厂-中转最短路径

for i = 1: size(S_t,1)
   for j =1:size(S_t,2)
      S_t(i,j) = dist1(S(i),j); 
   end
end

S_t_W = calc_wight(S_t);%钢厂-中转最少费用

% 中转-A初始邻接矩阵
D2 = xlsread('data.xlsx',4,'B2:AG33');

[row, col] = find(D2==0);

for i=1:length(row)
   D2(row(i),col(i)) = inf; 
end

for i=1:size(D2,1)
   D2(i,i) = 0; 
end


[dist2, path2] = Floyd_algorithm(D2); %dist2返回最短路径长度，path2返回路径信息

A = 18:32; % A地址编号

t_A = zeros(15,17); %中转-A最短路径

for i = 1: size(t_A,1)
   for j =1:size(t_A,2)
      t_A(i,j) = dist2(A(i),j); 
   end
end

t_A_W = t_A.*0.1;

[W,t] = calc_W(S_t_W,t_A_W); % W表示运费表，t表示中转点表