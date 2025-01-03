% this Matlab code plots the results of Laplace’s 
% equation solution in domain [0,1]×[0,1] for Figure A.25 
clear all; clc; close all;

set(0,'defaultaxesfontsize',16);

U=5;
a=1;
b=1;
N=200; % Number of terms in Fourier series


[X,Y]=meshgrid(0:a/100:a,0:b/100:b);

u=4*U/(pi*sinh(pi*a/(2*b)))*sinh(pi/(2*b)*X).*sin(pi/(2*b)*Y);

for n=1:N

    r=(2*n+1)*pi/(2*b);

    u=u+4*U/((2*n+1)*pi*sinh(r*a))*sinh(r*X).*sin(r*Y);

end

figure(1)
surf(X,Y,u)
colorbar
shading interp
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
zlabel('u(x,y)','FontSize',18,'FontWeight','bold')

