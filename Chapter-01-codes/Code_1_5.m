% This code plots the Mohr-Coulomb 
% failure envelope for a soil
clc; clear; close all;
set(0,'DefaultAxesFontsize',16);
%
c=8; % soil cohesion (KN/m^2);
phi= 20; % internal friction angle (degree);
% 'tau' is shear stress
% 'zigma' is normal stress
zigma=-22:1:100; % normal stress (KN/m^2)  
tau= c + zigma.* tan(phi.*pi./180);
% deformation is reported in millimeters
%
subplot('position',[0.2 0.2 0.45 0.45]);
plot(zigma,tau,'b', 'LineWidth',1.5);
xlim([-30 100]); ylim([0 50]);
xlabel('\sigma, Normal stress (KN/m^2)');
ylabel('\tau, Shear stress (KN/m^2)');
line([0 0],[-10 1000],'color','k','linewidth',1.5);
set(gca,'linewidth',1.5);
grid on;
%
% End of the code %

      


