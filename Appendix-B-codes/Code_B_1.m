% Calculation of S
clear all
clc

S=0; % initial value for S

for i=1:10 % perform a loop over the natural numbers from 1 to 10

    if i~=3 % exclude 3 but not calculating when i is not equal to 3

        S=S+i^2; % update sum S by adding in each loop the next square

    end % close the if statement 

end % close the for loop over i

S % show on command window the value of S
