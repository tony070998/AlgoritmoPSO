function [Gbest]=Gmejor(Gbest,Pbest,FObest); %FObest solo es un registro de la F.O
 
    %v = valor 
[v,p]=min(FObest)
    
Gbest=Pbest(p,:)
