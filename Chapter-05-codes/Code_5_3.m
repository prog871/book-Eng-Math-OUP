
%%----------------------------------NSE----------------------------
function [E ] = NSE(Qobs,Qpre )
%Nash-Sutcliffe efficiency coefficient (NSE) 
n = length(Qobs);
Qmean = mean(Qobs);
E1 = 0;
E2 = 0;
for i = 1:n
    E1 = E1+(Qobs(i)-Qpre(i))^2;
    E2 = E2+(Qobs(i)-Qmean)^2;
end
E = 1-E1/E2;
end
