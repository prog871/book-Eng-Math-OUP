
% Buckling modes of a column
clear all;clc;close all;

set(0,'defaultaxesfontsize',16);

L=4; % column height in m
z=0:0.01:4; % z co-ordinate
N=2;
for n=1:N
v(n,:)=0.01*sin(n*pi*z/L);
end

figure(1)
hold on
plot(zeros(size(z)),z,LineWidth=6,Color=[0.5 0.5 0.5])
for n=1:N
plot(v(n,:),z,LineWidth=2); xlim([-0.03 0.03]); ylim([0 5])
end
hold off
ylabel('z',FontWeight='bold',FontSize=22);
xlabel('v_n(z)',FontWeight='bold',FontSize=22);
annotation(figure(1),'arrow',[0.517708333333333 0.517838541666667],...
    [0.913606911447084 0.763498920086388],'LineWidth',2,'HeadStyle','plain');
annotation(figure(1),'textbox',...
    [0.528125 0.84889200735195 0.0393229174489776 0.0674946017193228],...
    'String',{'P'},'FontWeight','bold','FontSize',24,'EdgeColor',[1 1 1]);
annotation(figure(1),'textbox',...
    [0.56223958333333 0.611850970634877 0.0716145848855376 0.0674946017193228],...
    'String',{'n = 1'},'FontSize',24,'EdgeColor',[1 1 1],...
    'BackgroundColor',[1 1 1]);
annotation(figure(1),'textbox',...
    [0.419791666666663 0.465522676898371 0.0716145848855377 0.0674946017193228],...
    'String',{'n = 2'},'FontSize',24,'EdgeColor',[1 1 1],...
    'BackgroundColor',[1 1 1]);

