/*Turning empty strings into nulls to make managing data easier.
 * This failed because * does not work as a wildcard for these functions.
 * Updated Rows: 5848703, 1m 34s run time*/
UPDATE 
	gda_capstone_a_raw.may_2025_to_may_2026
SET 
	ride_id = NULLIF(ride_id, ''),
	rideable_type = NULLIF(rideable_type, ''),
	member_casual = NULLIF(member_casual, ''),
	started_at = NULLIF(started_at , ''),
	ended_at = NULLIF(ended_at , ''),
	start_station_name = NULLIF(start_station_name, ''),
	start_station_id = NULLIF(start_station_id, ''),
	start_lat = NULLIF(start_lat, ''),
	start_lng = NULLIF(start_lng, ''),
	end_station_name = NULLIF(end_station_name, ''),
	end_station_id = NULLIF(end_station_id, ''),
	end_lat = NULLIF(end_lat, ''),
	end_lng = NULLIF(end_lng, '');