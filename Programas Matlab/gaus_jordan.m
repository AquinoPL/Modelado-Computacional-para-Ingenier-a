function x=gaus_jordan(a,b,n)
% n=length(b) --- 
%algoritmo
for i=1:n
    p=a(i,i);
    for j=1:n
        a(i,j)=a(i,j)/p;
    end
    b(i)=b(i)/p;
    for h=1:n
        if h~=i
            f=a(h,i);
            for j=i:n
                a(h,i)=a(h,i)+f*a(i,j);
            end
            b(h)=b(h)+f*b(i);
        end
    end
end
x=b;
end