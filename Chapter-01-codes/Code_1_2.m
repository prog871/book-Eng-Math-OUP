% This code plots variations of pollution 
% concentration in a reservoir
clc; clear; close all;
set(0,'DefaultAxesFontsize',16);
%
V=25*10^(6); % reservoir water volume (m^3)
Q=2.5; % input discharge of reservoir (m^3/s) 
c0=500; % initial pollution concentration at t=0 (ppm)
%
t=0:3600:500*24*3600; % time for 500 days
C=500.*exp(-1.*10^(-7).*t);
%
subplot('position',[0.2 0.2 0.45 0.45]);
plot(t./(24.*3600),C,'b', 'LineWidth',1.5);
xlim([0 500]); ylim([0 550]);
xlabel('t, Time (day)'); ylabel('C, Pollution concentration (ppm)');
set(gca,'linewidth',1.5);
grid on;
%
% End of the code %

      


