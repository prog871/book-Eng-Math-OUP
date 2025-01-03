clear; clc;
close all;
%
syms z
P= int(1/sqrt(2*pi)*exp(-z^2/2),z,2,3);
%
% Convert fraction to decimal
decimal_approximation = double(P);
disp(decimal_approximation);
