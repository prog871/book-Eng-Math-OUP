
% deflection of beam on Winkler foundation
clear all; clc; close all;

set(0,'defaultaxesfontsize',16);

EI=1000; % flexural rigidity
k1=1; % Winkler constant 1
k2=2;   % Winkler constant 2
beta1=(k1/(EI))^(1/4); beta2=(k2/(EI))^(1/4);

P=-1;    % unit load at x=0
L=50;    % beam half-length simulating infinite beam

x_n=-L:0.01:-0.01; % negative axis coordinates
x_p=0:0.01:L;      % positive axis coordinates
x=[x_n x_p];

% solution for k1
w1_n=P*beta1/(2*k1)*exp(beta1*x_n).*(cos(beta1*x_n)-sin(beta1*x_n));
w1_p=P*beta1/(2*k1)*exp(-beta1*x_p).*(cos(beta1*x_p)+sin(beta1*x_p));
w1=[w1_n w1_p];

% solution for k2
w2_n=P*beta2/(2*k2)*exp(beta2*x_n).*(cos(beta2*x_n)-sin(beta2*x_n));
w2_p=P*beta2/(2*k2)*exp(-beta2*x_p).*(cos(beta2*x_p)+sin(beta2*x_p));
w2=[w2_n w2_p];

figure(1)
plot(x,w1,'b-',x,w2,'k--','LineWidth',2)
ylabel('w(x)',FontWeight='bold',FontSize=22);
xlabel('x',FontWeight='bold',FontSize=22);
legend('k_1=1','k_2=2','fontsize',18)
annotation(figure(1),'rectangle',...
    [0.185895833333333 0.277537796976242 0.223479166666667 0.133909287257017],...
    'Color',[0.8 0.8 0.8],'FaceColor',[0.8 0.8 0.8]);
annotation(figure(1),'rectangle',...
    [0.1859375 0.412526997840172 0.2234375 0.0129589632829359],...
    'Color',[0.501960784313725 0.501960784313725 0.501960784313725],...
    'FaceColor',[0.501960784313725 0.501960784313725 0.501960784313725]);
annotation(figure(1),'arrow',[0.3 0.3],[0.554345572354211 0.423596112311015],...
    'LineWidth',2,'HeadStyle','plain');
annotation(figure(1),'arrow',[0.300390625 0.451432291666667],...
    [0.418006479481641 0.419006479481641]);
annotation(figure(1),'textbox',...
    [0.307031249999999 0.535177104647162 0.0359375007015963 0.0631749471886884],...
    'String',{'P'},'FontSize',22,'EdgeColor',[1 1 1]);
annotation(figure(1),'textbox',...
    [0.442708333333333 0.345652266634205 0.0328125006270906 0.0631749471886884],...
    'String',{'x'},'FontSize',22,'EdgeColor',[1 1 1]);
