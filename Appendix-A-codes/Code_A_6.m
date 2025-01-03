% find the roots of the qubic polynomial p(x)=x^3-1

clear all
clc

% define polynomial
p=[1 0 0 -1];
% find the roots
r=roots(p);
% display the roots in command window
disp('the roots are')
r
