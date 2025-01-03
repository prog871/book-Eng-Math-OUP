% This code solves seepage in dam foundation
clc; clear; close all;
set(0,'DefaultAxesFontsize',17);
%
a=1000.0; b=1500.0; % Dimensions of the clay layer
h0=150.0; % Hydrostatic water head in the reservoir
dx=10; dy=10; % Spatial increment
N=100; % number of terms in Fourier series expansion
%
k=1; m=1; % Counters 
%
for x=0:dx:a
    for y=0:dy:b
        s=0.0;
        for n=1:N
            temp=2.*h0.*(1-(-1).^n)./(pi.*n.*sinh(n.*pi.*a./b));
            s=s+temp.*sinh(n.*pi.*x./b).*sin(n.*pi.*y./b);
        end
        h(k,m)=s;
        k=k+1;
    end
    k=1;  m=m+1;
end
%
figure(3);
subplot('position',[0.1 0.1 0.45 0.95]);
[c,g]=contour(h,13); hold on;
clabel (c,g,'fontsize',17); caxis([0 150]);
colorbar ('location','northoutside');
set(gca,'linewidth',2.5);
set(gca,'XTick',[1:10:101]); set(gca,'YTick',[1:10:151]);
set(gca,'Xticklabel',[0:100:1000]); set(gca,'Yticklabel',[0:100:1500]);
set(gca,'linewidth',2.0);
% End of the code %
