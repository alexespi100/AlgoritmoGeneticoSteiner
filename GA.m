function [Costo, Cromi, Nodos] = GA(Z)

%%Nuestro GA
%%Problema

%%Generaciones
G=15;

%%Pruebas
Nodos=[];
NS=[];
K=[];
B=NodosTotales(Z);

%%Método de selección: Ruleta
a=300;
A=[];
b=0;
D=[];

%%Población inicial
for i=1:a
    A=[A Cromosoma(Z)];
end

%%Iteraciones
for i=1:G
    C=Seleccion(Z,A);
    C=Cruce(C);
end

%%Población final y su costo
y=CostoPoblacion(Z,C);

BX=unique(Z(:,1));
BY=unique(Z(:,2));
p=find(y==min(y(:)));
if length(p)>1
    p=p(randperm(numel(p),1));
end

%%Gráfica mejor resultado
Cromi=C(:,p);
Costo=min(y);


%Este For define al vector NS.
for i=1:length(C(:,1))
    if C(i,p)==1
        NS=[NS; B(i,:)];
    end
end

%Este For anidado devuelve los nodos que son graficados
for i=1:size(Z,1)
    for j=1:size(NS,1)
        n=Z(i,1)-NS(j,1);
        m=Z(i,2)-NS(j,2);
        if n==0 || m==0
            K=[K j];
        end
    end
    Nodos=[Nodos; [NS(min(K),1) NS(min(K),2) i]];
    K=[];
end


scatter(Z(:,1),Z(:,2),'green','d')
hold on
scatter(Nodos(:,1),Nodos(:,2),'blue','*')

