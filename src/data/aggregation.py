import geopandas as gpd
import pandas as pd
from pandas.io.formats.style import Styler


def summarize_group_stats(
    gdf: pd.DataFrame,
    group_cols: list[str],
    title: str,
    id_col: str,
    duration_col: str,
) -> Styler:
    """
    Group records by group_cols, aggregating a record count and the mean
    of duration_col, and caption the result with title.

    Args:
        gdf: The DataFrame (or GeoDataFrame) to summarize.
        group_cols: Columns to group by.
        title: Caption to apply to the returned styled table.
        id_col: Column counted to produce the record count per group.
        duration_col: Column averaged to produce the duration mean per group.

    Returns:
        A pandas Styler wrapping the aggregated table, captioned with title.
    """
    aggregated_data = (
        gdf.groupby(group_cols, observed=True)
        .agg(
            number_of_rides=(id_col, "count"),
            average_duration=(duration_col, "mean"),
        )
        .reset_index()
    )
    return aggregated_data.style.set_caption(title)


def describe_by_time_category(
    gdf: pd.DataFrame,
    groupby_col: str,
    categorical_col: str,
    categorical_order: list[str],
    time_col: str,
    id_col: str,
    duration_col: str,
    metrics: tuple[str, ...] = ("mean", "median", "min", "max", "std"),
) -> pd.DataFrame:
    """
    Calculate count and duration statistical metrics grouped by groupby_col
    and categorical_col, then merge them into a single chronologically
    ordered table.

    Args:
        gdf: The DataFrame (or GeoDataFrame) to summarize.
        groupby_col: The primary category to group by (e.g., 'member_type').
        categorical_col: The time category to group by (e.g., 'day_of_week').
        categorical_order: The category order for the pandas Categorical
            (e.g. day names or month names, in calendar order).
        time_col: The raw datetime column (e.g., 'start_time').
        id_col: Column counted to produce the record count per group.
        duration_col: Column aggregated to produce the duration statistics.
        metrics: Tuple of statistical metrics to apply.

    Returns:
        A DataFrame merging count_* and duration_* statistics per
        groupby_col/categorical_col pair, with categorical_col ordered by
        categorical_order.
    """
    count_stats: pd.DataFrame = (
        gdf.groupby(
            [groupby_col, categorical_col, gdf[time_col].dt.date], observed=True
        )[id_col]
        .count()
        .rename("number_of_rides")
        .reset_index()
        .groupby([groupby_col, categorical_col], observed=True)["number_of_rides"]
        .agg(list(metrics))
        .add_prefix("count_")
        .reset_index()
    )
    duration_stats: pd.DataFrame = (
        gdf.groupby([groupby_col, categorical_col], observed=True)[duration_col]
        .agg(list(metrics))
        .add_prefix("duration_")
        .reset_index()
    )
    agg_stats: pd.DataFrame = count_stats.merge(
        duration_stats, on=[groupby_col, categorical_col], how="outer"
    )
    agg_stats[categorical_col] = pd.Categorical(
        agg_stats[categorical_col], categories=categorical_order, ordered=True
    )
    return agg_stats


def merge_counts_by_region(
    points_gdf: gpd.GeoDataFrame,
    regions_raw: gpd.GeoDataFrame,
    join_col: str,
    group_cols: tuple[str, ...],
) -> tuple[gpd.GeoDataFrame, list[str]]:
    """
    Spatially join points_gdf to regions_raw, then cross-tabulate and merge
    point counts by group_cols back onto the regions.

    Args:
        points_gdf: The point-level GeoDataFrame to spatially join.
        regions_raw: The region boundaries GeoDataFrame.
        join_col: The region id column to join and merge on.
        group_cols: The columns to cross-tabulate point counts by.

    Returns:
        A tuple of the merged regions GeoDataFrame and the list of
        count column names that were added to it.
    """
    # Variable assignment to ensure idempotency of later merge
    regions = regions_raw.copy()
    mapped_data = gpd.sjoin(points_gdf, regions, how="left", predicate="within")

    # Cross-tabulate point counts by region and the given group columns
    counts = (
        mapped_data.groupby([join_col, *group_cols])
        .size()
        .unstack(list(group_cols), fill_value=0)
    )

    # Flatten multi-level column headers (e.g., 'casual' + 'classic_bike' -> 'casual_classic_bike')
    counts.columns = [
        "_".join(col) if isinstance(col, tuple) else col for col in counts.columns
    ]
    counts = counts.reset_index()

    count_cols = [col for col in counts.columns if col != join_col]

    # Merge counts back into the geographic region data
    regions = regions.merge(counts, on=join_col, how="left")

    # Fill missing data with 0 for any regions that had absolutely zero points
    regions[count_cols] = regions[count_cols].fillna(0)

    return regions, count_cols


def summarize_top_regions(
    regions: gpd.GeoDataFrame,
    count_cols: list[str],
    subtotal_groups: tuple[tuple[str, str], ...],
    label_col: str,
) -> tuple[gpd.GeoDataFrame, pd.DataFrame]:
    """
    Calculate subtotal columns (one per entry in subtotal_groups, summing
    count_cols matching its keyword) plus a grand total for each region,
    and build a sorted summary table for inspecting the top regions.

    Args:
        regions: The regions GeoDataFrame with count_cols present.
        count_cols: The count columns to subtotal and total.
        subtotal_groups: Pairs of (output column name, keyword to match
            against count_cols) defining each subtotal.
        label_col: The region label column to display alongside counts.

    Returns:
        A tuple of the updated regions GeoDataFrame and the sorted
        top_regions summary table.
    """
    for subtotal_col, keyword in subtotal_groups:
        regions[subtotal_col] = regions[[c for c in count_cols if keyword in c]].sum(
            axis=1
        )

    subtotal_cols = [subtotal_col for subtotal_col, _ in subtotal_groups]
    regions["total_count"] = regions[subtotal_cols].sum(axis=1)

    # Extract a lightweight dataframe to easily inspect top regions
    top_regions = regions[
        [label_col] + count_cols + subtotal_cols + ["total_count"]
    ].sort_values(by="total_count", ascending=False)

    return regions, top_regions
