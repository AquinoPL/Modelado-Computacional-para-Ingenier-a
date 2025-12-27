clc
clear all
fprintf('Metodo de biseccion \n\n');
a=input('Dame el primer numero: ');
b=input('Dame el segundo numero: ');

resultado=biseccion(@f,a,b);

disp(['La raíz aproximada es: ', num2str(resultado)]);
