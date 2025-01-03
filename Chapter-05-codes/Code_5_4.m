clc;clear all;close all;set(0,'defaultaxesfontsize',16);
% to run the code, please firstly import the data file 
% named as "Chapter-5.2-Data.txt" and put it in the same folder
% also Functions "RMSE.m” and “NSE.m” should be in the same folder
rawdata = load('Chapter-5.2-Data.txt');
% colnames = Year, Month,Day,Precipitation,Streamflow,Potential Evaporation
RawP = rawdata(:,4);  RawQ = rawdata(:,5); RawPet = rawdata(:,6);
n = length(RawP);
% Define inputs and outputs Q(t) = f(Q(t-1),P(t), P(t-1), Pet(t), Pet(t-1))
Pt = RawP(2:n);  Pt_1 = RawP(1:n-1);
Qt_1 = RawQ(1:n-1);  Pett = RawPet(2:n);
Pett_1=RawPet(1:n-1);
%Establish the input matrix
InputMatrix = [Qt_1,Pt,Pt_1,Pett,Pett_1];
% Output variable Qt
Qt = RawQ(2:n);
%%% Model Training
% Define the training datasets
nTrain = 200
InputMatrix_Train = [ones(nTrain,1),InputMatrix(1:nTrain,:)];
Qt_Train = Qt(1:nTrain);
%---------------------Train multivariate linear regression model ------
[b,bint,r,rint,stats] = regress(Qt_Train,InputMatrix_Train);
% b is the parameters in the regression model;
y2 = InputMatrix_Train*b; % get the prediction after training process
NSEtrain = NSE(Qt_Train, y2);  RMSEtrain = RMSE(Qt_Train, y2)
figure; subplot(2,1,1) %comparison between prediction and observation
plot(Qt_Train,'ko','linewidth',1.0,'markersize',5);
hold on; plot(y2,'b-','linewidth',1.5);
legend('Observation','Prediction');ylim([0 230]);
title('(a) Model Training');set(gca,'linewidth',1.5);
xlabel('Day');ylabel('Streamflow (m^3/s)');
%%% Testing Process % Validate the model by the Testing datasets
[nrow_test, ncol_test] = size(InputMatrix((nTrain+1):(n-1),:));
InputMatrix_Test = [ones(nrow_test,1),InputMatrix((nTrain+1):(n-1),:)];
Qt_Test = Qt((nTrain+1):(n-1));
ytest =  InputMatrix_Test*b; % get the prediction for testing process
NSEtest = NSE(Qt_Test, ytest); RMSEtest = RMSE(Qt_Test, ytest);
subplot(2,1,2);
plot(Qt_Test,'ko','linewidth',1.0,'markersize',5);
hold on;plot(ytest,'b-','linewidth',1.5);legend('Observation','Prediction');
title('(b) Model Testing');set(gca,'linewidth',1.5);
xlabel('Day');ylabel('Streamflow (m^3/s)');

