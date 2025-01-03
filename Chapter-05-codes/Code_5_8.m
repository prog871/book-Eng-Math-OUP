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
%change the data to column vector
peak = flood_peak';  vol = flood_vol';
% Step 2: estimate the marginal distribution through GEV
Pgev_peak = mle(peak,'distribution','gev'); %Pgev includes the three model parameters
Pgev_vol = mle(vol,'distribution','gev'); %Pgev includes the three model parameters
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% PAGE 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TestMatrix = zeros(3,2); %define the matrix to store the test results; 
%define the RMSE funtion 
rmseFUN = @(n,k, Fc, Fe)sqrt((1/(n-k))*sum(Fc-Fe).^2);
%define the AIC function
aicFUN = @(n,k,MSE)n*log(MSE)+2*k;
TestMatrix(1,1) = rmseFUN(N,1,Pjoint_GH,Pjoint);
MSE = TestMatrix(1,1)^2;
TestMatrix(1,2) = aicFUN(N,1,MSE);
TestMatrix(2,1) = rmseFUN(N,1,Pjoint_CJ,Pjoint);
MSE = TestMatrix(2,1)^2;
TestMatrix(2,2) = aicFUN(N,1,MSE);
TestMatrix(3,1) = rmseFUN(N,1,Pjoint_Frank,Pjoint);
MSE = TestMatrix(3,1)^2;
TestMatrix(3,2) = aicFUN(N,1,MSE);
%%%%%%% PRINT the performances of different copulas (RMSE are AIC)
display('Performances of different copulas'); display(TestMatrix);
%-----------------Plot comparison----------------------------
x = 0:0.01:1; y = x;
figure
subplot('position',[0.1 0.75 0.4 0.21]); plot(x,y,'b-','linewidth', 1.5);
hold on; plot(Pjoint,Pjoint_GH,'ko','markersize',5,'linewidth',1.0);
xlabel('Empirical CDF'); ylabel('Calculated CDF');
title('(a) Gumbel Copula vs. Empirical');set(gca,'linewidth', 1.5);
legend('45^o line','Gumble','location','southeast');
%
subplot('position',[0.1 0.42 0.4 0.21]); plot(x,y,'b-','linewidth', 1.5);
hold on; plot(Pjoint,Pjoint_CJ,'ko','markersize',5,'linewidth',1.0);
xlabel('Empirical CDF'); ylabel('Calculated CDF');
title('(b) Clayton Copula vs. Empirical');set(gca,'linewidth', 1.5);
legend('45^o line','Clayton Copula','location','southeast');
%
subplot('position',[0.1 0.09 0.4 0.21]); plot(x,y,'b-','linewidth', 1.5);
hold on; plot(Pjoint,Pjoint_Frank,'ko','markersize',5,'linewidth',1.0);
xlabel('Empirical CDF'); ylabel('Calculated CDF');
title('(c) Frank Copula vs. Empirical');set(gca,'linewidth', 1.5);
legend('45^o line','Frank Copula','location','southeast');






