% find the integral of function f(x) = 3x^4+5x^2-3
clear all; clc; close all;
% define symbolic x
syms x
% define function
f=3*x^4+5*x^2-3;
% calculate the integral
int(f,x,-2,8)

