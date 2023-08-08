function f=qipao(a)
n=length(a);
for i=1:n-1
    for j=1:n-i
        if a(j)>a(j+1)
            b=a(j);
            a(j)=a(j+1);
            a(j+1)=b;
        end
    end
end
a
end