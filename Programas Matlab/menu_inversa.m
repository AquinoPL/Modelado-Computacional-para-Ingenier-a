clc
clear all 
fprintf('Inversa de una Matriz \n\n');
n = input('Ingrese el grado de la matriz: ');

% Ingresando matriz
a = zeros(n, n); % Inicializar la matriz
for i = 1:n
    for j = 1:n
        a(i, j) = input(['a(', num2str(i), ',', num2str(j), '): ']);
    end
end

inv_matriz = inversa(a, n);

% Mostrar el resultado
disp(['La matriz ingresada es:']);
disp(a); 
disp(['La inversa de la matriz es:']);
disp(inv_matriz);
