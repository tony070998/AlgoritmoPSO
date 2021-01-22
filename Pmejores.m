function [Pbest,FObest]=Pmejores(f,Pbest,X,FO,Np)

for i=1:1:Np
    %vector
    c=f(Pbest(i,1),Pbest(i,2))             % funcion objetivo de las mejores posiciones de las particulas
    %si el historial de la particula es mejor que el global cambia
    % PARA EL CASO DE MINIMIZACIÓN
    if FO(i,1) < c                          
        Pbest(i,:)=X(i,:);
    end
    FObest(i,1)=c; %registro
    
end

