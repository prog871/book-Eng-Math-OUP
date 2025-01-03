% This code plots the def0rmation of a 
% column under a point load (P)
clc; clear; close all;
set(0,'DefaultAxesFontsize',16);
%
L=3; % length of beam (m);
% P is point load (KN);
E=2.5.*10.^(7); % Young's modulus (KN/m^2); 
A=0.09; % cross section area (m^2);
%
P=0:1:200; % point oad P variations (KN)  
deltaL=(P.*L./(E.*A)).*1000;
% deformation is reported in millimeters
%
subplot('position',[0.2 0.2 0.55 0.45]);
plot(P,deltaL,'b', 'LineWidth',1.5);
xlim([0 210]); ylim([0 0.3]);
xlabel('P, Point load (KN)');
ylabel('\DeltaL, Deformation (mm)');
set(gca,'linewidth',1.5);
grid on;
%
% End of the code %

      


