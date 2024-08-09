function [monthly_time_series]=daily_to_monthly_mean_GNET_time_series(year_start,year_end,time,daily_time_series)
%***********************************************************************************************%
% Copyright (c) 2024-2099 by Gravity and Cryosphere Lab @ SUSTecch, all rights reserved.
% Author: Jiangjun Ran
% E-mail: ranjj@sustech.edu.cn
%***********************************************************************************************%
%% daily time-series to monthly mean time-series
days(1:year_end-year_start+1,1:12)=0;
daily_year(1:year_end-year_start+1,1)=0.0;
for year=year_start:year_end
    for month=1:12
        if (month==1)
            days(year-year_start+1,month)=31;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+31;
        end
        if (month==2)
            if day_runnian(year)==1
                days(year-year_start+1,month)=29;
                daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+29;
            elseif day_runnian(year)==0
                days(year-year_start+1,month)=28;
                daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+28;
            end
        end
        if (month==3)
            days(year-year_start+1,month)=31;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+31;
        end
        if (month==4)
            days(year-year_start+1,month)=30;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+30;
        end
        if (month==5)
            days(year-year_start+1,month)=31;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+31;
        end
        if (month==6)
            days(year-year_start+1,month)=30;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+30;
        end
        if (month==7)
            days(year-year_start+1,month)=31;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+31;
        end
        if (month==8)
            days(year-year_start+1,month)=31;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+31;
        end
        if (month==9)
            days(year-year_start+1,month)=30;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+30;
        end
        if (month==10)
            days(year-year_start+1,month)=31;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+31;
        end
        if (month==11)
            days(year-year_start+1,month)=30;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+30;
        end
        if (month==12)
            days(year-year_start+1,month)=31;
            daily_year(year-year_start+1,1)=daily_year(year-year_start+1,1)+31;
        end
        
    end
end

% time
counter_temp=1;
for year=year_start:year_end
    for month=1:12
        if (month==1)
            
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+1.0/daily_year(year-year_start+1,1);
                last_day_current_month=year+days(year-year_start+1,month)/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==2)
            if day_runnian(year)==1
                counter=0;
                temp_GNET=0.0;
                for k=1:length(daily_time_series)
                    first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                    last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                    if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                        temp_GNET=temp_GNET+daily_time_series(k);
                        counter=counter+1;
                    end
                    
                end
                if counter>1
                    monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                    monthly_time_series(counter_temp,2)=temp_GNET/counter;
                    counter_temp=counter_temp+1;
                end
            elseif day_runnian(year)==0
                
                counter=0;
                temp_GNET=0.0;
                for k=1:length(daily_time_series)
                    first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                    last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                    if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                        temp_GNET=temp_GNET+daily_time_series(k);
                        counter=counter+1;
                    end
                    
                end
                if counter>=1
                    monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                    monthly_time_series(counter_temp,2)=temp_GNET/counter;
                    counter_temp=counter_temp+1;
                end
            end
        end
        if (month==3)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==4)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==5)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==6)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==7)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==8)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==9)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==10)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==11)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        if (month==12)
            counter=0;
            temp_GNET=0.0;
            for k=1:length(daily_time_series)
                first_day_current_month=year+(1.0+sum(days(year-year_start+1,1:month-1)))/daily_year(year-year_start+1,1);
                last_day_current_month=year+(sum(days(year-year_start+1,1:month)))/daily_year(year-year_start+1,1);
                if (time(k)>=first_day_current_month && time(k)<=last_day_current_month)
                    temp_GNET=temp_GNET+daily_time_series(k);
                    counter=counter+1;
                end
                
            end
            if counter>=1
                monthly_time_series(counter_temp,1)=year+(month-0.5)/12;
                monthly_time_series(counter_temp,2)=temp_GNET/counter;
                counter_temp=counter_temp+1;
            end
        end
        
    end
end
end