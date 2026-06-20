/* Create a table with ride_id, member_type, bike_type, start times/dates and end times/dates,
 *  with start and end locations as labeled GIS coordinates (crs=EPSG:4326), where all null values are removed
 * and no rides are shorter than one minute. */
CREATE TABLE gda_capstone_a_raw.may2025_may2026_cleaned AS
SELECT 
	ride_id,
	member_casual member_type,
	rideable_type bike_type,
--I switched to timestamp after encountering compatibility errors with pandas. This is the best way to bring the data into a DF.
	started_at::TIMESTAMP start_time,
	ended_at::TIMESTAMP end_time,
	(ended_at::timestamp - started_at::timestamp) ride_duration,
	start_station_name start_location,
	ST_SetSRID(
		st_makepoint(
			start_lng::NUMERIC, start_lat::NUMERIC
			), 4326
		)::geography AS start_coordinates,
	end_station_name end_location,
	ST_SetSRID(
		st_makepoint(
			end_lng::NUMERIC, end_lat::NUMERIC
			), 4326
		)::geography AS end_coordinates
FROM 
	gda_capstone_a_raw.may_2025_to_may_2026 maytomay
WHERE 
	ride_id IS NOT NULL
	AND member_casual IS NOT NULL
	AND rideable_type IS NOT NULL 
	AND started_at IS NOT NULL 
	AND ended_at IS NOT NULL 
	AND (ended_at::timestamp - started_at::timestamp) IS NOT NULL
	AND start_station_name IS NOT NULL
	AND start_lat IS NOT NULL
	AND start_lng IS NOT NULL
	AND end_station_name IS NOT NULL
	AND end_lat IS NOT NULL
	AND end_lng IS NOT NULL