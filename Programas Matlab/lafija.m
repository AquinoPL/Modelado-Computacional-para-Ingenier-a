clear all; % Limpio variables
clc;       % Limpio pantalla

x = sym('x'); % Declaro variable simbólica

t = []; % Declaro variables a usar
y = [];
e = [];
z = [];
u = 0;
n = 2;
g = 0;
h = [];
o = [];
errora = 1; % Inicializo error
errorb = 1;
tool = 0; % Inicializo tolerancia
f = input('\nIngrese la funcion: ', 's'); % Pide ingresar la funcion

coeffs(f); % Calcula coeficientes polinomio
t = sym2poly(sym(f)); % Reorganiza polinomio
k = length(t); % Calcula grado del polinomio
u = length(t); % Variable por conveniencia, permite diferenciar si polinomio es mayor a grado 3 
p = length(t); % Variable por conveniencia, se usa como contador 
x = k; % Variable por conveniencia, permite imprimir cada caso

a = input('Ingrese punto a: '); % Pide ingresar puntos (r,s) y tolerancia
b = input('Ingrese punto b: ');
tool = input('\nIngrese la tolerancia: ');
y(1) = 1; % Asegura que el primer termino de cada division sea 1
z(1) = 1;

while t(1) ~= 1 % Este ciclo obliga a que el termino que acompaña la variable de mayor grado deba ser igual a 1
    fprintf('\n\nError: el primer termino debe ser de valor 1, vuelva a ingresar polinomio...\n')
    clear all; % Limpio variables
    x = sym('x'); % Declaro variable simbólica
    t = []; % Declaro variables a usar
    y = [];
    e = [];
    u = 0;
    n = 2;
    g = 0;
    h = [];
    o = [];
    errora = 1; % Inicializo error
    errorb = 1;
    tool = 0; % Inicializo tolerancia
    f = input('\nIngrese la funcion: ', 's'); % Pide ingresar la funcion
    coeffs(f); % Calcula coeficientes polinomio
    t = sym2poly(sym(f)); % Reorganiza polinomio
    k = length(t); % Calcula grado del polinomio
    u = length(t); % Variable por conveniencia, permite diferenciar si polinomio es mayor a grado 3 
    p = length(t); % Variable por conveniencia, se usa como contador 
    x = k; % Variable por conveniencia, permite imprimir cada caso
    a = input('Ingrese punto a: '); % Pide ingresar puntos y tolerancia
    b = input('Ingrese punto b: ');
    tool = input('\nIngrese la tolerancia: ');
    y(1) = 1;
    z(1) = 1;
end

if u == 2 % Si el polinomio a resolver es de grado 1, la raíz sale directamente
    r1 = -t(2);
    tool = 1;
end

if u == 3 % Si el polinomio es de grado 2 se realiza el siguiente ciclo
    r1 = (-t(2) + sqrt(t(2)^2 - 4 * t(3))) / 2; % Calcula raíces
    r2 = (-t(2) - sqrt(t(2)^2 - 4 * t(3))) / 2;
end

while u > 3 % Si el polinomio ingresado es de grado 3 o mayor se realiza el siguiente ciclo
    for i = 1:k - 1
        if i < 2
            y(i + 1) = a * t(i) + t(i + 1); % Permite calcular primera división sintética
        else
            y(i + 1) = a * y(i) + b * y(i - 1) + t(i + 1);
        end
    end

    for i = 1:k - 2 % Permite calcular segunda división sintética
        if i < 2
            z(i + 1) = a * y(i) + y(i + 1);
        else
            z(i + 1) = a * z(i) + b * z(i - 1) + y(i + 1);
        end
    end
    y = fliplr(y); % Reorganiza polinomios resultantes de las divisiones respectivas
    z = fliplr(z);

    da = (y(1) * z(3) - y(2) * z(2)) / ((z(2))^2 - z(1) * z(3)); % Cálculo pasos del método
    db = (y(2) * z(1) - y(1) * z(2)) / ((z(2))^2 - z(1) * z(3));

    y = fliplr(y); % Reorganiza polinomios resultantes de las divisiones respectivas
    z = fliplr(z);

    errora = da / a; % Recalcula errores
    errorb = db / b;

    a = a + da; % Calcula nuevos valores de a y b
    b = b + db;
    u = length(y); % Calcula el grado del polinomio obtenido como cociente

    if tool > abs(errora) || tool > abs(errorb) && u == 1 % Si polinomio del cociente es de grado 1
        r5 = -a / b;
    end

    if tool > abs(errora) || tool > abs(errorb) && u == 2 % Si polinomio del cociente es de grado 2
        r3 = (a + sqrt(a^2 + 4 * b)) / 2;
        r4 = (a - sqrt(a^2 + 4 * b)) / 2;
    end

    if tool > abs(errora) || tool > abs(errorb) && u >= 3 % Si polinomio del cociente es de grado 3 o mayor
        r1 = (a + sqrt(a^2 + 4 * b)) / 2;
        r2 = (a - sqrt(a^2 + 4 * b)) / 2;
        g = g + 1;
        o(g) = r1; % Guarda las raíces
        h(g) = r2; % Guarda las raíces
        for j = 1:p - n % Permite reducir orden del polinomio resultante
            e(j) = y(j);
        end
        y = e; % Se asignan nuevos valores a variables necesarias
        z = [];
        z(1) = 1;
        t = e;
        k = length(y);
        u = length(y);
        n = n + 2; % Asegura que el grado del polinomio se disminuya de 2 en 2
        errora = 1; % Reinicia errores
        errorb = 1;
        e = [];
    end
end

fprintf('Las raíces son: \n\n');

if x == 2
    r1
end

if x == 3
    r1
    r2
end

if x > 3 && u == 2
    o
    h
    r5
end

if x > 3 && u == 3
    o
    h
    r3
    r4
end

fprintf('\nLos valores de r y s son: %f', a);
fprintf('\n%f', b);

