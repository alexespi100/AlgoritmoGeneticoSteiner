function D = Cruce(C)

a=length(C(1,:))/2;
b=length(C(:,1));
A=zeros(b,a);
B=zeros(b,a);

for i=1:a
    A(:,i)=C(:,i);
    B(:,i)=C(:,i+a);
end

for i=1:a
    c=randi([1 b],1,1);
    A(:,i)=[B(1:c,i)',A(c+1:b,i)']';
    B(:,i)=[A(1:c,i)',B(c+1:b,i)']';
end

D=[A';B']';