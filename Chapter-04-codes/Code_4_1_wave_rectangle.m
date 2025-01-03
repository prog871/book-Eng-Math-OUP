% Matlab code for making animations of wave 
% propagation due to a tsunami in a 1D sea 
clear; close all;
set(0, 'Defaultaxesfontsize', 15);
%
L=100; % in meter- length of the sea
time=100; % in seconds- total simulation time
H0=3; % in meters- initia earthquake uplift
g=9.81; % in m/s^2- gravitational acceleration
d=10; % in meter- sea depth
C=(g.*d).^0.5; % long wave celerity 
N=400; % number of fourier terms
dt=0.1; % in seconds- time interval
dx= 0.01; % in meter- space interval
%
k=1; m=1;
for t=0:dt:time
    for x=0:dx:L
        s=0.0;
        for nx=1:N
          zar=2.*H0.*(sin(21.*nx.*pi./40)-...
              sin(19.*nx.*pi./40))./(nx.*pi);
          s=s+zar.*cos(nx.*pi.*x./L).*cos(nx.*pi.*t.*C./L);
        end
        etta(k,m)=H0./20+s;
        k=k+1;     
    end
    plot(0:dx:L,etta(:,m),'b', 'linewidth',1.5);
    xlim([-1 L+1]);
    ylim([-1.25.*H0 1.25.*H0]);
    line([50 50],[-1.25.*H0 1.25.*H0],'color',[0 0 0]);
    set(gca, 'linewidth', 1.5);
    %
    refreshdata; drawnow
    k=1; m=m+1;
end
% End of the code %
