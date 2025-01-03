
clc; clear all; close all; 
 %city 1 2 3 4 5 6 7 8
now=[0,2,4,4,0,0,0,0
         0,0,0,0,6,0,0,0
         0,0,0,1,5,7,0,0
         0,0,0,0,0,5,0,11
         0,0,0,0,0,1,2,5
         0,0,0,0,0,0,3,4
         0 0 0 0 0 0 0 2];
     now(now==0)=inf;
     BestRouteID = zeros(7,8);
    V = zeros(1,8); 
    for h = 7:-1:1
        allRoutes = find(now(h,:)~=inf);
        [V(h),minIndex] = min(now(h,allRoutes)+V(allRoutes));
        BestRouteID(h,allRoutes(minIndex)) = 1;
        % show the shortest pat
    end
    
    % show the shortest path
    h = 1;
    while(h < 8)
   %for h = 1:7
       cityID = find(BestRouteID(h,:) == 1);
       disp(['shortest path is from City ' num2str(h) ' to City ' num2str(cityID)]);
       h = cityID;
   end
