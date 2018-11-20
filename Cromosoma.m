function A = Cromosoma(Z)
%Se realiza un cromosoma aleatorio con la matriz de input de datos.
%a son los datos de X ordenados sin repetir
%b son los datos de Y ordenados sin repetir
%c es la longitud del cromosoma
%A es el cromosoma
a=unique(Z(:,1));
b=unique(Z(:,2));
c=length(a)*length(b);
A=zeros(c,1);
for i=1:c
    A(i)=randi([0 1],1,1);
end
