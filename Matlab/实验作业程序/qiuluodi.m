function f=qiuluodi(h,n)
gaodu=h;
h=h/2;
for i=1:n-1
    gaodu=gaodu+2*h;
    h=h/2;
end
gaodu
h
end