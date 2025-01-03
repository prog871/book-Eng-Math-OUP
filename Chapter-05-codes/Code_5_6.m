clc;clear all;close all;set(0,'defaultaxesfontsize',17);
%Step 1 Load the flood data
flood_data = [1380, 792, 1391.3, 775, 540.1, 473, 1690.4, 262, 3730, 555.99, ...
    1044.2, 609, 1350, 929, 272, 2250, 548, 913, 1060, 2580, 831, 580, 547, ...
    914, 392, 515, 674, 438, 781, 398, 1427, 509.8, 631.3, 927,1560, 752, 1100, ...
    875, 3080, 976, 835, 629, 217.3, 573.13, 476.13, 1388.1, 865.13, 809.27,...
    317, 249, 300, 297, 828, 607, 301];
%% ========== Maximum Likelihood Estimation===========
x = flood_data;
Pln = mle(x,'distribution','lognormal'); % lognormal, Pln include model parameters
Pev = mle(-x,'distribution','ev');% Gumbel (or EV), Pev includes two parameters
% In matlab, the Gumbel distribution (i.e. EV) is for minima. Therefore, the annual
% maxima is converted to minima firstly and then estimate the location and 
% shape parameters. %Fmax(x0) = P(X<= x0) = P(-X>=-x0) = 1-Fmin(-x0)
Pgev = mle(x,'distribution','gev'); % GEV distribution, Pgev includes three parameters
%% --===================Goodness of fit=========
TestMatrix = zeros(3,4); %define the matrix to store the test results; 
% rownames = {'LN', 'Gumbel', 'GEV'}; colnames = {'h','p','RMSE','AIC'}
rmseFUN = @(n,k, Fc, Fe)sqrt((1/(n-k))*sum(Fc-Fe).^2); %define RMSE function 
aicFUN = @(n,k,MSE)n*log(MSE)+2*k; %define the AIC function
 % ---------------empirical probability---------------------
SortX = sort(x);
for i = 1:length(x)
    Fe(i) = (i-0.44)/(length(x)+0.12);
end
% ---------goodness-of-fit for LN-------------------------------
LN_cdf = cdf('lognormal',x,Pln(1), Pln(2));
[h_ln,p_ln] = kstest(x,'CDF',[x',LN_cdf']); % matrix has 2 columns;
TestMatrix(1,1) = h_ln;  TestMatrix(1,2) = p_ln;
% calculated probability from LN Fc_LN
Fc_LN = cdf('lognormal',SortX,Pln(1), Pln(2)); % the SortX is adopted here;
TestMatrix(1,3) = rmseFUN(length(x),2,Fc_LN, Fe); % RMSE
MSE = TestMatrix(1,3)^2;
TestMatrix(1,4) = aicFUN(length(x),2, MSE); % AIC
% -----------------goodness-of-fit for Gumbel-----------
EV_cdf = cdf('ev',-x,Pev(1), Pev(2)); % -x for minima
[h_ev,p_ev] = kstest(-x,'CDF',[-x',EV_cdf']); % matrix has 2 columns;
TestMatrix(2,1) = h_ev;   TestMatrix(2,2) = p_ev;
% calculated probability from Gumbel Fc_EV
Fc_EV_min = cdf('ev',-SortX,Pev(1), Pev(2)); % the -SortX is adopted here;
Fc_EV = sort(1-Fc_EV_min); % get CDF for maxima SortX and store in ascending order; 
TestMatrix(2,3) = rmseFUN(length(x),2,Fc_EV, Fe); % RMSE
MSE = TestMatrix(2,3)^2;
TestMatrix(2,4) = aicFUN(length(x),2, MSE); % AIC
%%%%%%%%%%%%%%%%%
% Page 2 
%%%%%%%%%%%%%%%%%
%-----------------goodness-of-fit for GEV------------
 GEV_cdf = cdf('gev',x,Pgev(1), Pgev(2), Pgev(3)); % three parameters for GEV
[h_gev,p_gev] = kstest(x,'CDF',[x',GEV_cdf']); % matrix has 2 columns;
TestMatrix(3,1) = h_gev;  TestMatrix(3,2) = p_gev;
% calculated probability from LN Fc_LN
Fc_GEV = cdf('gev',SortX,Pgev(1), Pgev(2), Pgev(3)); % the SortX is adopted here;
TestMatrix(3,3) = rmseFUN(length(x),2,Fc_GEV, Fe); % RMSE
MSE = TestMatrix(3,3)^2;
TestMatrix(3,4) = aicFUN(length(x),2, MSE); % AIC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PRINT the outcomes of performance test:
display ('Performances of different distributions on modelling AMAX flood series');
display(TestMatrix);
%% ==============Plot Comparison ==============
dx = 0.8*min(x):10:1.2*max(x); % discretize the the flood variable 
for i = 1:length(dx)
    P_LN(i) = cdf('lognormal',dx(i),Pln(1), Pln(2));
    P_GEV(i) = cdf('gev',dx(i),Pgev(1), Pgev(2), Pgev(3));
    P_Gumbel_min(i) = cdf('ev',-dx(i),Pev(1), Pev(2)); % cdf for Gumbel minima;
    P_Gumbel(i) =1-P_Gumbel_min(i); % cdf for Gumbel maxima; 
end
figure; plot(SortX,Fe,'ko','markersize',5,'linewidth',1.0)
hold on; plot(dx,P_LN,'k','linewidth',1.0)
hold on; plot(dx,P_GEV,'m-.','linewidth',1.0);
hold on; plot(dx,P_Gumbel,'b--','linewidth',1.0);
xlabel('Peak flow (m^3/s)'); ylabel('Cumulative Distribution Function (CDF)')
legend('Empirical CDF','LN','GEV','Gumbel','location','southeast');
title('Comparison for different distributions');
set(gca,'linewidth',1.5);
%% ====================Flood design============================
T = [10, 50, 100, 200, 500];
P = 1 - 1./T;
Design_flood = icdf('gev', P, Pgev(1), Pgev(2), Pgev(3));
% PRINT the design floods using the results of GEV distribution 
Design_flood_out(:,1)=T; Design_flood_out(:,2)= Design_flood;
display ('Design floods using GEV model are:'); display(Design_flood_out);

