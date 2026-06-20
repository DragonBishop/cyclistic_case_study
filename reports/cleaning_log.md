# Cleaning Log

## 6/13/26
Initial attempt to import data resulted in error due to length of some fields. Increased length to 100 to eliminate errors. Remaining file imports went smoothly through DBeaver client. Unzipped folders in directory, then added to gda_capstona_a schema.

Tasks Completed
- Review online metadata for dataset
- Download dataset .csv files
- Import dataset into postgreSQL database
- Audit data for initial join
- Write and execute SQL join query
- SELECT COUNT (*) FROM GROUP BY HAVING COUNT(1) > 1 query for ride_id
- Convert empty strings to nulls
- Investigate and resolve record duplicates

Data Integrity, Initial Scouting:
- Personally Identifying Information removed by data owner. Records only contain information about rides.
- Name discrepancy between folder "202601-divvy-tripdata" and file inside, "202501-divvy-tripdata"
    - Appears that file contains desired ride info for 2026, worth auditing if any 2025 dates.
- Primary key - ride_id, unique id for each ride.
    - Error thrown by one join attempt claims duplicate keys were found.
    - Exact record matches, rewrote create table script to exclude.
- ride_id, rideable_type, started_at, ended_at, member_casual all appear intact
- Data Type Problems
    - Ride times stored in started_at, ended_at in DD:YY:YYYY HH:MM:SS AM format.
    - GIS coordinates 

Missing info
- Empty strings
     - start_station_name: 1249661
     - start_end_station_id: 12459661
     - end_station_name: 1314320
     - end_station_id: 1314320
- Nulls
     - start_Lat: 0
     - start _lng: 0
     - end_lat: 5890
     - end_lng: 5890
       
- Junk data
    - MACOS subfolders for each spreadsheet
        unclear importance or value of data, preserve but remove from dataset.

Notes:
- Millions of records, but easier to view in aggregate.
- 1.1G of records! Wow!
- GPS coordinates mostly map reliably onto one station. Sometimes appears to be overlap.
- Possible to use existing coordinates to recreate station names for missing data.
    - Not clear whether necessary for analysis.
- Focus is on CORE DATA POINTS: the ride id, type of bike, start/stop data are all pretty reliable.
- Intentional planning of the steps of cleaning will allow of it to be executed smoothly.
    - Consider if Python will be preferable to SQL for manipulation and cleaning.
- Need to consider if station data part of analysis, or exclude records with missing data.

## 6/14/26

Tasks Completed
- [X] Evaluate potential use of Python for data cleaning.
- [X] Convert date and GIS data into appropriate data types.
- [X] Audit for further faulty data (i.e. discrepant start and stop times)
- [X] Clean unverifiable rides from data, keeping track of records deleted.
- [X] Create "dictionary" of GIS Coordinates and station_ids.
- [X] Reconstruct what data that can be reliably reconstructed (not feasible)
- [X] Decide on analysis of core categories: ride_id, rideable_type, member_casual, ride_date, ride_start, ride_stop. 
- [X] Use of sums, means, histograms/distributions, standard deviations/variance

Notes
- Station ids are likely unsalvageable, as it appears that the missing ids are in records where the gis coordinates rounded to two decimal places.
  - Appears to be quality of original dataset. Possible to estimate what stations these records represent, but not clearly aligned with purpose of project.
- Can create separate date and time columns simply by casting into DATE and TIME data types in postgreSQL, no need for string slicing!
- GIS coordinates successfully recorded using <code>geography</code> data type.
- total of 3,839,962 records successfully extracted, with 1,314.320 removed due to missing or bad data
- Queries have long runtimes in postgreSQL (relatively) at about 1 minute for the longest. Worth trying pandas to analyze both for ease of creating summary tables
and practice use of Psycopg to integrate Python and postgreSQL
- Population variables to manipulate: casual vs. member & classic vs. docked vs. electric bike
- Data points to manipulate: trips, time (hour, day, week, month), locations,
- Statistical tools for analysis: sum, total, ranking (top 10) mean, median, variance/standard deviation
- Visualization - Tableau will produce the best dashboards / visual aggregations, but postgreSQL GIS data may not integrate
    - Value in exploring Python data viz options (pandas, seaborn, psycopg) for experience and flexibility
- Data cleaning completed pending further issues.

## 6/15/26-6/16/26

Notes
- Unsurprisingly, further issues! Further debugging revealed a number of bugs that were corrupting certain fields
    - Most due to human error
- Most significantly, wrangling data in geopandas allowed for unexpected breakthoughs in analysis and data viz.

## 6/17/26
- Wrangling the data in (geo)pandas has clarified to me the shape and structure of this data, and I've gone back and rewritten a lot of the workflow from this project to reflect that work. After looking at the outlier values in ride_length, I've chosen to remove the top 1% and bottom 1%.
- The ride lengths, especially for casual rides, skew towards the longer rides, with a wider standard deviation.
- I've shifted the null-cleaning to the python script and recounted the number of rides that had null values before cleaning them.
- Wrangling GIS coordinates was challenging, but rewarding to create a chloropleth map. Need to finalize other data viz.
- Wrap up v. 1.0 with a report and data viz.