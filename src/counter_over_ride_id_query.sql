-- Thanks to https://stackoverflow.com/questions/6218902/the-sql-over-clause-when-and-why-is-it-useful for help with
-- COUNT OVER(PARTION BY) as a way to filter the results.
SELECT *
FROM (
	SELECT *,
		COUNT(*) OVER(PARTITION BY ride_id) ride_id_count
	FROM gda_capstone_a_raw.may_2025_to_may_2026 
	)
WHERE ride_id_count > 1;