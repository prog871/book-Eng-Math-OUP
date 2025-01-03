
% calculation of rotation angle under torsion
clear all; clc; close all;

set(0,'defaultaxesfontsize',16);

G=190*10^9; % Young's modulus in Pa
R1=0.1;    % cross-section radius in m: case 1
R2=0.15;     % cross-section radius in m: case 2
R3=0.2;     % cross-section radius in m: case 3
T=10*10^3;  % Moment a x=L in Nm
miu=10*10^6;  % distributed moment load in N/m^2
L=3;        % Length in m

A1=pi*R1^2; % Area 1
A2=pi*R2^2; % Area 2
A3=pi*R3^2; % Area 3

J1=pi*R1^4/2; % Polar second moment of area 1
J2=pi*R2^4/2; % Polar second moment of area 2
J3=pi*R3^4/2; % Polar second moment of area 3

x=0:0.01:3; % axial distance from fixed end
th1=T*x/(G*J1)+miu*A1*L/(G*J1)*x-miu*A1/(2*G*J1)*x.^2;
th2=T*x/(G*J2)+miu*A2*L/(G*J2)*x-miu*A2/(2*G*J2)*x.^2;
th3=T*x/(G*J3)+miu*A3*L/(G*J3)*x-miu*A3/(2*G*J3)*x.^2;

figure(1)
plot(x,th1,'b-',x,th2,'b-',x,th3,'b','linewidth',1.5)
ylabel('rotation \theta(x) rad','FontWeight','bold','FontSize',22);
xlabel('x (m)','FontWeight','bold','FontSize',22);
annotation(figure(1),'textbox',...
    [0.57395833333333 0.750619869431956 0.0687500000000022 0.0545356381274196],...
    'String',{'R=0.1 m'},'FontSize',18,'FitBoxToText','off','EdgeColor',...
    [1 1 1],'BackgroundColor',[1 1 1]);
annotation(figure(1),'textbox',...
    [0.658072916666661 0.406667385630659 0.077343750000005 0.0545356381274195],...
    'String','R=0.15 m','FontSize',18,'FitBoxToText','off','EdgeColor',...
    [1 1 1],'BackgroundColor',[1 1 1]);
annotation(figure(1),'textbox',...
    [0.746093749999994 0.272758098373639 0.0687500000000022 0.0545356381274196],...
    'String','R=0.2 m','FontSize',18,'FitBoxToText','off','EdgeColor',...
    [1 1 1],'BackgroundColor',[1 1 1]);
