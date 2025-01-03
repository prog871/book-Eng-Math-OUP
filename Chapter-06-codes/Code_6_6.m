clc; clear all; close all; 
set(0,'defaultaxesfontsize',17);
%  load the traffic flow data from supplementary materials
[NumData,TxtData,CellData] = xlsread('LSTM-traffic-flow-data.xlsx ');
% assigen data to different observation variables
TotalTrafficFlow = NumData(:,3);
Nsam = length(TotalTrafficFlow);
% using the past 5 time steps to predict current traffic flow rate
X_All(:,1) = TotalTrafficFlow(1:(Nsam-5));
X_All(:,2) = TotalTrafficFlow(2:(Nsam-4));
X_All(:,3) = TotalTrafficFlow(3:(Nsam-3));
X_All(:,4) = TotalTrafficFlow(4:(Nsam-2));
X_All(:,5) = TotalTrafficFlow(5:(Nsam-1));
Y_All =  TotalTrafficFlow(6:Nsam);
%
ntraining = floor(length(Y_All)*0.7)
Xmatrix_train = X_All(1:ntraining,:);
Yt_training = Y_All(1:ntraining);
Xmatrix_test = X_All((ntraining+1):2875,:);
Yt_test = Y_All((ntraining+1):2875);
inputs = Xmatrix_train';
targets = Yt_training';
% standardization
[XTrain, PSx] = mapminmax(inputs);
[YTrain, PSy] = mapminmax(targets);
%XTrain = inputs;
%YTrain = targets;
XTest = mapminmax('apply', Xmatrix_test', PSx);
% --------------LSTM model ----------
%  this part should be run in the lastest version of matlab
numFeatures = size(Xmatrix_train, 2);
% LSTM units in the hidden layer h(t)
numHiddenUnits = 10;
% dimension of output yt
numResponses = 1;
% setting regressionLayer
layers = [sequenceInputLayer(numFeatures)
          lstmLayer(numHiddenUnits)
          fullyConnectedLayer(numResponses)
          regressionLayer];
miniBatchSize = 64;
options = trainingOptions('adam', 'ExecutionEnvironment', 'cpu', 'MaxEpochs',...
    1000, 'MiniBatchSize', miniBatchSize, 'GradientThreshold', 1,...
    'InitialLearnRate', 0.01, 'LearnRateSchedule', 'piecewise', ...
  'LearnRateDropPeriod', 250, 'LearnRateDropFactor', 0.2,  'Verbose',...
  false,  'Plots', 'training-progress');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% PAGE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% training
net = trainNetwork(XTrain, YTrain, layers, options);
% prediction in training
yTrain_pre = predict(net, XTrain, 'MiniBatchSize', miniBatchSize,...
    'SequenceLength', 'longest');
% inverse from standardization
yTrain_pre = mapminmax('reverse', yTrain_pre, PSy);
yTrain_pre = yTrain_pre';
filename = 'output_training.txt';
delimiter = '\t';  % You can change the delimiter as needed
% Write data to the file
dlmwrite(filename, yTrain_pre, 'delimiter', delimiter);
% ---------------Testing -------------
yTtest_pre = predict(net, XTest, 'MiniBatchSize', miniBatchSize,...
    'SequenceLength', 'longest');
% reverse from standardization
yTtest_pre = mapminmax('reverse', yTtest_pre, PSy);
yTtest_pre = yTtest_pre';
filename = 'output_testing.txt';
delimiter = '\t';  % You can change the delimiter as needed
% Write data to the file
dlmwrite(filename, yTtest_pre, 'delimiter', delimiter);
% plot comparison %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
subplot(2,1,1)
days = 1:length(Yt_training);
plot(days,yTrain_pre,'b-','linewidth',1.5)
hold on
plot(days,Yt_training,'ko','markersize',4,'linewidth',0.8)
xlabel('Time step'); title('(a) Training')
xlim([0,2100]); set(gca,'linewidth', 1.5);
ylabel('Traffic flow'); legend('LSTM prediction','Observation')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,1,2)
days2 = 1:length(Yt_test);
plot(days2,yTtest_pre,'b-','linewidth',1.5)
hold on
plot(days2,Yt_test,'ko','markersize',4,'linewidth',0.8)
xlabel('Time step')
ylabel('Traffic flow')
legend('LSTM prediction','Observation')
title('(b) Testing')
% setup fontSize
set(gca, 'FontName', 'Arial'); set(gca,'linewidth', 1.5);
%save the plot
saveas(gcf, 'myfigure.jpg');

