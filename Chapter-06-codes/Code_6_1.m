clc; clear all; close all; 
set(0,'defaultaxesfontsize',18);
% create the time intervals
t1 = 0:0.1:20; %  t <= 20 
t2 = 20:0.1:70; % for t > 20 
t = 0:0.1:70;
%  vehicle arrival
R1 = 8 * t1;  % for t <= 20
R2 = 160 + 2 * (t2 - 20);% for t >20
% vehicle departure
D = 4*t;
% arrival 
figure; subplot(2,1,1); 
plot(t1, R1, 'b-', 'LineWidth', 2); % arrival vehicles t <= 20 
hold on; 
plot(t, D, 'r--', 'LineWidth', 2);% departure vehicles for t >20
hold on;
plot(t2, R2, 'b-', 'LineWidth', 2); % arrival vehicles for t >20
%
xlabel('Time (min)');
ylabel('Number of vehicles');
title('(a) Queueing diagram for example 6.1');
legend('Arrival vehicles','Departure vehicles','Location', 'southeast');
grid on; hold off; set(gca,'linewidth', 1.5);
%%%% =============Queue length ===========
Dqs1 = 4*t1; % for t <= 20;
Dq1 = Dqs1 - 1;
Dqs2 = 160-2*t2 - 40;
Dq2 = Dqs2 - 1;
subplot(2,1,2)
plot(t1, Dqs1, 'b-', 'LineWidth', 2); % vehicles in queue system  
hold on; 
plot(t1, Dq1, 'r--', 'LineWidth', 2);% queue length
hold on;
plot(t2, Dqs2, 'b-', 'LineWidth', 2); % vehicles in queue system 
hold on
plot(t2, Dqs2, 'r--', 'LineWidth', 2); % vehicles in queue system
xlabel('Time (min)');
ylabel('Number of vehicles');
title('(b) System and queueing length for example 6.1');
legend('Vehicles in queue system','Queue length');
grid on; hold off; set(gca,'linewidth', 1.5);
