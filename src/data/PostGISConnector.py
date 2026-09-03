import getpass

import geopandas as gpd
import sqlalchemy as sql
from sqlalchemy import URL


class PostGISConnector:
    """Assembles a PostgreSQL connection address, then queries the database"""

    def __init__(
        self, host="localhost", port=5432, database="data_science", username="postgres"
    ) -> None:
        self.drivername = "postgresql+psycopg"
        self.host = host
        self.port = port
        self.database = database
        self.username = username
        self.password = getpass.getpass("Password: ")
        self.engine = self._create_engine()

    def _create_engine(self) -> sql.Engine:
        """Uses PostGISConnector attributes to return database address."""
        address = URL.create(
            drivername=self.drivername,
            username=self.username,
            password=self.password,
            host=self.host,
            port=self.port,
            database=self.database,
        )

        return sql.create_engine(address)

    def postgis_query(self, query: str, geom_col: str) -> gpd.GeoDataFrame:
        """Runs user-defined SQL query against PostGIS Database"""
        capstone_data_raw = gpd.read_postgis(
            sql=query,
            con=self.engine,
            # NOTE: GeoDataFrame can only analyze one geometry column at a time
            geom_col=geom_col,
        )
        return capstone_data_raw


if __name__ == "__main__":
    connector = PostGISConnector()
    df = connector.postgis_query(
        query="SELECT * FROM gda_capstone_a_raw.may2025_may2026_cleaned LIMIT 5",
        geom_col="start_coordinates",
    )
    print(df.head())
