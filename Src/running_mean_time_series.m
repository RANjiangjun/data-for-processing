function [time_running_mean_order, running_mean_time_series_after_running_mean_order]=running_mean_time_series(running_mean_oder,time,time_series)
%***********************************************************************************************%
% Copyright (c) 2024-2099 by Gravity and Cryosphere Lab @ SUSTecch, all rights reserved.
% Author: Jiangjun Ran
% E-mail: ranjj@sustech.edu.cn
%***********************************************************************************************%
%% running mean of GNET time-series
counter=1;
for k=floor(running_mean_oder/2)+1:length(time_series)-floor(running_mean_oder/2)
    time_running_mean_order(counter,1)=time(k);
    %% replace outliers (> 3 sigma) by the mean
    time_series_interval=time_series(k-floor(running_mean_oder/2):k+floor(running_mean_oder/2));
    outlier_removal=time_series_interval;
    for n=length(time_series_interval)
        if (time_series_interval(n)-mean(time_series_interval))>= 3*std(time_series_interval)
            outlier_removal(n)=mean(outlier_removal);
        end
    end
    %% running mean time-series
    running_mean_time_series_after_running_mean_order(counter,1)=mean(outlier_removal);
    clearvars outlier_removal time_series_interval;
    counter=counter+1;
end
% figure
% plot(time,time_series,'c')
% hold on
% plot(time_running_mean_order,running_mean_time_series_after_running_mean_order,'r')
% legend('In situ GPS',['Running mean ' num2str(running_mean_oder) ' epoch'],'Location','Best')
% xlabel('Year')
% ylabel('Running mean of uplift (mm)')
% set(gca,'FontSize',12)
% grid on
end