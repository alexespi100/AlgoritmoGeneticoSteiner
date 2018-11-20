function CostoT=CostoPoblacion(Z, Poblacion)
%Calcula el costo de los nodos de Steiner y lo devuelve como vector.
%a son los datos de X ordenados sin repetir
%d es la restricción que se está aplicando a los cromosomas
%e es un contador que define si se cumple o no con la restricción
%m es un contador para actualizar el valor de d
a=unique(Z(:,2));
b=unique(Z(:,1));
d=0;
CostoT=1:size(Poblacion(1,:));

B=NodosTotales(Z);

%Este For primero realiza una búsqueda de violación de la restricción y
%luego obtiene el costo del cromosoma evaluado dejando una penalización si
%se viola dicha restricción.

for i=1:length(Poblacion(1,:))
    for j=1:length(a)
        if sum(Poblacion(((j-1)*length(b)+1):((j-1)*length(b)+8),i))<3
            d=d+1;
        end
    end
    CostoT(i)=CostoCromosoma(B,Z,Poblacion(:,i));
    if d<3
        CostoT(i)=CostoT(i)*10;
    end
    d=0;
    
end