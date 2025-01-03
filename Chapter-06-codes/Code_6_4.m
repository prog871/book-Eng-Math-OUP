
clc; clear all;
% coefficients of the objective function
f = [2; 4; 9; 3; 1; 3; 2];
 % Coefficients for equal constraints
%  F1-F2, F1-DC, F1-W1, F2-DC, DC-W2, W1-W2, W2-W1
Aeq = [1        1         1              0            0         0          0; ...
           -1       0         0              1            0         0          0; ...
           0        -1        0              -1           1         0          0; ...
           0        0         -1             0            0         1          -1;...
           0        0          0             0             -1       -1          1];
%Right-hand side for equal constraints
beq = [50; 40; 0; -30; -60];
 % Coefficients for inquality constraints
%  F1-F2, F1-DC, F1-W1, F2-DC, DC-W2, W1-W2, W2-W1
A = [1          0           0          0           0            0           0; ...
       0          0           0          0           1            0            0];
%Right-hand side for inequality constraints
 b = [10; 80];   
 % define the lower bound of decision variables
lb = [0; 0; 0; 0; 0; 0; 0];
 
% solve the linear programming
[x, fval, exitflag, output] = linprog(f, A, b, Aeq, beq, lb, []);
 
% show the results
disp('optimal solutions:');
disp(x);
disp('optimal objective values:');
disp(fval); 
