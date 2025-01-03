
clc; clear all; 
% Initialize parameters
lambda = 3; % Arrival rate of 3 vehicles per minute
mu = 4;    % Service rate of 4 vehicles per minute
% Calculate utilization, average number of vehicles, and average time in system
rho = lambda / mu;
Ls = lambda / (mu - lambda);
Lq = lambda^2/(mu*(mu-lambda));
Ws = 1 / (mu - lambda);
Wq = lambda/(mu*(mu-lambda));
% print the obtained results
fprintf('Utilization (rho): %0.2f\n', rho);
fprintf('Average Number of Vehicles in System (Ls): %0.2f\n', Ls);
fprintf('Average Number of Vehicles in Queue (Lq): %0.2f\n', Lq);
fprintf('Average Time a Vehicle Spends in System (W): %0.2f minutes\n', Ws);
fprintf('Average Time a Vehicle Spends in Queue (W): %0.2f minutes\n', Wq);
