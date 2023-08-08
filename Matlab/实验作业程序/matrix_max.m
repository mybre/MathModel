function f=matrix_max(A)
max=A(1,1);
for i=1:4
    for j=1:5
        if max<A(i,j)
            max=A(i,j);
            row=i;column=j;
        end
    end
end
max
row
column
end