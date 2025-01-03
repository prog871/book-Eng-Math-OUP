% find the roots of f(x)= sin(x) in the interval [-10,10]
clear all; clc; close all; 

% find the roots of f(x)= sin(x) in the interval [-5,5]
clear all; clc; close all; 

% find roots of nonlinear functions in intervals where the function sign
% changes.
x1=fzero(@sin,[-5,-2])
x2=fzero(@sin,[-2,2])
x3=fzero(@sin,[2,5])

