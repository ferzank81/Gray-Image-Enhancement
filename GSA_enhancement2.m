function  [PARAM Fbest BestChart MeanChart] = GSA_enhancement(image,global_mean,B,C,im_size, N, MaxIter)
%% ----------------------------------------------------------------------------

nd = 4; %dimension of agents
a_hi = 3; %boundary values of variables (agent)
a_lo = 0;
b_hi =0.3;
b_lo =0.0;
c_hi = 1;
c_lo =0;
k_hi = 1;
k_lo = 0;

% PARAMETERS for  GSA-----------------------------------
%Configurations and initializations
noP =N;             %Number of agents
Max_iteration  = MaxIter; %Maximum number of iteration
Dim=nd;     %GSA'nýn boyutu ile amaç fonksiyonunu boyutu eþleþtirme;
CurrentFitness =zeros(noP,1);

G0=100; %Gravitational constant
CurrentPosition = zeros(noP,Dim); %Postition vector
velocity = .3*randn(noP,Dim) ; %Velocity vector
acceleration=zeros(noP,Dim); %Acceleration vector
mass(noP)=0; %Mass vector
force=zeros(noP,Dim);%Force vector
% ---------------------------------------------------------------------------------------------------------------------------------------------------------------------
%GENERATE INITIAL POPULATION
a = (a_hi-a_lo).*rand(noP,1)+a_lo; 
b = (b_hi-b_lo).*rand(noP,1)+b_lo;
c = (c_hi-c_lo).*rand(noP,1)+c_lo;
k = (k_hi-k_lo).*rand(noP,1)+k_lo;
par = [a,b,c,k];

%FIND INITIAL FITNESS VALUES FOR ENTIRE POPULATION
for i= 1:noP
    CurrentPosition(i,1)=a(i);
    CurrentPosition(i,2)=b(i);
    CurrentPosition(i,3)=c(i);
    CurrentPosition(i,4)=k(i);
fitness(i) = tr_op(global_mean,B,C,im_size,image,a(i),b(i),c(i),k(i));
end;
Fbest=max(fitness);
BestChart=[];MeanChart=[];
for iteration=1: Max_iteration 
%     iteration = iteration + 1;
    G=G0*exp(-20*iteration/Max_iteration);
    force=zeros(noP,Dim);
    mass(noP)=0;
    acceleration=zeros(noP,Dim);
    
%Calculate ----------------------------------------------------------------
  
    for i = 1:noP
               
   CurrentFitness(i) = tr_op(global_mean,B,C,im_size,image,CurrentPosition(i,1),CurrentPosition(i,2),CurrentPosition(i,3),CurrentPosition(i,4));

    end
    
    [best best_pos]=max(CurrentFitness);
    worst=min(CurrentFitness);
    if best>Fbest  %maximization
            Fbest=best;
            par=CurrentPosition(best_pos,:);
        end
    
    
    BestChart=[BestChart Fbest];
    MeanChart=[MeanChart mean(CurrentFitness)];
    
    for i=1:noP
        mass(i)=(CurrentFitness(i)-0.99*worst)/(best-worst);    
    end
    
    for i=1:noP
        mass(i)=mass(i)*5/sum(mass);    
    end

%Calculate froces

for i=1:noP
    for j=1:Dim
        for k=1:noP
            if(CurrentPosition(k,j)~=CurrentPosition(i,j))
                force(i,j)=force(i,j)+ rand()*G*mass(k)*mass(i)*(CurrentPosition(k,j)-CurrentPosition(i,j))/abs(CurrentPosition(k,j)-CurrentPosition(i,j));
                
            end
        end
    end
end

%Calculate a

for i=1:noP
       for j=1:Dim
            if(mass(i)~=0)
                acceleration(i,j)=force(i,j)/mass(i);
            end
       end
end   

%Calculate V

for i=1:noP
        for j=1:Dim
            velocity(i,j)=rand()*velocity(i,j)+acceleration(i,j);
        end
end

%Calculate X                                             
            
 CurrentPosition = CurrentPosition + velocity ;
 
 CurrentPosition=space_bound(CurrentPosition,a_hi, a_lo, b_hi, b_lo, c_hi, c_lo, k_hi, k_lo);
end
PARAM=[par(1,1),par(1,2),par(1,3),par(1,4)];
Fbest;


end

