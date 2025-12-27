% Método de Triangulación de Gauss

% Ingreso del tamaño de la matriz
n = input('Ingrese el número de orden de la matriz: ');

% Validación de entrada
if n <= 0
    error('El tamaño de la matriz debe ser un número positivo.');
end

% Prealocación de matrices
a = zeros(n, n);
b = zeros(1, n);

% Ingreso de la matriz aumentada [A|B]
for i = 1:n
    for j = 1:n
        a(i, j) = input(['a(', num2str(i), ',', num2str(j), '): ']);
    end
end

% Ingreso de la columna b
for i = 1:n
    b(i) = input(['b(', num2str(i), '): ']);
end

% Eliminación hacia adelante
for i = 1:n
    for j = 1:n
        if i ~= j
            factor = a(j, i) / a(i, i);
            a(j, :) = a(j, :) - factor * a(i, :);
            b(j) = b(j) - factor * b(i);
        end
    end
end

% Sustitución hacia atrás
x(n) = b(n) / a(n, n);
for i = n-1:-1:1
    suma = a(i, i+1:end) * x(i+1:end)';
    x(i) = (b(i) - suma) / a(i, i);
end

% Resultados
fprintf('\nLas soluciones son:\n');
disp(x);
