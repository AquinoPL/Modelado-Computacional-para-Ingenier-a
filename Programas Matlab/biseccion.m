function s = biseccion(f, a, b)
    cen = 0;
    e = input('Dame el error permisible: ');

    while cen == 0
        c = (a + b) / 2;

        if f(a) * f(c) <= 0
            if f(a) * f(c) == 0
                if f(a) == 0
                    s = a;
                else
                    s = c;
                end
                cen = 1;
            else
                b = c;
                if abs(a - b) < e
                    if abs(f(a) - f(b)) > 1
                        fprintf('Se encontro un punto singular\n');
                        cen = 1;
                    else 
                        s = (a + b) / 2;
                        cen = 1;
                    end
                end
            end
        else
            a = c;
        end
    end
end