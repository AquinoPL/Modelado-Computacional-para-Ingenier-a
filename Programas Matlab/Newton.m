clc;
clear all;

fprintf('METODO DE NEWTON-SEANL\n\n');

% Definir la función y su derivada
f = @(x) [x(1) - 0.7*sin(x(1)) - 0.2*cos(x(2)); x(2) - 0.7*cos(x(1)) + 0.2*sin(x(2))];
J = @(x) [1-0.7*cos(x(1)), 0.2*sin(x(2)); 0.7*sin(x(1)), 1+0.2*cos(x(2))];

n = 2;
er = 0.001;

% Definir los valores iniciales
x = [0.5; 0.5];

h = 1;
k = 0;

while k == 0
  F = f(x);
  Jx = J(x);
   
  % Resolver el sistema de ecuaciones lineales Ja * D = -f
  D = mldivide(Jx, -F);

  % Actualizar las variables
  x = x + D;

  % Verificar convergencia
  if max(D) < er
    % Mostrar resultado y salir del bucle
    k = 1;
    fprintf('EL METODO CONVERGE EN:\n');
    for i = 1:n
      fprintf('x(%d) = %.4f\n', i, x(i));
    end
  else
    if h <= 100
      h = h + 1;
    else
      k = 1;
      fprintf('NO CONVERGE\n');
      for i = 1:n
        fprintf('x(%d) = %.4f\n', i, x(i));
      end
    end
  end
end