-- This doesn't work because started_at and ended_at would need to be included in the group by.
-- The Having Count (*) > 1 clause is an aggregate function, so it works in a way
-- Where does not by contrast. Need to nest a having filter within a where clause.
SELECT ride_id, COUNT(ride_id) AS duplicate_count, started_at, ended_at 
FROM gda_capstone_a_raw.may_2025_to_may_2026 may_to_may
GROUP BY ride_id,
HAVING COUNT(*) >1