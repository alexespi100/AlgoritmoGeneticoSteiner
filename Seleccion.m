function B = Seleccion(Z,Poblacion)
a=length(Poblacion(1,:));
%%Costo de la población
B=CostoPoblacion(Z,Poblacion);
A=max(B);

%%Promedio del costo de la población y normalización
m=mean(B);
C=m./B;

%%Ruleta de selección
for i=1:a
    for j=1:i
        B(i)=B(i)+C(j);
    end
end

for i=1:a
    [~, C(i)]=min(abs(B-(min(B) + (max(B)-min(B)).*rand(1,1))));
end

B=Poblacion(:,C);
