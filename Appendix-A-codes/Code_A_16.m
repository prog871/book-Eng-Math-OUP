% Least Squares Fit to a data set

clear all;clc;close all;

set(0,'defaultaxesfontsize',16);

% x data coordinates
x=[1 2 4 5 6];
% y data coordinates
y=[1 2 2 3 4];
% mean values
xm=mean(x); ym=mean(y);
% least squate solution
a=sum((x-xm).*(y-ym))/sum((x-xm).^2); b=ym-a*xm;

figure(1)
plot(x,y,'Ob',x,a*x+b,'k-','linewidth',1.5)
hold on
plot([x(1) x(1)],[y(1) a*x(1)+b],'k--','linewidth',1)
plot([x(2) x(2)],[y(2) a*x(2)+b],'k--','linewidth',1)
plot([x(3) x(3)],[y(3) a*x(3)+b],'k--','linewidth',1)
plot([x(4) x(4)],[y(4) a*x(4)+b],'k--','linewidth',1)
plot([x(5) x(5)],[y(5) a*x(5)+b],'k--','linewidth',1)
hold off
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
