function [X]=posiciones(V,X,Np)

for i=1:1:Np                    % actualización de las posiciones 
    X(i,:)=X(i,:)+V(i,:);
end

