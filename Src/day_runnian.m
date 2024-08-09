function day_runnian=day_runnian(year)
%***********************************************************************************************%
% Copyright (c) 2024-2099 by Gravity and Cryosphere Lab @ SUSTecch, all rights reserved.
% Author: Jiangjun Ran
% E-mail: ranjj@sustech.edu.cn
%***********************************************************************************************%
% purpose 闰年或者平年
day_runnian=nan;
if ((mod(year,4)==0 && mod(year,100)~=0)||(mod(year,100)==0 && mod(year,400)==0))
    day_runnian=1; %闰年
else
    day_runnian=0; %平年
end
end