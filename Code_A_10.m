% this Matlab code solve a system of three simultaneous equations 
% involving 2x+5y-z=0, 2x+y+3z=1, 
% and -x+z=-2. 
clear all; clc; close all;
% define system coefficient matrix
A=[2 5 -1;2 1 3;-1 0 1];
% define right-hand-side vector
b=[0;1;-2];
% solve system
A\b

