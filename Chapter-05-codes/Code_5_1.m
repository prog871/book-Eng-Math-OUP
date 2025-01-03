clc; clear all; close all; 
set(0,'defaultaxesfontsize', 16);
% to run the code, please firstly import the data file 
% names as "Chapter-5.2-Data.txt"
rawdata = load('Chapter-5.2-Data.txt');
% colnames = Year,Month,Day,Precpitation,Streamflow,Pontential
% Evaporation
RawP = rawdata(:,4);
RawQ = rawdata(:,5);
RawPet = rawdata(:,6);
n = length(RawP);
figure; subplot(3,1,1)
plot(RawP,'k-','linewidth',1.25); ylim([0 25]);
xlabel('Day'); ylabel('Rainfall (mm/d)')
title('(a) Rainfall'); set(gca,'linewidth', 1.5);
%---------------------------------------
subplot(3,1,2)
plot(RawPet,'b--','linewidth',1.25); 
xlabel('Day'); ylabel('PET (mm/d)'); set(gca,'linewidth', 1.5);
title('(b) Potential Evapotranspiration'); ylim([0 3]); 
%-----------------------------------------
subplot(3,1,3); 
plot(RawQ,'mo','markersize',5,'linewidth',1.25)
xlabel('Day'); ylabel('Streamflow (m^3/s)')
title('(c) Streamflow'); set(gca,'linewidth', 1.5);
ylim([0 300]);
%%===================Correlation Matrix=================
Pt = RawP(2:n);
Pt_1 = RawP(1:n-1);
Qt_1 = RawQ(1:n-1);
Pett = RawPet(2:n);
Pett_1=RawPet(1:n-1);
%Establish the input matrix
InputMatrix = [Qt_1,Pt,Pt_1,Pett,Pett_1];
% Output variable Qt
Qt = RawQ(2:n);
AllDataSets = [InputMatrix, Qt];
coefmatrix = corrcoef(AllDataSets);
display('Correlation Coefficients are:');display(coefmatrix);
