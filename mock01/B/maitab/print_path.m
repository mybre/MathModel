function print_path(path, dist, i,j)
if i==j
    disp(['从',num2str(i),'到',num2str(j),'的最短路径为']);
    disp([num2str(i),' ---> ',num2str(j)]);
    disp(['最短距离为',num2str(dist(i,j))]);
    return; 
end

if path(i,j) == j
    if dist(i,j) == inf
        disp(['从',num2str(i),'到',num2str(j),'没有路径可以到达'])
        
    else
        disp(['从',num2str(i),'到',num2str(j),'的最短路径为']);
        disp([num2str(i),' ---> ',num2str(j)]);
        disp(['最短距离为',num2str(dist(i,j))]);
    end
else
    k = path(i,j);
    result = [num2str(i),' ---> ']; 
    while k ~= j
        result = [result , num2str(k) , ' ---> ' ];
        k = path(k,j);
    end
     result = [result , num2str(k)];
    disp(['从',num2str(i),'到',num2str(j),'的最短路径为']);
    disp(result);
    disp(['最短距离为',num2str(dist(i,j))]);
end