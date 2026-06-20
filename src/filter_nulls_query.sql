/* Use filter to count the number of nulls in each column */
SELECT
    COUNT(*) FILTER (WHERE ride_id IS NULL) ride_id_empties,
    COUNT(*) FILTER (WHERE rideable_type IS NULL) rideable_type_empties,
    COUNT(*) FILTER (WHERE member_casual IS NULL) member_casual_empties,
    COUNT(*) FILTER (WHERE started_at IS NULL) started_at_empties,
    COUNT(*) FILTER (WHERE ended_at IS NULL) ended_at_empties,
    COUNT(*) FILTER (WHERE start_station_name IS NULL) start_station_name_empties,
    COUNT(*) FILTER (WHERE start_station_id IS NULL) start_station_id_empties,
    COUNT(*) FILTER (WHERE start_lat IS NULL) start_lat_empties,
    COUNT(*) FILTER (WHERE start_lng IS NULL) start_lng_empties,
    COUNT(*) FILTER (WHERE end_station_name IS NULL) end_station_name_empties,
    COUNT(*) FILTER (WHERE end_station_id IS NULL) end_station_id_empties,
    COUNT(*) FILTER (WHERE end_lat IS NULL) end_lat_empties,
    COUNT(*) FILTER (WHERE end_lng IS NULL) end_lng_empties
FROM gda_capstone_a_raw.may_2025_to_may_2026 mtm