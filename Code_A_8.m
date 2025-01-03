% find the derivative of function f(x)= -5 x^3+2 x^2+12 x-sin (x). 
clear all; clc; close all;
% define symbolic x
syms x
% define function
f=-5*x^3+2*x^2+12*x-sin(x);
% calculate first derivative
diff(f,x)

