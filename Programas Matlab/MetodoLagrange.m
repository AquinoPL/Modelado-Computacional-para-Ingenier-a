clc
clear all

fprintf('POLINOMIO DE LAGRANGE\n\n');
n = input('\nIngrese el grado del polinomio: ');
n = n + 1;

for i = 1:n
    x(i) = input(['x(', num2str(i), '): ']);
    y(i) = input(['y(', num2str(i), '): ']);
end

cen= 1;
while (cen==1)

    xr = input('\nAbsisa XR cuya imagen se quiere calcular: ');

    yr = 0;

    for i = 1:n

        nl = 1;
        dl = 1;
        j = 1;

        while j <= n
            if (i == n) && (i == j)
            else
                if (i == j)
                    j = j + 1;
                end

                nl = nl * (xr - x(j));
                dl = dl * (x(i) - x(j));
            end

            j = j + 1;
        end

        yr = yr + (nl / dl) * y(i);
    end

    fprintf('\n\nImagen YR: ');
    disp(yr); 
    
  
    op=input('Desea ingresar otro valor para XR? \n1)SI \n2)NO \nOpcion: ');
    
    
    if(op == 1)
    else
        fprintf('Cerrando programa.......\n');
        cen=cen+1;
    end
end