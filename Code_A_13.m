% this Matlab code solves a non-homogeneous, linear 
% second order ordinary differential equation.
clear all; clc; close all;
% define symbolic x and f(x)
syms x f(x)
% solve the ordinary differential equation
dsolve(diff(f,x,2)-4*f==7*x)

