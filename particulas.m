function [X]=particulas(Np,Min,Max)

% Creación aleatoria
for i=1:1:Np                       
    for j=1:1:size(Min,2) 
    % coordenadas alaetorias de (X,Y)
    X(i,j)=((Max(1,j)-Min(1,j))*rand)+Min(1,j)
    end   
end


