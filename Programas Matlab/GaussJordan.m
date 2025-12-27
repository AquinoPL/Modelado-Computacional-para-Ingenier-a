clc
clear all
fprintf('GAUSS-JORDAN DE UNA MATRIZ \n\n')
n=input('Ingresar el numero de orden de la matriz: \n');
for i=1:n
     for j=1:n
         a(i,j)=input(['a(',num2str(i),',',num2str(j),'): ']);
     end
end

for i=1:n
    b(i)=input(['b(',num2str(i),'):']);
end
    
for i=1:n
    p=a(i,i);
    for j=i:n
        a(i,j)=a(i,j)/p;
    end
    b(i)=b(i)/p;
    for h=1:n
        if h==i
        else
            if h~=i
                f=-a(h,i);
                for j=i:n
                    a(h,j)=a(h,j)+f*a(i,j);
                end
                b(h)=b(h)*f*b(i);
            end
        end
    end
end
disp('LA RESPUESTA ES: ');
disp(b);