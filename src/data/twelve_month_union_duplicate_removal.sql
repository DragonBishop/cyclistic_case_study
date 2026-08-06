/*Updated version of script to create table, incorporating elimination of duplicates.*/
CREATE TABLE may_2025_to_may_2026
	(ride_id varchar(100),
	rideable_type varchar(100),
	member_casual varchar(100),
	started_at varchar(100),
	ended_at varchar(100),
	start_station_name varchar(100),
	start_station_id varchar(100),
	start_lat varchar(100),
	start_lng varchar(100),
	end_station_name varchar(100),
	end_station_id varchar(100),
	end_lat varchar(100), 
	end_lng varchar(100));
-- Changing the order of the columns under the create table command, but keeping them the same here, seems to allow for reorganization of data!
-- Fun find!
INSERT INTO may_2025_to_may_2026
	(
	ride_id,
	rideable_type, 
	started_at,
	ended_at,
	start_station_name,
	start_station_id,
	end_station_name,
	end_station_id,
	start_lat,
	start_lng,
	end_lat,
	end_lng,
	member_casual
	)
--Selects the distinct records from each table. Avoids duplicate records.
SELECT DISTINCT *
FROM (
	SELECT 	* FROM gda_capstone_a_raw."202506_divvy_tripdata" june_2025
	UNION ALL
	SELECT 	* FROM gda_capstone_a_raw."202507_divvy_tripdata" July_2025
	UNION ALL
	SELECT 	* FROM gda_capstone_a_raw."202508_divvy_tripdata" aug_2025
	UNION ALL
	SELECT 	* FROM gda_capstone_a_raw."202509_divvy_tripdata" sept_2025
	UNION ALL 
	SELECT 	* FROM 	gda_capstone_a_raw."202510_divvy_tripdata" oct_2025
	UNION ALL
	SELECT 	* FROM  gda_capstone_a_raw."202511_divvy_tripdata" nov_2025
	UNION ALL
	SELECT 	* FROM gda_capstone_a_raw."202512_divvy_tripdata" dec_2025
	UNION ALL
--While the file is named 202501, The dates are all in 2026.
	SELECT 	* FROM gda_capstone_a_raw."202501_divvy_tripdata" jan_2026
	UNION ALL
	SELECT 	* FROM gda_capstone_a_raw."202602_divvy_tripdata" feb_2026
	UNION ALL
	SELECT 	* FROM gda_capstone_a_raw."202603_divvy_tripdata" mar_2026
	UNION ALL
	SELECT 	* FROM gda_capstone_a_raw."202604_divvy_tripdata" apr_2026
	UNION ALL
	SELECT 	* FROM gda_capstone_a_raw."202605_divvy_tripdata" may_2026
	)
-- Join tables for June 2026 thru May 26 on ride_id
