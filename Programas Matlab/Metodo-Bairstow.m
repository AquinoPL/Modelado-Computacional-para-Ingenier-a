clc
clear all

fprintf('BAIRSTOW\n\n')
n = input('Grado del polinomio: ');
num = 100;
er = 0.001;
u = input('Disparo de u inicial: ');
v = input('Disparo de v inicial: ');
n = n + 4;
fprintf('Coeficientes del polinomio: \n')
for i = 4:n
    a(i) = input(['a(',num2str(i) - 4,') : ']);
end

j = 1;
k = 1;
m = n;
%b(4) = a(4);
%b(5) = a(5);
%b(6) = a(6);

while (n > 6)
    if (k > num)
        u = input('Valor de u para el siguiente disparo: \n');
        v = input('Valor de v para el siguiente disparo: \n');
        k = 1;
    end
    b(3) = 0;
    b(2) = 0;
    b(1) = 0;
    for i = 4:n
        b(i) = a(i) + (u * b(i-1)) + (v * b(i-2));
    end
    s(3) = 0;
    s(2) = 0;
    s(1) = 0;
    for i = 4: (n-1)
        s(i) = b(i) + (u * s(i-1)) + (v * s(i-2));
    end   
    D = ((b(n) * s(n-3)) - (b(n-1) * s(n-2))) / ((s(n-2) * s(n-2)) - (s(n-1) * s(n-3)));
    E = ((b(n-1) * s(n-1)) - (b(n) * s(n-2))) / ((s(n-2) * s(n-2)) - (s(n-1) * s(n-3)));
    u = u + D;
    v = v + E;
    
    if(max(D,E)<er)
        x(j) = formula1(v, u, 1);
        x(j+1) = formula2(v, u, 1);
        j = j + 2;
        n = n - 2;
        for i = 4: n
            a(i) = b(i);
        end
        k = 1;
        u = input('Nuevo valor de u: \n');
        v = input('Nuevo valor de v: \n');
    else
        k = k + 1;
    end  
end
if(n == 5)
        x(j) = (-b(5) / b(4));
else
        x(j) = formula2(b(4), b(5), b(6));
        x(j+1) = formula1(b(4), b(5), b(6));
end
disp('Las soluciones son: ');
disp(x);