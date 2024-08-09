function [GNSS_data_gap_for_selected_period]=GNSS_data_gap(GNSS_insitu_data_time,GNSS_time_selected)
%***********************************************************************************************%
% Copyright (c) 2024-2099 by Gravity and Cryosphere Lab @ SUSTecch, all rights reserved.
% Author: Jiangjun Ran
% E-mail: ranjj@sustech.edu.cn
%***********************************************************************************************%
    %% find the data gap of GNSS data.
    GNSS_data_gap_for_selected_period(1:length(GNSS_time_selected(:,1)),1)=1e10;
    for n=1:length(GNSS_time_selected(:,1))
        for k=1:length(GNSS_insitu_data_time(:,1))
            if abs(GNSS_insitu_data_time(k,1)-GNSS_time_selected(n,1))<=1.0/365.25
                GNSS_data_gap_for_selected_period(n,1)=1.0;
            end
        end
    end
end