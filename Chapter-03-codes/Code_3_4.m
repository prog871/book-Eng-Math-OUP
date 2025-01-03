% 1D soil with one-way drainage consolidation 
clear;
close all;
set(0,'DefaultAxesFontsize',20);
%
time=3600.*24.*1700; % seconds; simulation time
d=2.5; % half length of the clay layer
u0=100; % kN/m2; initial pore pressure
N=700; % number of terms in Fourier Series
dx=0.05; % in meter- space increment
dt=3600.*24; % in seconds; time increment
cv=3.*10.^(-7); % m^2/s consolidation coefficient
k=1; m=1; % Counters
%
for t=0:dt:time;
    for x=0:dx:2*d;
        %
        s=0.0;
        for n=1:N;
        temp=2.*u0.*sin((n-0.5).*pi)./((n-0.5).*pi);
        s=s+temp.*cos((n-0.5).*pi.*x./(2.*d)).*...
            exp(-cv.*((n-0.5).*pi).^2.*t./(2.*d).^2);  
        end
        h(k,m)=0+s;  k=k+1;
    end
     % Animation
     plot(h(:,m),0:dx:2*d,'LineWidth',3);
     ylim([0 2.*d]);
     xlim([0 u0.*1.25]);
     text(u0*0.8,d,'time=','FontSize',18);
     set(gca,'linewidth',2.5);
     %   
     str = sprintf('%3.1f', t);
     text(u0.*0.9,d,str,'FontSize',18);
     text(u0.*1.05,d,'s','FontSize',18);
     %
     refreshdata;  drawnow;
     clf;
  %
  m=m+1;  k=1;
end
% End of the code %

      


