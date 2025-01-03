clear all; clc; close all; 

set(0,'defaultaxesfontsize',16);

x=-100:0.01:100;
y=-100:0.1:100;

y1=sinh(x);
y2=cosh(x);
y3=tanh(x);
y4=coth(x);
%
figure(1)
subplot(1,2,1)
plot(x,y1,'b-','linewidth',1.5); hold on;
plot(x,y2,'k--','linewidth',1.5)
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
xlim([-5 5]); ylim([-20 20]);
xlabel('x','FontSize',18,'FontWeight','bold'); 
ylabel('y','FontSize',18,'FontWeight','bold');
legend('sinh(x)','cosh(x)','FontSize',18,'FontWeight','bold')
set(gca,'linewidth',1.0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(1,2,2)
plot(x,y3,'b-','linewidth',1.5);hold on;
plot(x,y4,'k--','linewidth',1.5);
hold on
plot(x,zeros(size(x)),'k-','linewidth',0.2)
plot(zeros(size(y)),y,'k-','linewidth',0.2)
hold off
xlim([-5 5]); ylim([-5 5]);
xlabel('x','FontSize',18,'FontWeight','bold')
ylabel('y','FontSize',18,'FontWeight','bold')
legend('tanh(x)','coth(x)','FontSize',18,'FontWeight','bold')
set(gca,'linewidth',1.0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

