# This code generates a query on the local database.

# Prompt user for password using getpass module, and use typical defaults to construct engine URL
# Defaults are listed here, but you can modify them to your purposes.
import sqlalchemy as sql
from sqlalchemy import URL
import getpass
import geopandas as gpd

address = URL.create(
    drivername="postgresql+psycopg",
    username="postgres",
    password=getpass.getpass("Password: "),
    host="localhost",
    port = 5432,
    database="postgres",
    )

# Use constructed url to create sql engine to query database
engine = sql.create_engine(address)

# Hard coded query to select all records from cleaned table
query = "SELECT * FROM gda_capstone_a_raw.may2025_may2026_cleaned"

## Assemble geodataframe using defined query and engine
capstone_data_raw = gpd.read_postgis(
     sql=query,
     con=engine,
# NOTE: Geopandas can only have one active geometry column at a time.
# Easiest way to compare start and end trips is to switch between them below.
    geom_col="start_coordinates",
)
# NOTE: Change the column specified here to the opposite of the one above.
# Convert the other coordinate column into geometry data type.
# capstone_data_raw["end_coordinates"] = gpd.GeoSeries.from_wkb(capstone_data_raw["end_coordinates"])