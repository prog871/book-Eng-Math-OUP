clc; clear all; close all; 
set(0,'defaultaxesfontsize',18);
Total_time = 60; % minutes, simulation time
N=10000000000; %,maximum vehicles in the queue
lambda=3, mu=4; %arrival and service rate
arr_mean = 1/lambda; %average arrival time 
ser_mean = 1/mu; % average service time
arr_num =  Total_time*lambda*2; %The number of arrival vehicles 
events = []; 
events(1,:)=exprnd(arr_mean,1,arr_num); %generate interarrival times 
events(1,:)=cumsum(events(1,:)); %Arrival time of each car=sum interarrival times; 
events(2,:)=exprnd(ser_mean,1,arr_num); %generate service times for vehicles 
len_sim = sum(events(1,:)<= Total_time); %total cars arrived in simulation time;  
%-------------information for the first vehicle ------------
events(3,1) = 0; % first vehicle is served directly without any waiting  
events(4,1)=events(1,1)+events(2,1); %Departure time=sum arrival & service time; 
%first car is accepted, and only 1 car in the system. Assign 1 for 1 vehicle
events(5,1) = 1; 
member = [1]; %1st vehicle enter the system, 1 member in the system 
for i = 2:arr_num 
    if events(1,i)>Total_time % break the loop if arrival time > simulation time
        break; 
    else
        number = sum(events(4,member) > events(1,i));
        %if the system is full, the system would reject service and assign 0
        if number >= N+1 
            events(5,i) = 0; 
        else
            if number == 0  % if system is empty, no waiting time
               events(3,i) = 0; 
                %departure time = arrival time + service time 
                events(4,i) = events(1,i)+events(2,i); 
                %assign 1 at its position 
                events(5,i) = 1; 
                member = [member,i]; 
                % if system have vehicles but is not full, vehicle i enters 
         else
                len_mem = length(member);
% waiting time=departure time of preceding customer minus its arrival time 
                events(3,i)=events(4,member(len_mem))-events(1,i); 
%departure time is equal to departure time of preceding customer + service time
                events(4,i)=events(4,member(len_mem))+events(2,i); 
   %indicates the total number of customers in the system after it enters
                events(5,i) = number+1; 
                member = [member,i]; 
            end
        end
    end
end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% PAGE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
len_mem = length(member); % total vehicles entered in the simulation period
% Ploat the results
figure
subplot(2,1,1)
stairs([0 events(1,member)],0:len_mem,'b','linewidth',1.5); 
hold on; 
stairs([0 events(4,member)],0:len_mem,'r--','linewidth',1.5); 
legend('Arrival time ','Departure time','Location', 'southeast'); 
xlabel('Time (min)');
ylabel('Number of vehicles');
title('(a) Arrival and departure time in M/M/1');
hold off; grid on; set(gca,'linewidth', 1.5);
%figure;
subplot(2,1,2)
plot(1:len_mem,events(3,member),'r-*',...
1: len_mem,events(2,member)+events(3,member),'b-', 'linewidth', 1.5); 
legend('Waiting time in queure ','Waiting time in system '); 
xlabel('Number of vehicles'); ylabel('Time (min)');
title('(b) Waiting time in queue and system in M/M/1');
grid on; set(gca,'linewidth', 1.5);
