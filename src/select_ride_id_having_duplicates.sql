/* Select ride_ids with more than one occurrence, and the number of times
 * they recur
 */
SELECT ride_id, count(ride_id)
FROM gda_capstone_a_raw.may_2025_to_may_2026 may_to_may
GROUP BY ride_id 
HAVING COUNT(*) >1