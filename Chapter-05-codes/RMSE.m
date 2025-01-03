%%----------------------RMSE ----------------------------
function [rmse] = RMSE( Qobs,Qpre)
%root mean square error
% Qobs: the real observations
% Qpre: the model predictions
n = length(Qobs);
Qmean = mean(Qobs);
E1 = 0;
for i = 1:n
    E1 = E1+(Qobs(i)-Qpre(i))^2;
end
rmse = sqrt((1/n)*E1);
end
