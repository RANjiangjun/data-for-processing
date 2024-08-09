function [day_decimal_year]=daily_to_decimal_year(year_start,year_end)
%***********************************************************************************************%
% Copyright (c) 2024-2099 by Gravity and Cryosphere Lab @ SUSTecch, all rights reserved.
% Author: Jiangjun Ran
% E-mail: ranjj@sustech.edu.cn
%***********************************************************************************************%
%% each day in terms of decimal year
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

n=1;
for year=year_start:year_end
    for month=1:12
        if (month==1)
            for k=1:31
                day_decimal_year(n,1)=year+(k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==2)
            if day_runnian(year)==1
                
                for k=1:29
                    day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                    day_decimal_year(n,2)=k;
                    day_decimal_year(n,3)=month;
                    day_decimal_year(n,4)=year;
                    n=n+1;
                end
            elseif day_runnian(year)==0
                for k=1:28
                    day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                    day_decimal_year(n,2)=k;
                    day_decimal_year(n,3)=month;
                    day_decimal_year(n,4)=year;
                    n=n+1;
                end
            end
        end
        if (month==3)
            for k=1:31
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==4)
            for k=1:30
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==5)
            for k=1:31
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==6)
            for k=1:30
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==7)
            for k=1:31
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==8)
            for k=1:31
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==9)
            for k=1:30
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==10)
            for k=1:31
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==11)
            for k=1:30
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        if (month==12)
            for k=1:31
                day_decimal_year(n,1)=year+(sum(days(year-year_start+1,1:month-1))+k-0.5)/daily_year(year-year_start+1,1);
                day_decimal_year(n,2)=k;
                day_decimal_year(n,3)=month;
                day_decimal_year(n,4)=year;
                n=n+1;
            end
        end
        
    end
end
end