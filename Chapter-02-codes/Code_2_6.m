
% calculate and plot stresses in a pipe under pressure
clear all;clc;close all;

set(0,'defaultaxesfontsize',16);

a=0.2; % internal radius in m
b=0.3; % external radius in m
p_i=100*10^6; % internal pressure in Pa
p_o=0; % external pressure in Pa

r=a:0.001:b;

s_radial=-p_i*((b./r).^2-1)./((b/a)^2-1)...
         -p_o*(1-(a./r).^2)./(1-(a/b)^2);
s_hoop=p_i*((b./r).^2+1)./((b/a)^2-1)...
         -p_o*(1+(a./r).^2)./(1-(a/b)^2);

figure(1)
plot(r,s_radial/10^6,'k',r,s_hoop/10^6,'b-',LineWidth=1.5)
xlabel('r (m)','FontWeight','bold','FontSize',22);
ylabel('stress (MPa)','FontWeight','bold','FontSize',22);
annotation(figure(1),'textbox',...
    [0.620833333333332 0.224701942093684 0.0395833333333344 0.0869330471071773],...
    'String',{'\sigma_{rr}'},'FontSize',24,'FitBoxToText','off',...
    'EdgeColor',[1 1 1],'BackgroundColor',[1 1 1]);
annotation(figure(1),'textbox',...
    [0.620052083333331 0.643168464771867 0.0395833333333343 0.0869330471071769],...
    'Color',[0 0 1],'String','\sigma_{\theta\theta}','FontSize',24,...
    'FitBoxToText','off','EdgeColor',[1 1 1],'BackgroundColor',[1 1 1]);

