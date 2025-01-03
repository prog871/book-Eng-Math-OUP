
% calculate and plot deflection, slope, bending moment and shear force in a
% simply supported beam
clear all;clc;close all;

set(0,'defaultaxesfontsize',16);

E=50*10^9; % Young's modulus in Pa
h=0.3;     % cross-section side in m
I=h^4/12;   % second moment of area
L=5;       % beam span in m
q=-100*1063;   % distributed load N/m
x=0:0.01:5; % axial distance from hinge

w=q*x/(24*E*I).*(x.^3-2*L*x.^2+L^3);
sl=q/(24*E*I).*(4*x.^3-6*L*x.^2+L^3);
M=q/2*x.*(L-x);
V=q*(L/2-x);

figure(1)
subplot(2,2,1)
plot(x,w,'b-',LineWidth=1.5)
xlabel('x (m)','FontWeight','bold','FontSize',22);
ylabel('w (m)','FontWeight','bold','FontSize',22);
subplot(2,2,2)
plot(x,sl,'k-',LineWidth=1.5)
xlabel('x (m)','FontWeight','bold','FontSize',22);
ylabel('\theta (rad)','FontWeight','bold','FontSize',22);
subplot(2,2,3)
plot(x,M,'r-',LineWidth=1.5)
xlabel('x (m)','FontWeight','bold','FontSize',22);
ylabel('M (Nm)','FontWeight','bold','FontSize',22);
subplot(2,2,4)
plot(x,V,'g-',LineWidth=1.5)
xlabel('x (m)','FontWeight','bold','FontSize',22);
ylabel('V (N)','FontWeight','bold','FontSize',22);
