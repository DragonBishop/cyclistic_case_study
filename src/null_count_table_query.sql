-- Determine the number of null records being removed when table is imported into pandas
CREATE TABLE gda_capstone_a_raw.nulls_count_query AS
SELECT COUNT(*) AS total_rows,
COUNT(*) FILTER (WHERE ride_id IS NULL) AS ride_id_nulls,
COUNT(*) FILTER (WHERE rideable_type IS NULL) AS rideable_type_nulls,
COUNT(*) FILTER (WHERE member_casual IS NULL) AS member_casual_nulls,
COUNT(*) FILTER (WHERE started_at IS NULL) AS started_at_nulls,
COUNT(*) FILTER (WHERE ended_at IS NULL) AS ended_at_nulls,
COUNT(*) FILTER (WHERE start_station_name IS NULL) AS start_station_name_nulls,
COUNT(*) FILTER (WHERE start_station_id IS NULL) AS start_station_id_nulls,
COUNT(*) FILTER (WHERE start_lat IS NULL) AS start_lat_nulls,
COUNT(*) FILTER (WHERE start_lng IS NULL) AS start_lng_nulls,
COUNT(*) FILTER (WHERE end_station_name IS NULL) AS end_station_name_nulls,
COUNT(*) FILTER (WHERE end_station_id IS NULL) AS end_station_id_nulls,
COUNT(*) FILTER (WHERE end_lat IS NULL) AS end_lat_nulls,
COUNT(*) FILTER (WHERE end_lng IS NULL) AS end_lng_nulls

FROM gda_capstone_a_raw.may_2025_to_may_2026