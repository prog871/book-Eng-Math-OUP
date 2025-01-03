clear all; clc; close all; 

set(0,'defaultaxesfontsize',16);

xa=-3:0.01:3;
xb=0:0.00001:3;
y=-10:0.1:20;

y1=exp(xa);
y2=log(xb);

figure(1)
plot(xa,y1,'b-','linewidth',1.5)
hold on
plot(xb,y2,'r--','linewidth',1.5)
plot(xa,zeros(size(xa)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
legend('e^x','ln(x)','FontSize',16)
ylim([-10 10])
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')

