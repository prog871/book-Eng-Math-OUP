% This code solve seepage through the
% foundation of an earth dam 
clear; close all;clc;
set(0,'DefaultAxesFontsize',17);
%
a=135; % length of foundation
b=50; % height of foundation
N=100; % number of terms in Fourier Series
dx=1; % in meter; space increment in X-direction
dy=1; % in meter; space increment in Y-direction
k=1; m=1; % counters
%
    for x=0:dx:a 
    for y=0:dy:b
        %
        s=0.0;
        for n=1:N
        temp=144.*(cos(4.*n.*pi./9)-cos(5.*n.*pi./9))./...
            (cosh(50.*n.*pi./135).*(n.*pi).^2);
        s=s+temp.*cos(n.*pi.*x./135).*cosh(n.*pi.*y./135);  
        end
        %
        h(k,m)=6+s;
        k=k+1;
    end
    k=1;  m=m+1;
    end
    %
figure(1)
subplot('position',[0.1 0.1 0.7 0.45]);
[c,g]=contour(h,60);
colorbar; clabel(c,g);    
%
set(gca,'XTick',[1:10:136]); set(gca,'YTick',[1:10:51]);
set(gca,'Xticklabel',[0:10:130]);
set(gca,'Yticklabel',[0:10:50]);
set(gca,'linewidth',2.5);
% End of the code %

