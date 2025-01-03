clc;clear all;close all;set(0,'defaultaxesfontsize',17);
%explicit numerical method
% water velocity v = 0.3 m/s, % dispersion coefficient E = 5.0 m^2/s
% dx = 25 m, % dt = 20 s
dt = 20; % time step for finite difference method
dx = 25; % grid spacing for finite difference method
E = 5; % dispersion coefficient 
v = 0.3; % water velocity
beta1 = dt*(v/(2*dx)+E/(dx^2));
beta2 = dt*(1/dt-2*E/(dx^2));
beta3 = dt*(-v/(2*dx)+E/(dx^2));
C = zeros(50, 10); % row is time t, column is distance;
C(:,1) = 100; % at t = 0; the pollutant concentration is 100;
[nrow, ncol] = size(C);
 
for t = 1:(nrow-1)
    for x = 2:(ncol-1)  %x = 1 means t = 0
        C((t+1),x) = beta1*C(t,(x-1))+beta2*C(t,x)+beta3*C(t,(x+1));
    end
end
%%%%%%%%%%%%%%%%% PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%it = 1:10;
T = 0:20:20*49 
plot(T,C(:,2),'k','linewidth',1.5); % x = 25;
hold on; plot(T,C(:,3),'k--','linewidth',1.5); %x = 50
hold on; plot(T,C(:,4),'b-.','linewidth',1.5); %x = 75;
hold on ; plot(T,C(:,5),'mo','markersize',5,'linewidth',1.5); %x = 100;
xlabel('Time (s)'); ylabel('Concentration (ppm)');
legend('Location x=25','Location x=50','Location x=75','Location x=100',...
    'location','southeast');   set(gca,'linewidth',1.5);

