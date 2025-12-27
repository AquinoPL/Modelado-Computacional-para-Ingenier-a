clc
clear
a = str2double (inputdlg ('Ingrese un número: ', 'Titulo'));
b = str2double (inputdlg('Ingrese otro número: '));
c = a + b;
msgbox(sprintf('La suma de los dos números es %i\n',c))