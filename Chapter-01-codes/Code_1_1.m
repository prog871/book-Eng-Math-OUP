% This code plots oscillations of a 
% single degree of freedom system (m, k, c)
clc; clear; close all;
set(0,'DefaultAxesFontsize',16);
%
m=10; % mass of the system (kg)
k=90; % stiffness of the spring (kg/s^2)
c=10; % damping coefficient of damper (kg/s) 
%
t=0:0.1:10;
x=exp(-0.5.*t).*(0.16.*cos(2.96.*t)+...
    0.027.*sin(2.96.*t));
%
subplot('position',[0.2 0.2 0.3 0.35]);
plot(t,x,'b', 'LineWidth',1.5);
xlim([0 8]);ylim([-0.2 0.2]);
xlabel('t, Time (s)'); ylabel('x, Displacement (m)');
set(gca,'linewidth',1.5);
grid on;
%
% End of the code %

      


