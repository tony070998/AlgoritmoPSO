function [V]=velocidad(Np,n,d) %n = Num Coordenadas

% velocidades aleatorias
if d==1
  for i=1:1:Np                       
    for j=1:1:n
     V(i,j)=1*rand-1;
    end  
  end
else
    V=zeros(Np,n);
end