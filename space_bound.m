
%This function checks the search space boundaries for agents.
% Tp=X(i,:)>up;Tm=X(i,:)<low;X(i,:)=(X(i,:).*(~(Tp+Tm)))+((rand(1,dim).*(up-low)+low).*(Tp+Tm));
function  CurrentPosition=space_bound(CurrentPosition,a_hi, a_lo, b_hi, b_lo, c_hi, c_lo, k_hi, k_lo);
X=CurrentPosition;
[N,dim]=size(X);
for i=1:N 

    Tp1=X(i,1)>a_hi;Tm1=X(i,1)<a_lo;X(i,1)=(X(i,1).*(~(Tp1+Tm1)))+((rand(1,1).*(a_hi-a_lo)+a_lo).*(Tp1+Tm1));
    Tp2=X(i,2)>b_hi;Tm2=X(i,2)<b_lo;X(i,2)=(X(i,2).*(~(Tp2+Tm2)))+((rand(1,1).*(b_hi-b_lo)+b_lo).*(Tp2+Tm2));
    Tp3=X(i,3)>c_hi;Tm3=X(i,3)<c_lo;X(i,3)=(X(i,3).*(~(Tp3+Tm3)))+((rand(1,1).*(c_hi-c_lo)+c_lo).*(Tp3+Tm3));
    Tp4=X(i,4)>k_hi;Tm4=X(i,4)<k_lo;X(i,4)=(X(i,4).*(~(Tp4+Tm4)))+((rand(1,1).*(k_hi-k_lo)+k_lo).*(Tp4+Tm4));

end
CurrentPosition=X;