% Double-drainage comsolidation 
clear; clc; close all;
set(0,'DefaultAxesFontsize',20);
%
time=3250; % in seconds; total simulation time
d=5; % half length of the clay layer
u0=10; % initial pore pressure (KN/m^2)
N=1000; % number of terms in Fourier Series
dx=0.1; % in meter- space increment
dt=5; % in seconds-- time increment
cv=8.*10.^(-3); % in m^2/s coefficient of consolidation
k=1; m=1; % Counters
%
for t=0:dt:time;
    for x=0:dx:2*d;
        s=0.0;
        for n=1:N;
        z=2.*u0.*(1-(-1).^n)./(n.*pi);
        s=s+z.*sin(n.*pi.*x./(2.*d)).*...
            exp(-cv.*(n.*pi).^2.*t./(2.*d).^2);  
        end 
        h(k,m)=s;  k=k+1;
    end
    % Animations
    plot(h(:,m),0:dx:2*d,'LineWidth',3);
    ylim([0 2.*d]);
    xlim([0 u0.*1.25]);
    text(u0*0.9,d,'time =','FontSize',18)
    ylabel('Distance (m)');
    xlabel('Pore pressure (kN/m^2)');
    legend('1-D consolidation with double drainage');
    set(gca,'linewidth',1.5);
    %   
    str = sprintf('%3.1f', t);
    text(u0.*1.0,d,str,'FontSize',18);
    text(u0.*1.1,d,'s','FontSize',18);
    %
    refreshdata; drawnow; clf;
    %
    m=m+1; k=1;
end
% End of the code %

