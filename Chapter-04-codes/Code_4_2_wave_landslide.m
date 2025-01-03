% Matlab code for making animations of wave 
% propagation due to a tsunami in a semi-infinite 1D sea 
clear; close all;
set(0,'DefaultAxesFontsize',20);
%
time=20; % total animation time - in seconds   
L=200; % length of the sea - in meters
L0=10; % initial length of sea surface uplift - in meters
d = 10; % water depth - in meters
H0= 2; % initial height of sea surface uplift - in meters
C=sqrt(d.*9.81); % in m/s - wave celerity 
dt=0.1; % time step - in seconds 
dx=0.1; % spatial step - in meters
%
k=1; m=1;
for t=0:dt:time
    for x=0:dx:L
        lam=0.0000000001:0.01:10;
        cof=2.*H0.*sin(L0.*lam)./(pi.*lam);
        u=cof.*cos(lam.*x).*cos(C.*lam.*t);
        etta(m,k)=trapz(lam,u);     
        k=k+1;
    end
%
clf;
subplot(2,1,1);
plot(0:dx:L,etta(m,:),'b','LineWidth',1.5);
xlabel('x (m)'); ylabel('etta (m)');
xlim([0 L]); ylim([-2 3]);
set(gca,'linewidth',1.5);
%
str = sprintf('%3.1f',t);
text(100,2.5,str,'FontSize',20);
text(110,2.5,'s','FontSize',20);
%
drawnow; refreshdata;
%
k=1; m=m+1;
end
% End of the code %
