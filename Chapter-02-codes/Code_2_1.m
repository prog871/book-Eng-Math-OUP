
% calculation of a bar structural member elongation
clear all; clc; close all;

set(0,'defaultaxesfontsize',16);

E=210*10^9; % Young's modulus in Pa
A=0.001;    % Cross-section area in m^2
P=10*10^3; % Point load in N
f=10000*10^3;  % distributed axial load in N/m^3

L=0:0.01:5; % bar length in m
uL=P*L/(E*A)+f*L.^2/(2*E); % elongation in m

figure(1)
plot(L,uL,'b-','linewidth',1.5)
ylabel('elongation u_L (m)','FontWeight','bold','FontSize',22);
xlabel('L (m)','FontWeight','bold','FontSize',22);

annotation(figure(1),'line',[0.208333333333333 0.195833333333333],...
    [0.803535637149028 0.782937365010799]);
annotation(figure(1),'line',[0.20859375 0.19609375],...
    [0.783557235421166 0.762958963282937]);
annotation(figure(1),'line',[0.208984375 0.196484375],...
    [0.762768898488119 0.74217062634989]);
annotation(figure(1),'line',[0.209114583333333 0.196614583333333],...
    [0.740900647948161 0.720302375809932]);
annotation(figure(1),'rectangle',...
    [0.210375 0.746220302375805 0.265145833333333 0.041036717062635],...
    'FaceColor',[0.8 0.8 0.8]);
annotation(figure(1),'line',[0.209505208333333 0.209505208333333],...
    [0.810825053995679 0.717872570194383],'LineWidth',3);
annotation(figure(1),'arrow',[0.427864583333331 0.465624999999997],...
    [0.767278617710572 0.767818574514025],'Color',[1 0 0],'LineWidth',1,...
    'HeadWidth',8,'HeadStyle','plain','HeadLength',8);
annotation(figure(1),'arrow',[0.379427083333331 0.417187499999997],...
    [0.766198704103661 0.766738660907113],'Color',[1 0 0],'LineWidth',1,...
    'HeadWidth',8,'HeadStyle','plain','HeadLength',8);
annotation(figure(1),'arrow',[0.330468749999998 0.368229166666664],...
    [0.766198704103661 0.766738660907114],'Color',[1 0 0],'LineWidth',1,...
    'HeadWidth',8,'HeadStyle','plain','HeadLength',8);
annotation(figure(1),'arrow',[0.224218749999998 0.261979166666664],...
    [0.766198704103658 0.766738660907111],'Color',[1 0 0],'LineWidth',1,...
    'HeadWidth',8,'HeadStyle','plain','HeadLength',8);
annotation(figure(1),'arrow',[0.277083333333332 0.314843749999998],...
    [0.766738660907118 0.76727861771057],'Color',[1 0 0],'LineWidth',1,...
    'HeadWidth',8,'HeadStyle','plain','HeadLength',8);
annotation(figure(1),'textbox',...
    [0.352343749999998 0.802995679058205 0.0304687505712112 0.0674946017193228],...
    'Color',[1 0 0],'String',{'f'},'FontSize',24,'EdgeColor',[1 1 1]);
annotation(figure(1),'doublearrow',[0.211458333333333 0.475],...
    [0.69438444924406 0.692224622030237]);
annotation(figure(1),'textbox',...
    [0.337239583333332 0.662606910159713 0.0283854166666684 0.0674946017193226],...
    'Color',[0.149019607843137 0.149019607843137 0.149019607843137],...
    'String',{'L'},'FontWeight','bold','FontSize',24,'FitBoxToText','off',...
    'EdgeColor',[1 1 1],'BackgroundColor',[1 1 1]);
annotation(figure(1),'arrow',[0.476692708333332 0.545963541666665],...
    [0.76870842332613 0.768628509719219],...
    'Color',[0.0745098039215686 0.623529411764706 1],...
    'LineWidth',2,'HeadStyle','plain');
annotation(figure(1),'arrow',[0.477083333333333 0.509895833333333],...
    [0.692574514038876 0.692494600431965],'Color',[0 0 1]);
annotation(figure(1),'textbox',...
    [0.524479166666665 0.778697622902704 0.0250000000000014 0.0674946017193228],...
    'Color',[0.0745098039215686 0.623529411764706 1],...
    'String',{'P'},'FontWeight','bold','FontSize',24,'FitBoxToText','off',...
    'EdgeColor',[1 1 1]);
annotation(figure(1),'textbox',...
    [0.513281249999997 0.657207342125163 0.0250000000000014 0.0674946017193226],...
    'Color',[0 0 1],'String','u_L','FontWeight','bold','FontSize',24,...
    'FitBoxToText','off','EdgeColor',[1 1 1]);
