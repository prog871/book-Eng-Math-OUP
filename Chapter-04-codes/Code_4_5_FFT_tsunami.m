%%% MATLAB code to calculate Fourier Transform
%%% using FFT (fast Fourier Transform) algorithm 
% Input wave is the 2018 Palu tsunami, ndonesia
clc; clear; close all;
set(0,'DefaultAxesFontsize',16); % fontsize
y=load('Chapter-4-input-Palu.txt'); % read input file 
% input time srries is in two columns; time and amplitudes
dt=60; % time interval of input file in seconds
nx=length(y(:,2)); % number of input values
z=fft(y(:,2)); % applyng FFT algotithm 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the time series
figure (1)
subplot('position',[0.1 0.3 0.3 0.4]);
plot(y(:,1),y(:,2),'b','LineWidth',1.5); 
xlabel('Time (min)');      % label on the X axis
ylabel('Sea level (cm)');  % label on the Y axis
set(gca,'ylim',[-250 250]);
set(gca,'xlim',[0 100]);
set(gca,'linewidth',1.5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot the Fourier Transform 
subplot('position',[0.48 0.3 0.3 0.4]);
semilogx((1:nx/2)./(dt.*nx),z(1:nx/2).*conj(z(1:nx/2))/nx,...
    'b','LineWidth',1.5);
xlabel('Frequency (Hz)');
ylabel('Spectral energy');
set(gca,'xlim',[10^(-4)*7 10^(-1)]);
set(gca,'XTick',[10^(-3) 10^(-2) 10^(-1)]);
set(gca,'ylim',[0 13000]);
set(gca,'linewidth',1.5);
%%% End of the code %%%