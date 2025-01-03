% 1D groundwater flow in aquifer
clear; close all; clc;
set(0,'DefaultAxesFontsize',20);
%
R=0.001./(24.*3600); % Recharge rate (m/s)
L=500; % Lebgth of aquifer (m)
T=2000./(24.*3600); %% Transmissivity (m2/s)
S=0.07; %Storage coefficient 
time=3600.*24.*50; %time of simulations
dt=3600.*6; %time interval
%
k=1; m=1;
for t=0:dt:time
for x=0:1:L
    s=0.0;
    for n=1:300
      temp1=2.*R.*L.^2./(T.*((n-0.5).*pi).^3);
      temp2=-1.*T.*(((n-0.5).*pi./L).^2)./S;
      s=s+temp1.*sin((n-0.5).*pi.*x./L).*...
          (1-exp(temp2.*t));
    end
    f(m,k)=s;
    k=k+1;
end
%
subplot(2,1,1);
plot(0:1:500,f(m,:),'b','LineWidth',3.0);
xlabel('Distance along aquifer (m)');
ylabel('Water table (m)');
xlim([0 500]);
ylim([0 0.1]);
set(gca,'linewidth',2.5);
%   
   str = sprintf('%3.1f', t./3600);
   text(L.*0.5,0.08,str,'FontSize',22);
   text(L.*0.4,0.08,'Time = ','FontSize',22);
   text(L.*0.57,0.08,'hour','FontSize',22);
%
drawnow;
refreshdata; clf;
%
m=m+1; k=1;
end
% End of the code %%%
