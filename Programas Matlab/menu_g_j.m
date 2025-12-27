clc
fprintf('Metodo de Gaus Jordan\n\n');
n=input('Ingrese el numero de orden de la matriz\n');

%matriz a
for i=1:n
    for j=1:n
        a(i,j)=input(['a(',num2str(i), ',', num2str(j),'): ']);
    end
end
%matriz b
for i=1:n
    b(1,i)=input(['b(1',num2str(i), '):']);
end
%funcion que realiza el metodo de gaus jordan
d= gaus_jordan(a,b,n);

disp('El metodo de gaus jordan: ');
disp(d);