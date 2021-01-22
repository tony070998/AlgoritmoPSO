function [FO]=funcionAdaptacion(f,X,Np)

for i=1:1:Np
    %introducir la posición en X y la posición en Y
   FO(i,1)=f(X(i,1),X(i,2));   %calculo de funcion objetivo   
end