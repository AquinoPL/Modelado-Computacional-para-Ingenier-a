function d=determinante(a,n)
d = 1;

for i = 1:(n-1)
    d = d * a(i, i);
    h = a(i, i);

    for j = i:n
        a(i, j) = a(i, j) / h;
    end

    k = i + 1;

    while k <= n
        f = -a(k, i);

        for j = i:n
            a(k, j) = a(k, j) + f * a(i, j);
        end

        k = k + 1; 
    end
end
end