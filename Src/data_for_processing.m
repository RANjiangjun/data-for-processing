%=====================================Main program==============================================%
%***********************************************************************************************%
% Function: Prepare the data for estimating melt water storage
% Copyright (c) 2024-2099 by Gravity and Cryosphere Lab @ SUSTecch, all rights reserved.

% Author: Jiangjun Ran
% E-mail: ranjj@sustech.edu.cn
%***********************************************************************************************%
%% ===============================================================================================
clear all
close all
clc

%% data for BWS estimation
GPS_site_name_pavel={'KAGA'};

for k=1:length(GPS_site_name_pavel)
    %% GPS NEU
    GPS_site_name=GPS_site_name_pavel{k};
    GPS_file_name=['Input/' GPS_site_name '_NEU.txt'];
    %% atm
    atm_file_name=['Input/' GPS_site_name '.atml'];
    %% ntol
    ntol_file_name=['Input/' GPS_site_name '.ntol'];
    %% SMB
    %% RACMO2.3p2
    SMB_RACMO_file_name=['Input/' GPS_site_name '_SMB.txt'];
    SMB_tundra_RACMO_file_name=['Input/' GPS_site_name '_SMB_Tundra_daily.txt'];
    precip_RACMO_file_name=['Input/' GPS_site_name '_PRECIP.txt'];
    runoff_RACMO_file_name=['Input/' GPS_site_name '_RUNOFF.txt'];
    melt_RACMO_file_name=['Input/' GPS_site_name '_MELT.txt'];
    snowfall_RACMO_file_name=['Input/' GPS_site_name '_SNOWFALL.txt'];
    subl_RACMO_file_name=['Input/' GPS_site_name '_SUBL.txt'];
    %% Terrestoral water storage
    GLDAS_file_name=['Input/' GPS_site_name '.gldas.v1.noice.defo'];
    %% Thermal elastic loading
    TEM_file_name=['Input/' GPS_site_name '_DISP_FEM.txt'];
    %% read data
    if exist(GPS_file_name, 'file') == 2
        % GPS
        GPS_time_series=[];
        [GPS_time_series(:,1),GPS_time_series(:,2),GPS_time_series(:,3),GPS_time_series(:,4),GPS_time_series(:,5),GPS_time_series(:,6),GPS_time_series(:,7)]=textread(GPS_file_name,'%f%f%f%f%f%f%f','headerlines',3);
        % atm from Tonnie
        [atm_time_series(:,1),atm_time_series(:,2),atm_time_series(:,3),atm_time_series(:,4)]=textread(atm_file_name,'%f%f%f%f','headerlines',2);
        % ntol
        [ntol_time_series(:,1),ntol_time_series(:,2),ntol_time_series(:,3),ntol_time_series(:,4)]=textread(ntol_file_name,'%f%f%f%f','headerlines',2);
        % SMB
        RACMO_SMB_time_series=[];
        RACMO_SMB_tundra_time_series=[];
        [RACMO_SMB_time_series(:,1),RACMO_SMB_time_series(:,2),RACMO_SMB_time_series(:,3),RACMO_SMB_time_series(:,4)]=textread(SMB_RACMO_file_name,'%f%f%f%f','headerlines',1);
        [RACMO_SMB_tundra_time_series(:,1),RACMO_SMB_tundra_time_series(:,2),RACMO_SMB_tundra_time_series(:,3),RACMO_SMB_tundra_time_series(:,4)]=textread(SMB_tundra_RACMO_file_name,'%f%f%f%f','headerlines',1);
        % SMB £¨Ice sheet and tundra)
        RACMO_SMB_time_series(:,2)=RACMO_SMB_time_series(:,2)+RACMO_SMB_tundra_time_series(:,2);
        RACMO_SMB_time_series(:,3)=RACMO_SMB_time_series(:,3)+RACMO_SMB_tundra_time_series(:,3);
        RACMO_SMB_time_series(:,4)=RACMO_SMB_time_series(:,4)+RACMO_SMB_tundra_time_series(:,4);
        [RACMO_precip_time_series(:,1),RACMO_precip_time_series(:,2),RACMO_precip_time_series(:,3),RACMO_precip_time_series(:,4)]=textread(precip_RACMO_file_name,'%f%f%f%f','headerlines',1);
        [RACMO_runoff_time_series(:,1),RACMO_runoff_time_series(:,2),RACMO_runoff_time_series(:,3),RACMO_runoff_time_series(:,4)]=textread(runoff_RACMO_file_name,'%f%f%f%f','headerlines',1);
        [RACMO_melt_time_series(:,1),RACMO_melt_time_series(:,2),RACMO_melt_time_series(:,3),RACMO_melt_time_series(:,4)]=textread(melt_RACMO_file_name,'%f%f%f%f','headerlines',1);
        [RACMO_snowfall_time_series(:,1),RACMO_snowfall_time_series(:,2),RACMO_snowfall_time_series(:,3),RACMO_snowfall_time_series(:,4)]=textread(snowfall_RACMO_file_name,'%f%f%f%f','headerlines',1);
        [RACMO_subl_time_series(:,1),RACMO_subl_time_series(:,2),RACMO_subl_time_series(:,3),RACMO_subl_time_series(:,4)]=textread(subl_RACMO_file_name,'%f%f%f%f','headerlines',1);
        % Terrestoral water storage
        [GLDAS_time_series(:,1),GLDAS_time_series(:,2),GLDAS_time_series(:,3),GLDAS_time_series(:,4),GLDAS_time_series(:,5),GLDAS_time_series(:,6)]=textread(GLDAS_file_name,'%f%f%f%f%f%f','headerlines',0);
        for n=1:length(GLDAS_time_series(:,1))
            GLDAS_time_series(n,7)=GLDAS_time_series(n,1)+(GLDAS_time_series(n,2)-0.5)/12; % PD: computation of time in years
        end
        % TEM
        [TEM_time_series(:,1),TEM_time_series(:,2)]=textread(TEM_file_name,'%f%f','headerlines',0);
        
        %% running mean of GNET time-series
        running_mean_order=1;
        [GNET_time_series_running_mean(:,1), GNET_time_series_running_mean(:,2)]=running_mean_time_series(running_mean_order,GPS_time_series(:,1),GPS_time_series(:,6));
        [atm_time_series_running_mean(:,1), atm_time_series_running_mean(:,2)]=running_mean_time_series(running_mean_order,atm_time_series(:,1),atm_time_series(:,4));
        [ntol_time_series_running_mean(:,1), ntol_time_series_running_mean(:,2)]=running_mean_time_series(running_mean_order,ntol_time_series(:,1),ntol_time_series(:,4));
        %[GLDAS_time_series_running_mean(:,1), GLDAS_time_series_running_mean(:,2)]=running_mean_time_series(running_mean_order,GLDAS_time_series(:,7),GLDAS_time_series(:,3));
        [TEM_time_series_running_mean(:,1), TEM_time_series_running_mean(:,2)]=running_mean_time_series(running_mean_order,TEM_time_series(:,1),TEM_time_series(:,2));
        
        %% select to a period (2009, 2015)
        year_start=2009;
        year_end=2015;
        [day_decimal_year]=daily_to_decimal_year(year_start,year_end);
        
        %% interpolation to time interval
        GNET_time_series_running_mean_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        GNET_time_series_running_mean_selected_period_interpolated(:,2)=interp1(GNET_time_series_running_mean(:,1), GNET_time_series_running_mean(:,2),day_decimal_year(:,1),'linear');
        % GNSS data gap
        [GNSS_data_gap_for_selected_period]=GNSS_data_gap(GNET_time_series_running_mean(:,1),GNET_time_series_running_mean_selected_period_interpolated(:,1));
        atm_time_series_running_mean_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        atm_time_series_running_mean_selected_period_interpolated(:,2)=interp1(atm_time_series_running_mean(:,1), atm_time_series_running_mean(:,2),day_decimal_year(:,1),'linear');
        ntol_time_series_running_mean_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        ntol_time_series_running_mean_selected_period_interpolated(:,2)=interp1(ntol_time_series_running_mean(:,1), ntol_time_series_running_mean(:,2),day_decimal_year(:,1),'linear');
        GLDAS_time_series_running_mean_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        GLDAS_time_series_running_mean_selected_period_interpolated(:,2)=interp1(GLDAS_time_series(:,7),GLDAS_time_series(:,3),day_decimal_year(:,1),'linear');
        TEM_time_series_running_mean_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        TEM_time_series_running_mean_selected_period_interpolated(:,2)=interp1(TEM_time_series_running_mean(:,1), TEM_time_series_running_mean(:,2),day_decimal_year(:,1),'linear');
        GPS_time_series_running_mean_selected_period_interpolated_clean(:,1)=day_decimal_year(:,1);
        GPS_time_series_running_mean_selected_period_interpolated_clean(:,2)=GNET_time_series_running_mean_selected_period_interpolated(:,2)-atm_time_series_running_mean_selected_period_interpolated(:,2)-ntol_time_series_running_mean_selected_period_interpolated(:,2)-GLDAS_time_series_running_mean_selected_period_interpolated(:,2)-TEM_time_series_running_mean_selected_period_interpolated(:,2);
        
        % mean mass per calendar month
        figure
        subplot(2,2,1)
        set(gcf,'WindowState','fullscreen')
        [GPS_running_mean_selected_period_interpolated_clean_monthly]=daily_to_monthly_mean_GNET_time_series(year_start,year_end,GPS_time_series_running_mean_selected_period_interpolated_clean(:,1),GPS_time_series_running_mean_selected_period_interpolated_clean(:,2));
        [rearranged_time_series_mean_2002_2012]=mean_mass_per_calendar_month(GPS_running_mean_selected_period_interpolated_clean_monthly(:,1),year_start,year_end,GPS_running_mean_selected_period_interpolated_clean_monthly(:,2),GPS_site_name);
        title(['GPS clean ' GPS_site_name])
        xlabel('Month')
        ylabel('U (mm)')
        ylim([-15 15])
        pbaspect([2 1 1])
        grid minor
        
        RACMO_SMB_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        RACMO_SMB_selected_period_interpolated(:,2)=interp1(RACMO_SMB_time_series(:,1), RACMO_SMB_time_series(:,4),day_decimal_year(:,1),'linear');
        % mean mass per calendar month
        subplot(2,2,2)
        [RACMO_SMB_selected_period_interpolated_monthly]=daily_to_monthly_mean_GNET_time_series(year_start,year_end,RACMO_SMB_selected_period_interpolated(:,1),RACMO_SMB_selected_period_interpolated(:,2));
        [rearranged_time_series_mean_2002_2012]=mean_mass_per_calendar_month(RACMO_SMB_selected_period_interpolated_monthly(:,1),year_start,year_end,RACMO_SMB_selected_period_interpolated_monthly(:,2),GPS_site_name);
        title(['RACMO SMB ' GPS_site_name])
        xlabel('Month')
        ylabel('U (mm)')
        ylim([-15 15])
        pbaspect([2 1 1])
        grid minor
        
        % mean mass per calendar month
        subplot(2,2,3)
        GPS_SMB_residual_time_series_monthly(:,1)=GPS_running_mean_selected_period_interpolated_clean_monthly(:,1);
        GPS_SMB_residual_time_series_monthly(:,2)=GPS_running_mean_selected_period_interpolated_clean_monthly(:,2)-RACMO_SMB_selected_period_interpolated_monthly(:,2);
        [rearranged_time_series_mean_2002_2012]=mean_mass_per_calendar_month(GPS_SMB_residual_time_series_monthly(:,1),year_start,year_end,GPS_SMB_residual_time_series_monthly(:,2),GPS_site_name);
        title(['GPS-SMB ' GPS_site_name])
        xlabel('Month')
        ylabel('U (mm)')
        ylim([-15 15])
        pbaspect([2 1 1])
        grid minor
        
        subplot(2,2,4)
        plot(GPS_running_mean_selected_period_interpolated_clean_monthly(:,1),GPS_running_mean_selected_period_interpolated_clean_monthly(:,2)-mean(GPS_running_mean_selected_period_interpolated_clean_monthly(:,2)),'r')
        hold on
        plot(RACMO_SMB_selected_period_interpolated_monthly(:,1),RACMO_SMB_selected_period_interpolated_monthly(:,2)-mean(RACMO_SMB_selected_period_interpolated_monthly(:,2)),'g')
        plot(GPS_SMB_residual_time_series_monthly(:,1),GPS_SMB_residual_time_series_monthly(:,2)-mean(GPS_SMB_residual_time_series_monthly(:,2)),'b')
        legend('GPS clean','RACMO SMB','GPS-SMB','Location','Best')
        title(GPS_site_name)
        xlabel('Time (Yr)')
        ylabel('U (mm)')
        pbaspect([2 1 1])
        grid minor
        
        
        
        figure
        GPS_SMB_residual_time_series_monthly(:,1)=GPS_running_mean_selected_period_interpolated_clean_monthly(:,1);
        GPS_SMB_residual_time_series_monthly(:,2)=GPS_running_mean_selected_period_interpolated_clean_monthly(:,2)-RACMO_SMB_selected_period_interpolated_monthly(:,2);
        [rearranged_time_series_mean_2002_2012]=mean_mass_per_calendar_month(GPS_SMB_residual_time_series_monthly(:,1),year_start,year_end,GPS_SMB_residual_time_series_monthly(:,2),GPS_site_name);
        title(GPS_site_name)
        xlabel('Month')
        ylabel('U (mm)')
        ylim([-15 15])
        pbaspect([2 1 1])
        grid minor
        
        RACMO_precip_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        RACMO_precip_selected_period_interpolated(:,2)=interp1(RACMO_precip_time_series(:,1), RACMO_precip_time_series(:,4),day_decimal_year(:,1),'linear');
        RACMO_runoff_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        RACMO_runoff_selected_period_interpolated(:,2)=interp1(RACMO_runoff_time_series(:,1), RACMO_runoff_time_series(:,4),day_decimal_year(:,1),'linear');
        RACMO_melt_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        RACMO_melt_selected_period_interpolated(:,2)=interp1(RACMO_melt_time_series(:,1), RACMO_melt_time_series(:,4),day_decimal_year(:,1),'linear');
        RACMO_snowfall_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        RACMO_snowfall_selected_period_interpolated(:,2)=interp1(RACMO_snowfall_time_series(:,1), RACMO_snowfall_time_series(:,4),day_decimal_year(:,1),'linear');
        RACMO_subl_selected_period_interpolated(:,1)=day_decimal_year(:,1);
        RACMO_subl_selected_period_interpolated(:,2)=interp1(RACMO_subl_time_series(:,1), RACMO_subl_time_series(:,4),day_decimal_year(:,1),'linear');
        
        
        liquid_p_time_series(:,1)=day_decimal_year(:,1);
        liquid_p_time_series(:,2)=RACMO_precip_selected_period_interpolated(:,2)-RACMO_snowfall_selected_period_interpolated(:,2)-RACMO_subl_selected_period_interpolated(:,2)+RACMO_melt_selected_period_interpolated(:,2);
        %         liquid_p_time_series(:,2)=RACMO_precip_selected_period_interpolated(:,2)-RACMO_snowfall_selected_period_interpolated(:,2)+RACMO_subl_selected_period_interpolated(:,2)+RACMO_melt_selected_period_interpolated(:,2);
        
        
        save(['Output\' GPS_site_name],'day_decimal_year', 'GPS_time_series_running_mean_selected_period_interpolated_clean','RACMO_SMB_selected_period_interpolated','liquid_p_time_series','RACMO_runoff_selected_period_interpolated','GNSS_data_gap_for_selected_period')
        
        disp(GPS_site_name)
        
        %% estimate meltwater
        %[a,bias,E_p,E_r,gama,beta]=estimate_meltwater_GNSS_SMB_loading(day_decimal_year(:,1),GPS_time_series_running_mean_selected_period_interpolated_clean(:,2),RACMO_SMB_selected_period_interpolated(:,2),liquid_p_time_series(:,2),RACMO_runoff_selected_period_interpolated(:,2));
        clearvars -except GPS_site_name_pavel k
    end
end