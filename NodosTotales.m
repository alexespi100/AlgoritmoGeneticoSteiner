function B=NodosTotales(Z)
%Se crea un vector con los nodos del problema tomando como input la matriz de datos.
%B son los nodos totales en el espacio del problema.

a=unique(Z(:,1));
b=unique(Z(:,2));

B=[];
for i=1:length(a)
    for j=1:length(b)
        B=[B; [a(i) b(j)]];
    end
end