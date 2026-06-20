/*Turning empty strings into nulls to make managing data easier.
 * This failed because * does not work as a wildcard for these functions.
 * */
UPDATE 
	gda_capstone_a_raw.may_2025_to_may_2026 may_2025_to_2026
SET 
	* = NULL 
WHERE 
	* = '';