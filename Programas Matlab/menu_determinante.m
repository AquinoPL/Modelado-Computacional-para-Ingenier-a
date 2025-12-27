clc
clear all
fprintf('Determinante de una matriz \n\n');
n = input('Ingrese el grado de la matriz: ');
a = zeros(n, n);

for i = 1:n
    for j = 1:n
        a(i, j) = input(['a(', num2str(i), ',', num2str(j), '): ']);
    end
end

d=determinante(a,n);
% Mostrar el resultado
disp(['La matriz ingresada es:']);
disp(a);

d = d * a(n, n);
disp(['El determinante es: ', num2str(d)]);
