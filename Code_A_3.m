clear all; clc; close all; 

set(0,'defaultaxesfontsize',16);

x=-15:0.01:15;
y=-5:0.1:5;

y1=tan(x);
y2=cot(x);

figure(1)
subplot(2,1,1)
plot(x,y1,'b-','linewidth',1.5)
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
ylim([-5 5])
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
title('tan(x)','FontSize',18,'FontWeight','bold')

subplot(2,1,2)
plot(x,y2,'r-','linewidth',1.5)
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
ylim([-5 5])
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
title('cot(x)','FontSize',18,'FontWeight','bold')

