clc;clear all;close all;set(0,'defaultaxesfontsize',15);
%Step 1 Load the flood data
flood_peak = [1380, 792, 1391.3, 775, 540.1, 473, 1690.4, 262, 3730, 555.99,...
    1044.2, 609, 1350, 929, 272, 2250, 548,  913, 1060, 2580, 831, 580, 547,...
    914, 392, 515, 674, 438, 781, 398, 1427, 509.8, 631.3, 927, 1560, 752, ...
    1100, 875, 3080 , 976, 835, 629, 217.3, 573.13, 476.13, 1388.1, 865.13,...
    809.27, 317, 249, 300, 297, 828, 607, 301];
flood_vol = [1653.5, 935.85, 1820.3, 598.5, 1571.9, 1365.3, 2528.3, 369.7, 6069.8,...
    683.77, 1423, 584, 3896.4, 1849.5,  303.7, 7576.1, 650.2, 1464.1, 4033,...
    4768.2, 2021, 1616, 718.4, 2186, 1376.3, 595.1, 1128, 675, 1330.1, 637.8,...
    3316 ,   815.07, 750.2, 1778.2, 5074.1, 1022.4, 1804, 1627.3, 5797.1,...
    2863.8, 1136.2, 1391.5, 404.1, 966.29, 534.86, 4161.9 ,  1832.3, 1156.5,...
    312.5, 659.45, 548.85, 508.15, 1720.7, 1329.7, 553.1];
peak = flood_peak';  vol = flood_vol';
% Step 2: estimate the marginal distribution through GEV
Pgev_peak = mle(peak,'distribution','gev'); %Pgev includes three model parameters
Pgev_vol = mle(vol,'distribution','gev'); %Pgev includes three model parameters
% Step 3, estimate the parameter of the copula function
tau = corr(peak,vol,'type','Kendall');  % Kendall coefficient
theta_GH = 1/(1-tau); % parameter for Gumbel copula
theta_CJ=(2*tau)/(1-tau); % parameter for the Clayton copula
theta_Frank = copulaparam('Frank',tau); % parameter for Frank Copula
% Step 4: Comparison of different copula models
%---------------------define the copula functions------------------
GHcdf = @(u,v,theta_GH)exp(-((-log(u))^theta_GH+(-log(v))^theta_GH)^(1/theta_GH)); %Gumbel copula
CJcdf = @(u,v,theta_CJ)((u^(-theta_CJ))+(v^(-theta_CJ))-1)^(-1/theta_CJ); % Clayton Copula
Fcdf = @(u,v,theta_Frank)(-1/theta_Frank)*log(1+((exp(-theta_Frank*u)-1)*...
    (exp(-theta_Frank*v)-1)/(exp(-theta_Frank)-1)));%Frank Copula
%---------obtain the empirical probabililities-----------
Pjoint = EP2Var(peak,vol);
%---------obtain the theoretical probabilities through copula-------
N = length(peak);
for i = 1:N
    u = cdf('gev',peak(i),Pgev_peak(1), Pgev_peak(2),Pgev_peak(3)); % cdf, flood peak
    v = cdf('gev',vol(i),Pgev_vol(1), Pgev_vol(2),Pgev_vol(3)); % cdf, flood volume
    Pjoint_GH(i) =  GHcdf(u,v,theta_GH);
    Pjoint_CJ(i) =  CJcdf(u,v,theta_CJ);
    Pjoint_Frank(i) = Fcdf(u,v,theta_Frank);
end
% Step 5: Calculate the joint return period: % Based on Step 4, the Gumbel copula will be adopted
 %set the curve presence for the joint RP
v_or= [5 10 20 50 100];v_and= [5 10 20 50 100];v_kendall= [5 10 20 50 100];
% Secondary return period
fg = @(t)(-log(t))^theta_GH; % the generator function of Gumbel copula
delta = 1e-6;  Kc = @(t)t-fg(t)/((fg(t+delta)-fg(t))/delta);
dpeak = min(peak):50:1.2*max(peak);  dvol = min(vol):50:1.2*max(vol);
theta_GH = double(theta_GH);  N = length(peak);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%% Page 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1:length(dpeak)
    for j = 1:length(dvol)
        u = cdf('gev',dpeak(i),Pgev_peak(1), Pgev_peak(2), Pgev_peak(3)); % cdf for flood peak
        v = cdf('gev',dvol(j),Pgev_vol(1), Pgev_vol(2), Pgev_vol(3)); % cdf for flood volume
        JCDF(i,j) = GHcdf(u,v,theta_GH);
        T_or(i,j) = 1/(1-JCDF(i,j));
        T_and(i,j) = 1/(1-u-v+JCDF(i,j));
        K_RP(i,j) =1/(1-Kc(JCDF(i,j)));
    end
end
figure; subplot('position',[0.1 0.75 0.42 0.20]) %--------subplot 1------
[C,h] = contour(dvol,dpeak,T_and,v_and);
set(h,'color','k','LineWidth',1.5); clabel(C,h)
hold on; plot(vol,peak,'bo','markersize',5,'LineWidth',1.5);
ylabel('Peak (m^3/s)'); xlabel('Volume (m^3/s day)'); set(h,'color','k')
title('(a) T^A^N^D'); set(gca,'linewidth',1.5);
subplot('position',[0.1 0.42 0.42 0.20]) %-----------------subplot 2-----
[C,h] = contour(dvol,dpeak,T_or,v_or);
set(h,'color','k','LineWidth',1.5); clabel(C,h)
hold on; plot(vol,peak,'bo','markersize',5,'LineWidth',1.5)
hold off; ylabel('Peak (m^3/s)'); xlabel('Volume (m^3/s day)')
set(h,'color','k','LineWidth',1.5);title('(b) T^O^R');set(gca,'linewidth',1.5);
subplot('position',[0.1 0.09 0.42 0.20]) %------------------subplot 3----
[C,h] = contour(dvol,dpeak,K_RP,v_kendall);
set(h,'color','k','LineWidth',1.5); clabel(C,h)
hold on; plot(vol,peak,'bo','markersize',5,'LineWidth',1.5)
hold off; ylabel('Peak (m^3/s)'); xlabel('Volume (m^3/s day)')
set(h,'color','k'); title('(c) T^k^e^n^d^a^l^l'); set(gca,'linewidth',1.5);
% ----Comparison between univariate and multivariate return periods---------
T = [10, 20, 50, 100, 200]; % set the univariate return periods
p = 1-1./T; %the corresponding CDF
OutputMatrix = zeros(length(T),6); 
%colnames ={'univariate RP','peak magnitude','vol magnitude','Tand','Tor','Tkendall'}
for i = 1:length(T)
    OutputMatrix(i,1) =T(i);
    OutputMatrix(i,2) = icdf('gev',p(i),Pgev_peak(1), Pgev_peak(2), Pgev_peak(3));
    OutputMatrix(i,3) = icdf('gev',p(i),Pgev_vol(1), Pgev_vol(2), Pgev_vol(3));
    JointCDF = GHcdf(p(i),p(i),theta_GH);
    OutputMatrix(i,4) = 1/(1-p(i)-p(i)+JointCDF); %Tand
    OutputMatrix(i,5) = 1/(1-JointCDF); %Tor
    OutputMatrix(i,6) = 1/(1-Kc(JointCDF)); %Tkendall
end


