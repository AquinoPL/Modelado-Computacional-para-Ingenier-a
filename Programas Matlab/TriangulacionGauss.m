clc
clear all
fprintf('TRIANGULACION GAUSS DE UNA MATRIZ \n\n')
n=input('Ingresar el numero de orden de la matriz: \n');
for i=1:n
     for j=1:n
         a(i,j)=input(['a(',num2str(i),',',num2str(j),'): ']);
     end
end

for i=1:n
    b(i)=input(['b(',num2str(i),'):']);
end

for i=n:2
    for j=i-1:1
        h=-a(i,i);
        f=a(j,i)/h;
        for k=1:i
            a(j,k)=a(j,k)+a(i,k)*f;
        end
        b(j)=b(j)+b(i)*f;
    end
end
x(i)=b(i)/a(i,i);
for i=2:n
    s=0;
    for j=1:i-1
        s=s+(a(i,j)*x(j));
    end
end
x(i)=(b(i)-s)/a(i,i);


disp('LA RESPUESTA ES: ');
disp(x);