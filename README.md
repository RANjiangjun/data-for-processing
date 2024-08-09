# README

## 1. Introduction
This repository contains the core script for preparing the data for estimating melt water storage.
The sample code is written in MATLAB. With the following file structure, you can run the demo directly.

## 2. File Structure
**Input**:&nbsp; .txt files of KAGA station<br>
&nbsp;<br>
**Src**<br>
&nbsp; **--/data_for_processing.m**：Main script to prepare the data for estimating melt water storage.<br>
  &nbsp; **--/daily_to_decimal_year.m**：Each day in terms of decimal year.<br>
  &nbsp; **--/daily_to_monthly_mean_GNET_time_series.m**：Daily time-series to monthly mean time-series.<br>
  &nbsp; **--/GNSS_data_gap.m**：Find the data gap of GNSS data.<br>
  &nbsp; **--/mean_mass_per_calendar_month.m**：Mean mass per calendar month.<br>
  &nbsp; **--/running_mean_time_series.m**：Running mean of GNET time-series.<br>
  &nbsp; **--/day_runnian.m**：Determine whether it is a leap year.<br>
  &nbsp;<br>
**Output**:&nbsp; Path to store the output.						 

## Corresponding authors
If you have any question about the codes , please contact Jiangjun RAN (ranjj@sustech.edu.cn).<br>
<br>
_Copyright (c) 2024 Jiangjun RAN. All rights reserved._ <br>
_Last update 2024.08.09_
