clear all; clc; close all; 

set(0,'defaultaxesfontsize',16);

x=-2:0.01:2;  % Domain
y=-4:0.01:4;

p0=ones(size(x)); % constant
p1=x;             % linear
p2=x.^2;          % quadratic
p3=x.^3;          % qubic

figure(1)
subplot(2,2,1)
plot(x,p0,'b-','linewidth',1.5)
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
ylim([-4 4])
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
title('p(x) = 1','FontSize',18,'FontWeight','bold')
subplot(2,2,2)
plot(x,p1,'b-','linewidth',1.5)
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
ylim([-4 4])
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
title('p(x) = x','FontSize',18,'FontWeight','bold')
subplot(2,2,3)
plot(x,p2,'b-','linewidth',1.5)
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
ylim([-4 4])
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
title('p(x) = x^2','FontSize',18,'FontWeight','bold')
subplot(2,2,4)
plot(x,p3,'b-','linewidth',1.5)
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
ylim([-4 4])
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
title('p(x) = x^3','FontSize',18,'FontWeight','bold')

