% Matlab code for making animations of wave 
% propagation due to a volcanic tsunami in an enclosed 1D sea
% with length of 1000 m. Initial sea surface is like a triangle with 
% height of 1 m and base of 50 m, located in the midddle of sdea.  
clear; close all; clc;
set(0,'DefaultAxesFontsize',15);
%
d = 10; % water depth - in meters
C=sqrt(9.81.*d); % water celerity - in m/s
%
k=1; m=1;
for t=0:0.5:200
%t=100;
for x=0:0.5:1000
    s=0.0;
    for n=1:500
      cof=(80./(n.*pi).^2).*(2.*cos(n.*pi./2)-cos(19.*n.*pi./40)-...
           cos(21.*n.*pi./40));
      s=s+(cof).*cos(n.*pi.*x./1000).*cos(n.*pi.*t.*C./1000);
    end
    f(m,k)=s+25./1000;
    k=k+1;
end
%
clf;
subplot(2,1,1);
plot(0:0.5:1000,f(m,:),'b','LineWidth',1.5);
xlabel('Distance (m)'); ylabel('Wave amplitude (m)');
xlim([0 1000]); ylim([-0.5 1.5]);
set(gca,'XTick',[0:100:1000]);
set(gca,'linewidth',1.5);
%
text(120,1.0,'t =','FontSize',18);
str = sprintf('%3.1f', t);
text(150,1.0,str,'FontSize',18);
text(200,1.0,'s','FontSize',18);
%
drawnow; refreshdata; 
k=1; m=m+1;
end
% End of the code %
