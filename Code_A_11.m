% this Matlab code calculates the eigenvectors and 
% eigenvalues of a 2×2 matrix.
clear all; clc; close all;
% define matrix
A=[2 1;1 2];
% find eigenvalues and eigenvectors
[V,D]=eig(A)

