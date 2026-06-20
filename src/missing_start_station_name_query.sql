/*Attempting to map the number of times starting latitudes and starting station names align with each other.
 * Strong correlations may allow restoration of missing records.
 */
SELECT 
	start_station_name,
	start_lat, 
	COUNT(*) AS occurrences 
FROM 
gda_capstone_a_raw.may_2025_to_may_2026 mtm 
GROUP BY
	start_station_name,
	start_lat 
ORDER BY 
	start_lat 