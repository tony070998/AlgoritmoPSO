%   Algoritmo de PSO
clear all
clc

f=@(x1,x2) (x1)^2+(x2)^2;              % funci�n objetivo 

%limite de coordenadas
Min= [-1.5 -1.5];                        
Max= [ -2  -2];                          

n=size(Max,2);                         % n�mero de coordenadas (X1, X2)
Np=20;                                 % n�mero de part�culas 
MaxIter=30;                            % n�mero de iteraciones m�ximas
Cmin=[0.5 0.5];                        % constante de aceleraci�n M�nima
Cmax=[2.5 2.5];                        % constante de aceleraci�n M�xima
Wmin=0.4;                              % factor de inercia m�nimo
Wmax=0.9;                              % factor de inercia m�ximo 
alpha=1;                               % factor para c�lculo de estrechamiento

[X]=particulas(Np,Min,Max);       % se crean las part�culas aleatoriamente por el espacio de soluci�n 

[FO]=funcionAdaptacion(f,X,Np);    % se calcula la funci�n para cada individuo �Cu�l de estos se acerca mas al minimo?
% si d=1 entonces se define velocidad inicial aleatoria, si d=0 entonces la velocidad inicial se define en cero
d=0;    
V=velocidad(Np,n,d);                   % c�lculo de las velocidades iniciales


iter=1;
Pbest=X;          % mejor punto por donde se ha pasado / matriz de todas las posiciones de las particulas mejor personal
[v,p]=min(FO);    % m�nimo valor de la funci�n objetivo v=valor p=particula mejor ubicada
Gbest=X(p,:);     % Coordenadas del lider del c�mulo de particulas / mejor global / programado mejor posicion no lider

% graficar las part�culas
figure(iter)
% graficar los valores de X = (X, Y)
 plot(X(:,1),X(:,2),'*r')
 %esto se puede ampliar pero no es necesario debido a nuestra F.O
 xlim([-2 2])     
 ylim([-2 2]) 

while iter<=MaxIter
    
  [C1,C2,W,K]=calcular(Wmin,Wmax,Cmin,Cmax,MaxIter,alpha,iter);  %formulas
  [V]=CalVelocidades(V,C1,C2,W,K,Gbest,Np,X,iter,Pbest); %funci�n de velocidad
  [X]=posiciones(V,X,Np) ; %nuevas posiciones con la nueva velocidad
  [FO]=funcionAdaptacion(f,X,Np);        % se calcula la funci�n para cada individuo 
  [Pbest,FObest]=Pmejores(f,Pbest,X,FO,Np);      % se debe guardar la memoria de los mejores posiciones visitadas por las particulas
  [Gbest]=Gmejor(Gbest,Pbest,FObest);  
  pause(0.1) 
  iter=iter+1;   
  %figure(iter)
  plot(X(:,1),X(:,2),'*r')  % graficar las part�culas
  xlim([-2 2])     
  ylim([-2 2])    
 
end
