function [V]=CalVelocidades(V,C1,C2,W,K,Gbest,Np,X,iter,Pbest)

  for i=1:1:Np          % se cálcula las nuevas velocidades basado en la experiencia personal y la grupal
    V(i,:)=(W*V(i,:)'+C1*rand*(Pbest(i,:)'-X(i,:)')+C2*rand*(Gbest'-X(i,:)'))'
  end

