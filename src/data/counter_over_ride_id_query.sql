SELECT *
FROM (
	SELECT *,
		COUNT(*) OVER(PARTITION BY ride_id) ride_id_count
	FROM gda_capstone_a_raw.may_2025_to_may_2026 
	)
WHERE ride_id_count > 1;