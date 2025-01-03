% This code plots the deflection 
% of a beam under a point load (P)
clc; clear; close all;
set(0,'DefaultAxesFontsize',16);
%
L=5; % length of beam (m);
P= 75; % point load (KN);
E=2.5.*10.^(7); % Young's modulus (KN/m^2); 
I=0.005; % moment inertia of cross section(m^4);
%
x=0:0.1:2.5; % plot deflection of half of beam 
y=P.*x.*(3.*(L.^2)-(4.*x.^2))./(48.*E.*I).*1000;
% deflection is reported in millimeters
%
subplot('position',[0.2 0.2 0.55 0.45]);
plot(x,y,'b', 'LineWidth',1.5);
set(gca, 'YDir', 'reverse')
xlim([0 2.6]); ylim([0 1.8]);
xlabel('x, Location along the beam (m)');
ylabel('y, Deflection (mm)');
set(gca,'linewidth',1.5);
grid on;
%
% End of the code %

      


