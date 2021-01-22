%   Algoritmo de PSO
clear all
clc

f=@(x1,x2) (x1)^2+(x2)^2;              % función objetivo 

%limite de coordenadas
Min= [-1.5 -1.5];                        
Max= [ -2  -2];                          

n=size(Max,2);                         % número de coordenadas (X1, X2)
Np=20;                                 % número de partículas 
MaxIter=30;                            % número de iteraciones máximas
Cmin=[0.5 0.5];                        % constante de aceleración Mínima
Cmax=[2.5 2.5];                        % constante de aceleración Máxima
Wmin=0.4;                              % factor de inercia mínimo
Wmax=0.9;                              % factor de inercia máximo 
alpha=1;                               % factor para cálculo de estrechamiento

[X]=particulas(Np,Min,Max);       % se crean las partículas aleatoriamente por el espacio de solución 

[FO]=funcionAdaptacion(f,X,Np);    % se calcula la función para cada individuo ¿Cuál de estos se acerca mas al minimo?
% si d=1 entonces se define velocidad inicial aleatoria, si d=0 entonces la velocidad inicial se define en cero
d=0;    
V=velocidad(Np,n,d);                   % cálculo de las velocidades iniciales


iter=1;
Pbest=X;          % mejor punto por donde se ha pasado / matriz de todas las posiciones de las particulas mejor personal
[v,p]=min(FO);    % mínimo valor de la función objetivo v=valor p=particula mejor ubicada
Gbest=X(p,:);     % Coordenadas del lider del cúmulo de particulas / mejor global / programado mejor posicion no lider

% graficar las partículas
figure(iter)
% graficar los valores de X = (X, Y)
 plot(X(:,1),X(:,2),'*r')
 %esto se puede ampliar pero no es necesario debido a nuestra F.O
 xlim([-2 2])     
 ylim([-2 2]) 

while iter<=MaxIter
    
  [C1,C2,W,K]=calcular(Wmin,Wmax,Cmin,Cmax,MaxIter,alpha,iter);  %formulas
  [V]=CalVelocidades(V,C1,C2,W,K,Gbest,Np,X,iter,Pbest); %función de velocidad
  [X]=posiciones(V,X,Np) ; %nuevas posiciones con la nueva velocidad
  [FO]=funcionAdaptacion(f,X,Np);        % se calcula la función para cada individuo 
  [Pbest,FObest]=Pmejores(f,Pbest,X,FO,Np);      % se debe guardar la memoria de los mejores posiciones visitadas por las particulas
  [Gbest]=Gmejor(Gbest,Pbest,FObest);  
  pause(0.1) 
  iter=iter+1;   
  %figure(iter)
  plot(X(:,1),X(:,2),'*r')  % graficar las partículas
  xlim([-2 2])     
  ylim([-2 2])    
 
end
