function [rearranged_time_series_mean_2002_2012]=mean_mass_per_calendar_month(time,year_start,year_end,data,GPS_site_name)
%***********************************************************************************************%
% Copyright (c) 2024-2099 by Gravity and Cryosphere Lab @ SUSTecch, all rights reserved.
% Author: Jiangjun Ran
% E-mail: ranjj@sustech.edu.cn
%***********************************************************************************************%
    %% mean mass per calendar month
    [rearrange_seasonal_mass_variation_year_13_months]=rearrange_time_series_to_seasonal_mass_variation(time(:,1),year_start,year_end,data(:,1),year_start,year_end);
    rearranged_time_series_mean_2002_2012(1:13)=0.0;
    [rearranged_time_series_mean_2002_2012,bias_least_square_adjustment]=mean_pavel_least_square_adjustment(13,year_end-year_start+1,rearrange_seasonal_mass_variation_year_13_months);
    for n=1:year_end-year_start+1
        rearranged_time_series_2002_2012(n,1:13)=rearrange_seasonal_mass_variation_year_13_months(n,1:13)-bias_least_square_adjustment(n);
    end
    
%     figure
legendShow(1).t = 'Mean';
for n = 1 : year_end-year_start+1
     str = [num2str(n+year_start-1)];
     legendShow(n+1).t = str;
end
    xtick_required_sequence=[12 1 2 3 4 5 6 7 8 9 10 11 12];
    xtick=[1:1:13];
    xticklabel=[12 1 2 3 4 5 6 7 8 9 10 11 12];
    plot([1:1:13],rearranged_time_series_mean_2002_2012(1,1:13),'r-v','LineWidth',3.0) % 2002
    set(gca,'xtick',xtick);
    set(gca,'xticklabel',xticklabel);
    hold on
    for n=1:length(rearranged_time_series_2002_2012(:,1))
        plot([1:1:13],rearranged_time_series_2002_2012(n,1:13)) % 2002
    end
    xlim([1, 13]);
    set(gca,'FontSize',12)
    xlabel('Month')
    ylabel('U (mm)')
legend(legendShow(1:year_end-year_start+2).t);
    title(GPS_site_name)
    grid on
    %         file_in = [GPS_site_name 'GNSS_atm_ntol_GLDAS mean per calendar month'.fig'];
    %         saveas(gcf,file_in,'fig')
    %         file_in = [GPS_site_name 'GNSS_atm_ntol_GLDAS mean per calendar month' '.pdf'];
    %         saveas(gcf,file_in,'pdf')
%     file_in = [GPS_site_name 'GRACE mean per calendar month' '.png'];
%     saveas(gcf,file_in,'png')
%     close all
end