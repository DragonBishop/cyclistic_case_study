import getpass
from pathlib import Path

import geopandas as gpd
import pandas as pd
import sqlalchemy as sql
from sqlalchemy import URL


class PGISConnector:
    """Assembles a SQLAlchemy database connection, then queries the database"""

    def __init__(
        self,
        host="localhost",
        port=5432,
        database="data_science",
        username="postgres",
        drivername="postgresql+psycopg",
    ) -> None:
        self.drivername = drivername
        self.host = host
        self.port = port
        self.database = database
        self.username = username
        self.password = getpass.getpass("Password: ")
        self.engine = self._create_engine()

    def _create_engine(self) -> sql.Engine:
        """Uses PGISConnector attributes to return database address."""
        address = URL.create(
            drivername=self.drivername,
            username=self.username,
            password=self.password,
            host=self.host,
            port=self.port,
            database=self.database,
        )

        return sql.create_engine(address)

    def query(self, query: str) -> pd.DataFrame:
        """Runs a user-defined SQL query and returns a plain DataFrame."""
        return pd.read_sql(query, con=self.engine)

    def query_postgis(self, query_path: str, geom_col: str) -> gpd.GeoDataFrame:
        """Runs the SQL query loaded from query_path against a PostGIS database."""
        query = Path(query_path).read_text()
        return gpd.read_postgis(
            sql=query,
            con=self.engine,
            # NOTE: GeoDataFrame can only analyze one geometry column at a time
            geom_col=geom_col,
        )


if __name__ == "__main__":
    connector = PGISConnector()
    df = connector.query_postgis(
        query_path="src/data/example_query.sql",
        geom_col="start_coordinates",
    )
    print(df.head())
