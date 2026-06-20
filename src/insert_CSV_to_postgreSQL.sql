-- Coppying a file into the local database from the directory in .csv format
copy target_table_name 
FROM '/absolute/path/to/local/file.csv' 
WITH 
	(FORMAT CSV, HEADER true, DELIMITER ',');