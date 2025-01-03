% MATLAB code for modelling wave runup on a sloping beach
clear; close all; set(0,'DefaultAxesFontsize',15);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
lc=1000; % length of the channel 
dx=10; % grid spacing
dt=0.25; % time increment-should be < dx/sqrt(g Hmax)
g=9.81; % acceleration due to gravity (9.81 m/s^2)
hmin=0.05; % minimum water height for a wet cell
t0=0.0; % start time of simulations
tend=5.*60; % final time of simulations in seconds
n=tend./dt; % total time steps
nx=103; % number of grid pints in x direction plus 2 for BCs
x0=1; % start of x axis for plotting the results
xend=103; % end of x axis for plotting the results
y0=-20; % start of y axis for plotting the results
yend=10; % end of y axis for plotting the results
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bathymetry
for k=2:52
    x=(k-2).*dx;
    h0(k)=15;
end 
for k=52:102
    x=(k-2).*dx;
    h0(k)=15-((2./50).*(x-500));
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Boundary and Initial conditions
h0(1)=-20.0; % boundary = wall
h0(nx)=-20.0; % boundary = wall
eta(1:nx)=0.0; % at first the wave height field is zero
etan(1:nx)=0.0; % new water surface
for k=1:nx 
    if(h0(k)<0.0), eta(k)=-1.*h0(k); end 
    etan(k)=eta(k);
end
for k=1:nx
  h(k)=h0(k)+eta(k); % total water depth- (for dry land this is zero)
  wet(k)=1; % at first all grid are assummed to be wet
  if (h(k)<hmin),wet(k)=0, end; % cell is dry if total water level < hmin 
  u(k)=0.0; % at first the velocity field is zero
  un(k)=0.0; % new velocity field is also zero
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% initial condition for tsunami
eta(2:7)=4.0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  SIMULATION 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for it=1:n  % it is time incremnt- n is the number of time steps
% updating velocity in each time step (un)
  for k = 2:nx-1
      pgradx = -g*(eta(k+1)-eta(k))/dx;
      un(k) = 0.0;
      if(wet(k)==1)
           if(or(wet(k+1)==1,pgradx>0)), un(k) = u(k)+dt*pgradx,end
      else
           if(and(wet(k+1)==1,pgradx<0)), un(k) = u(k)+dt*pgradx,end
      end
  end
  % end of updating velocity field
  % updating wave hight field (etan)
  for k=2:nx-1
       hpe=0.5.*(un(k)+abs(un(k))).*h(k);
       hne=0.5.*(un(k)-abs(un(k))).*h(k+1);
       hue=hpe+hne;
       hpw=0.5.*(un(k-1)+abs(un(k-1))).*h(k-1);
       hnw=0.5.*(un(k-1)-abs(un(k-1))).*h(k);
       huw=hpw+hnw;
  etan(k)=eta(k)-dt.*(hue-huw)./dx;
  end
  % end of updating wave height field
  eta=etan;
  % updating variables for next iteration step
  for k=1:nx
      h(k)=h0(k)+eta(k);
      wet(k)=1;
      if(h(k)<hmin), wet(k)=0;end
      u(k)=un(k);     
   end
   % end of updating variables
   % making animations
   time=it.*dt;
   subplot('position',[0.15 0.5 0.6 0.3]);
   plot(eta(1:nx),'b','Linewidth',2.0); hold on;
   plot(-h0(:),'k','LineWidth',3.0);
   %
   set(gca,'Xlim',[x0+1 xend-1]); set(gca,'Ylim',[y0 yend]);
   set(gca,'Ytick',[y0:5:yend]); set(gca,'Xtick',[x0+1:10.0:xend-1]);
   xlabels=[0 100 200 300 400 500 600 700 800 900 1000];
   set(gca,'Xticklabel',xlabels); xlabel('Distance (m)');
   ylabel('Wave amplitude (m)');
   %
   line([x0 xend],[0 0],'color',[0 0 0],'LineStyle','--');
   str = sprintf('%3.1f', time);
   text(30,-10,'Time =','FontSize',15); text(37,-10,str,'FontSize',15);
   text(42.5,-10,'s','FontSize',15); set(gca,'linewidth',1.5);   
   %      
   refreshdata; drawnow; clf
   % end of animations 
end
toc
% End of the code %