clc;clear all;close all;set(0,'defaultaxesfontsize',16);
% to run the code, please import the data file named 
% as "Chapter-5.2-Data.txt" and put it in the same folder
% also Functions "RMSE.m” and “NSE.m” should be in the same folder
rawdata = load('Chapter-5.2-Data.txt');
% colnames = Year,Month,Day,Precpitation,Streamflow,Potential Evaporation
RawP = rawdata(:,4);RawQ = rawdata(:,5);RawPet = rawdata(:,6);
n = length(RawP);
% Define inputs & outputs: Q(t)=f(Q(t-1),P(t), P(t-1), Pet(t), Pet(t-1))
Pt = RawP(2:n);  Pt_1 = RawP(1:n-1);
Qt_1 = RawQ(1:n-1);   Pett = RawPet(2:n);
Pett_1=RawPet(1:n-1);
%Establish the input matrix
InputMatrix = [Qt_1,Pt,Pt_1,Pett,Pett_1];
% Output variable Qt
Qt = RawQ(2:n);
%%% Model Training Define the training datasets
nTrain = 200;
InputMatrix_Train = InputMatrix(1:nTrain,:);
Qt_Train = Qt(1:nTrain);
 %---------------------Train ANN -------------------------------------
inputs = InputMatrix_Train';
targets = Qt_Train';
net = newff(inputs,targets,10); % 10 is nodes/neurons in the hidden layer;
net.trainParam.lr=0.05; % set the learning rate
net.trainParam.epochs=5000; % maximum training iteration
net.trainParam.goal=1e-5; % the learning goal or the loss to be achieved. 
% This means the training process will stop when loss is less than 1e-5
[net,tr]=train(net,InputMatrix_Train',Qt_Train'); % training neural network
y2 = sim(net, InputMatrix_Train'); % get prediction after training process
NSEtrain = NSE(Qt_Train, y2);  RMSEtrain = RMSE(Qt_Train, y2)
figure; subplot(2,1,1)
%comparison between prediction and observation
plot(Qt_Train,'ko','markersize',5,'linewidth',1.0);hold on;
plot(y2,'b-','linewidth',1.5);ylim([0 230]);
legend('Observation','Prediction'); title('(a) Model Training');
set(gca,'linewidth',1.5); xlabel('Day');ylabel('Streamflow (m^3/s)');
%%% Testing Process, Validate the model by the Testing datasets
InputMatrix_Test = InputMatrix((nTrain+1):(n-1),:);
Qt_Test = Qt((nTrain+1):(n-1));
ytest = sim(net, InputMatrix_Test'); % get prediction for testing process
NSEtest = NSE(Qt_Test, ytest);  RMSEtest = RMSE(Qt_Test, ytest);
subplot(2,1,2); plot(Qt_Test,'ko','markersize',5,'linewidth',1.0);
hold on; plot(ytest,'b-','linewidth',1.5);
set(gca,'linewidth',1.5);ylim([0 270]);
legend('Observation','Prediction'); title('(b) Model Testing');
xlabel('Day');ylabel('Streamflow (m^3/s)');

