clear all; clc; close all; 

set(0,'defaultaxesfontsize',16);

x=-15:0.01:15;
y=-2:0.01:2;

y1=sin(x);
y2=cos(x);

figure(1)
plot(x,y1,'b-',x,y2,'r--','linewidth',1.5)
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
legend('sin(x)','cos(x)','fontsize',16)
ylim([-2 2])
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')

