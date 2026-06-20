/*Create a table containing this analysis*/
CREATE TABLE gda_capstone_a_raw.empty_cells_query AS
/*Count empty strings in each column where they've been found. Will also count nulls
 * In columns where located. Based on queries that checked all for each.*/
SELECT
    COUNT(*) FILTER (WHERE start_station_name = '') start_station_name_empties,
    COUNT(*) FILTER (WHERE start_station_id = '') start_station_id_empties,
    COUNT(*) FILTER (WHERE start_lat IS NULL) start_lat_empties,
    COUNT(*) FILTER (WHERE start_lng IS NULL) start_lng_empties,
    COUNT(*) FILTER (WHERE end_station_name = '') end_station_name_empties,
    COUNT(*) FILTER (WHERE end_station_id = '') end_station_id_empties,
    COUNT(*) FILTER (WHERE end_lat IS NULL ) end_lat_empties,
    COUNT(*) FILTER (WHERE end_lng IS NULL ) end_lng_empties
FROM gda_capstone_a_raw.may_2025_to_may_2026 mtm