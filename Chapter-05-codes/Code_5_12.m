clc;clear all;close all;set(0,'defaultaxesfontsize',17);
% implicit numerical method-BTCS
% water velocity v = 0.3 m/s; % dispersion coefficient E = 5.0 m^2/s; 
% dx = 25 m; % dt = 20 s; %E = 5.0;
dt = 20; dx = 25;  E = 5;   v = 0.3;
alpha1 = E/(dx^2)+v/(2*dx);
alpha2 = -(2*E/dx^2+1/dt);
alpha3 = E/dx^2 - v/(2*dx);
% set initial conditions, at x = 0, C = 100; C = 0 for x >0
C = zeros (6, 6);
% C(i,j) i = 1, 2 ..., 6 corresponds to t = 0, 20, 40, ...; 
% j = 1, 2, ..., 6 corresponds to x = 0, 25, 50, 75, 100, 125
% Input initial conditions to the Matrix
C(:,1) = 100;   [nrow, ncol] = size(C);
for i = 1: (nrow-1) % start when t = 20
    %set the coefficient matrix for the linear system
    ParMatrix = zeros(5,5);
    ParMatrix(1, 1:2) = [alpha2, alpha3];
    for k = 2:4
        ParMatrix(k,(k-1):(k+1))= [alpha1, alpha2, alpha3];
    end
    ParMatrix(5, 4:5) = [1, -1];
    %Set the right-hand values for the linear system
    b = zeros(5,1);
    b(1,1) = -C(i,2)/dt - alpha1*C((i+1),1);  % C()
    for k = 2:4
        b(k,1) = -C(i,(k+1))/dt;
    end
    b(5,1) = 0;
    %solve the linear system by Gaussian Elimination Method
    X = GaussianSolver(ParMatrix,b);
    C((i+1),2:ncol) = X';
end 
%%%%%%%%%%%%%%%%% PRINT  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
display (C);
%%%%%%%%%%%%%%%%% PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(C(:,2),'k','linewidth',1.5); % x = 25;
hold on; plot(C(:,3),'k--','linewidth',1.5); %x = 50
hold on; plot(C(:,4),'b-.','linewidth',1.5); %x = 75;
hold on ; plot(C(:,5),'mo','markersize',5,'linewidth',1.5); %x = 100;
xlabel('Time (s)'); ylabel('Concentration (ppm)');
legend('Location x=25','Location x=50','Location x=75','Location x=100',...
    'location','northeast');   set(gca,'linewidth',1.5);
ylim([0 100]);
%

