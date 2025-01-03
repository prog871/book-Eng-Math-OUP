%%% MATLAB code for calculating the Fourier Transform
%%% Incident oceanic wave is: eta(t)=sin(2*pi/7 t) + sin(2*pi/13 t)
clc; close all; clear;
set(0,'DefaultAxesFontsize', 16);
% Calculating Fourier Transform
k=1;
for f=0.0001:0.001:0.25
    lam=-80:0.001:80;
    eta=sin((2.*pi./7).*lam) + sin((2.*pi./13).*lam);
    y1=eta.*exp(-1i.*2.*pi.*f.*lam);
    z(k)=trapz(lam,y1);  % for integration 
    %
    k=k+1;
end
%
% plotting the incident wave
t=0:0.01:50;
eta=sin((2.*pi./7).*t) + sin((2.*pi./13).*t);
%
figure(1);
subplot('position',[0.1 0.3 0.3 0.43]);
plot(t,eta,'b','linewidth',1.5);
set(gca,'xlim',[0 50],'ylim',[-2.8 2.8]);
set(gca,'linewidth',1.5); grid on;
%
% plotting the Fourier Transform
f=0.0001:0.001:0.25;
subplot('position',[0.48 0.3 0.3 0.43]);
plot(f,z.*conj(z),'b','linewidth',1.5);
set(gca,'xlim',[0.001 0.25],'ylim',[0 9000]);
set(gca,'linewidth',1.5); grid on;
%
%%% End of the code %%%