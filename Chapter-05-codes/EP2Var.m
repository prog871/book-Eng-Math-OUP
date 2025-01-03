function [ Pjoint ] = EP2Var(Peak, Vol)
%Empirical probability for bivariate cases
% Inputs, Flood Peak and Flood Volume
N = length(Vol);
 
for i = 1:N
    si = 0;
    for j = 1:N
        if((Peak(j)<=Peak(i))&&(Vol(j)<=Vol(i)))
            si = si + 1;
        else
            si = si +0;
        end
    end
    Pjoint(i) = (si - 0.44)/(N + 0.12);
end
end
