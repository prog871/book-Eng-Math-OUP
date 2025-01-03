% Calculation of S
clear all
clc

i=1:10; % generate a vector with natural numbers from 1 to 10

S=sum(i.^2); % calculate S as the sum of the vector values squared 

S=S-3^2 % update S subtracting the square of 3 and show on command window
