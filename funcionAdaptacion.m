function [FO]=funcionAdaptacion(f,X,Np)

for i=1:1:Np
    %introducir la posici�n en X y la posici�n en Y
   FO(i,1)=f(X(i,1),X(i,2));   %calculo de funcion objetivo   
end