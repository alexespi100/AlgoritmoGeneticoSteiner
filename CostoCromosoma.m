function Costo=CostoCromosoma(B,Z,Cromosoma)
%Calcula el costo de un cromosoma.
%NS son los nodos de Steiner.
%A es el vector con los índices de los nodos de Steiner más cercanos a los
%nodos objetivo.

NS=[];
A=[];
Costo=0;

%Este For define al vector NS.
for i=1:length(Cromosoma)
    if Cromosoma(i)==1
        NS=[NS; B(i,:)];
    end
end

%Este For anidado devuelve el costo del cromosoma individual.
for i=1:size(Z,1)
    for j=1:size(NS,1)
        a=Z(i,1)-NS(j,1);
        b=Z(i,2)-NS(j,2);
        if a==0 || b==0
            A=[A j];
        end
    end
    Costo=Costo+(Z(i,1)-NS(min(A),1))+(Z(i,2)-NS(min(A),2));
end