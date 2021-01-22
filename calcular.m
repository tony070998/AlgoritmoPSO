function [C1,C2,W,K]=calcular(Wmin,Wmax,Cmin,Cmax,MaxIter,alpha,iter) 

W=[((Wmin-Wmax)/(MaxIter-1))*(iter-1)]+Wmax;      % cálculo de la velocidad inercial

C1=[((Cmin(1,1)-Cmax(1,1))/MaxIter)*iter]+Cmax(1,1);   % cálculo de la primera constante de acelaración

C2=[((Cmax(1,2)-Cmin(1,2))/MaxIter)*iter]+Cmin(1,2);   % cálculo de la segunda constante de aceleracion 

phi=C1+C2;

K= (2*alpha)/abs(2-phi-sqrt(((phi^2)-4*phi)));   % factor de estrechamiento 


