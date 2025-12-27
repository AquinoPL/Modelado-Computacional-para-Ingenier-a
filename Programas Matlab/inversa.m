function inv_matriz = inversa(a, n)
    d = determinante(a, n);
    
    if d == 0
        error('La matriz no tiene inversa (determinante igual a 0).');
    end
    
    m = eye(n); % Inicializar matriz identidad

    for i = 1:n
        p = a(i, i);
        
        for j = i:n
            a(i, j) = a(i, j) / p;
        end
        
        for j = 1:n
            m(i, j) = m(i, j) / p;
        end
        
        for k = 1:n
            if k ~= i
                f = -a(k, i);
                
                for j = 1:n
                    a(k, j) = a(k, j) + f * a(i, j);
                    m(k, j) = m(k, j) + f * m(i, j);
                end
            end
        end
    end
    
    inv_matriz = m;
end
