/*Got a bunch of negative values that messed up this query in ride_duration. Comes down to the way that the time
 * Data type works versus timestamp. 
 */

CREATE TABLE gda_capstone_a_raw.may2025_may2026_cleaned AS
SELECT 
	ride_id,
	rideable_type bike_type,
	started_at::DATE start_date,
	started_at::TIME start_time,
	ended_at::DATE end_date, 
	ended_at::TIME end_time,
	(ended_at::time - started_at::time) ride_duration,
	ST_SetSRID(
		st_makepoint(
			start_lat::NUMERIC, start_lng::NUMERIC
			), 4326
		)::geography AS start_location,
	ST_SetSRID(
		st_makepoint(
			end_lat::NUMERIC, end_lng::NUMERIC
			), 4326
		)::geography AS end_location
FROM 
	gda_capstone_a_raw.may_2025_to_may_2026 maytomay
WHERE 
	ride_id IS NOT NULL 
	AND rideable_type IS NOT NULL 
	AND started_at IS NOT NULL 
	AND ended_at IS NOT NULL 
	AND start_lat IS NOT NULL
	AND start_lng IS NOT NULL
	AND end_lat IS NOT NULL
	AND end_lng IS NOT NULL