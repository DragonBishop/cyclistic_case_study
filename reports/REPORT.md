# Cyclistic Data Analysis 🚴
*Building Relationships with Casual Riders*

This project is a data analysis case study about a fictitious company, Cyclistic, and the patterns of use by its customers. Cyclistic is an exciting new player that has rapidly expanded into downtown Chicago, with a strong base of annual members as well as casual riders. It's an authentic opportunity to practice the data analysis process analyzing real world data and scenarios. As the project continued, the scope grew, and far beyond my initial expectations. The straightforward and flexible nature of Python's syntax, as well as the host of modules it offers, makes it an ideal tool to conduct this analysis. The data is real, provided by [Motivate, Inc. that can be found here,](https://divvy-tripdata.s3.amazonaws.com/index.html) and the license agreement for the use of data [can be found here](). In addition, you can find a source file with my citations for this project. 

When discussing the source of the data, this project will refer to Motivate as the source for clarity; otherwise, this report will refer to Cyclistic.

# Executive Summary

## Business Task

Answer the question, "How do annual members and casual riders use Cyclistic bikes differently?"

## Key Findings

Analysis of 12 months of cyclistic ride data revealed clear and statistically significant differences in the ride patterns of annual members and casual riders. These differences show that to appeal to casual riders, Cyclistic should focus on campaigns and membership options that target recreational cyclists, focusing on downtown neighborhoods of Chicago that draw them, and especially during summer months.

## Top Three Recommendations

1. **Create options for recreational cyclists** - Rider data shows that casual riders differ from members in being more likely to ride for longer periods of time on weekends and during spring and summer months. Cyclistic should see to create marketing campaigns and membership plans that are tailored to their interests.
2. **Create a culture of cycling around Cyclistic in Chicago** Given the preference of casual riders for weekend biking during summer months, Cyclistic should partner with the city of Chicago and local businesses to create events focused on cycling such as bike jams or races. Cyclistic should focus on downtown neighborhoods such as the Loop, Near North Side, Near West Side, and Lake View.
3. **Emphasize benefits of commuter cycling** - Casual riders show a broader profile than current members, indicating that Cyclistic has built a solid core audience of dedicated cyclists who commute for functional purposes. It should work on expanding into more of its casual commuter audience, and may want to survey its casual riders to get their preferences on what might interest them in a membership.

## Company Profile

Cyclistic launched its bike-sharing offerings in 2016, expanding to a fleet of 5,824 bikes in a network of 692 stations across Chicago. It sets itself apart with a focus on inclusivity, by offering reclining bikes, hand tricycles, and cargo bikes. Riders can unlock a bike from one station and return it to any other at any time.

Its focus on building general awareness and appealing to broad consumer segments through flexiblle pricing plans has allowed Cyclistic to build a sizeable base of customers who purchase single-ride or full-day passes ("Riders"), as well as annual members. Casual riders are already aware of Cyclistic, and have chosen it for mobility needs.

## Business Objective

Cyclistic wants to maximize the number of annual members as key to future growth. Our goal, per the Director of Marketing, is to design strategies aimed at converting casual riders into annual members. It needs to understand the differences between the two groups, and how to convert casual riders into members.

## Key Questions

Marketing has set three key questions to guide this program:

1. How do annual members and casual riders use cyclistic bikes differently? *(This question is the focus of this report)*
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

To structure this analysis, we ask the following guiding questions:

- What is the provenance of the data?
- What limitations does the data present?
- What tools can help process and analyze the data?
- What methods of statistical analysis will best make sense of the data?
- What themes, connections, anomalies, or patterns exist in the data?
- How can the data be visualized to align with the findings?

# Data Integrity

### Source

Divvy Trip Data (Chicago Bike Share) - [https://divvybikes.com/system-data](https://divvybikes.com/system-data).

Chicago Community Areas - [Chicago Community Areas Boundaries Map](https://data.cityofchicago.org/Facilities-Geographic-Boundaries/Boundaries-Community-Areas-Map/cauq-8yn6)

### Time Period:

May 2025 to May 2026

### Initial Dataset Size

5,848,668 records, across 14 columns.

### Data Dictionary

| Variable | Description |
|----------|-------------|
| ride_id | Unique trip identifier |
| member_type | Annual member or casual rider |
| ride_length | Trip duration |
| started_at | Ride start timestamp |
| ended_at | Ride end timestamp |
| start_station_name | Origin station |
| end_station_name | Destination station |
| start_lat/lng | Origin coordinates |
| end_lat_lng |Destination coordinates |
| area numbe | Chicago Community Area number (original shapefile field name) |
| community | Official name of Chicago Community Area |
| area_num_1 | standardized numeric identifier |
| # shape_area |  Community Area polygon coordinates |
| # shape_len | Perimeter Length of Community Area polygon |
| # geometry | Polygon geometry defining spatial boundaries |

## Limitations

There is no personally identifiable information in the dataset, so any kind of demographic analysis is extremely limited. There is ultimately limited information on outlier rides, such as extremely short ones or long ones. Also, many of the records (`1.3mil) are not useful for analysis due to missing or imprecise data. The Chicago Community areas shapefile comes from a reliable source, but lacks the precision of e.g. U.S. census tracks. There is no accompanying demographic information to perform inferential analysis. According to the standard error measurement, however, the dataset's size makes it extremely unlikely to be unreliable as a representation of commuters. We feel the data in this analysis presents an accurate picture of use by Cyclistic's casual riders and annual members.

# Data Processing

## Tools Used

- Excel - initial exploration, sorting, and filtering of data to determine input to database.
- postgreSQL - Will allow for the safe storage, cleaning, and manipulation needed to clean and aggregate data. Use Dbeaver to access.
- PostGIS - an extension for postgreSQL that allows integration with geographic information systems (GIS), including a number of data types.
- Python - advanced manipulation of data and analysis.
- Psycopg/SQLAlchemy - Creating an engine that can connect to the server and conduct SQL queries
- (Geo)pandas - pandas is Python's data analysis library, and geopandas is built over it to allow the integration of GIS into pandas tools.
- get_pass - A module that securely asks the user for the server password.
- Plotly.express - Generating graphs to visualize data.

## Processing Methodology

- Excel spreadsheet to survey dataset, find obvious problems
- Imported to postgreSQL database via DBeaver, confirmed all columns match.
    - Used union to stack monthly files into yearly dataset.
    - Standardized variable data types.
    - Reordered columns for ease of use.
- SQL scripts to:
    - create table of row count and null values count per column.
    - replace all empty strings with null values.
    - Convert start and end times to timestamps
    - Create column of data type interval made (from end_time - start_time)
    - Use postGIS to convert starting and ending latitude and longtitude columns into (x,y) coordinates stored as geographic data type (CRS 4326).
    - Remove all records with null values.
    - generate cleaned data for wrangling in geopandas dataframe.

## Processing Results

### Dirty Data and Outliers:

- Inconsistencies - file types/names, data types
    - file "202501_divvytable" contains 2026_06 data
- Missing/Incomplete data - null values, empty string fields
    - No personally identifiable information
- Duplicates - 5 duplicate records between tables
- Outdated - none
- Inaccurate - GIS coordinates truncated to two decimals. Exceptionally short or long (i.e .001 seconds to 24+hrs)
    1,314,320 records total with missing station location information & truncated or missing coordinates
- All records with missing information removed, as well as top 1% and bottom 1% of results to eliminate outliers
- See cleaning log, python scripts/Jupyter notebooks, and the SQL queries listed in the appendices for more details.

### Understanding the Clean Data

- **Scope** After cleaning, this is a dataset of millions of data points. The results enclosed show statistically significant patterns with a high degree of precision.
- **Mean over Median** The average ride skews considerably higher in duration than the median, especially among casual riders. This points to an important subset of riders whose purposes differ.
- **Variance Among Casual Riders** Casual riders have a considerably wider range of rides according to central tendency than member riders. They also are more likely to vary with the seasons.
- **Geographic Concentraion** The datasets show rides are concentrated in the lakefront, downtown neighborhoods of Chicago.
- **Members vs. Casual Riders** Members show a more consistent profile of practical commuting, whereas casual riders commute to tourist destinations and for pleasure.
- **Anonymity** Open data with redacted personally identifiably information minimizes ability to classify ride users beyond those available (member, casual, bike_type)

# Data Analysis

## Methodology
- What methods of statistical analysis will best make sense of the data?

This analysis employs descriptive statistical methods and geospatial analysis to identify differences in bike-share usage between annual members and casual riders. It compares rider behavior across temporal, geographic, and quantitative dimensions to understand use patterns.

Ride counts and ride durations were aggregated by member type and analyzed across day_of_week, month, bike_type, and neighborhood to identify trends in ridership volume. Measures of central tendency, such as mean and median, distinguished trip characteristics of rider groups. Standard deviation helped evaluate variability within subgroups, and minimum and maximum values were used to identify potential outliers and assess the quality and integrity of the data.

PostgreSQL via DBeaver and Excel allowed for initial sorting, filtering, and inspection of the data. Data preparation, aggregation, and statistical analysis were conducted using pandas and Geopandas. Timestamps for each ride were used to aggregate ride counts for daily, weekly, and monthly analyses. A spatial join placing geographic coordins within Chicago Area shapefiles allowed rides to be aggregated by neighborhood and support the examination of spatial patterns in usage.

The accompanying scripts, notebooks, cleaning log, datasets, document the complete analytical workflow. Processing, analysis, and visualization were all accomplished in postgreSQL, and Geo(pandas) to develop business recommendations.

## Findings

1. **Ride Duration Analysis** - We investigated the distribution of ride durations, examining the median and average lengths of ride times, and the shape of their distribution. We found that casual riders vary more widely in the duration of their trips, and their ride_durations skew longer, with mean significantly higher than median. This suggests that they tend in comparison to be more likely to be recreational cyclists.
2. **Ride Frequency Analysis** - We aggregated the number of rides across the membership categories, and also aggregated their number by day of week, month, and Chicago neighborhoods. We found that generally speaking, member rides outnumber casual riders, but some areas (such as the Loop) show a higher relative proportion of casual riders, indicating a tendency towards recreational purposes.
3. **Day-of-Week, Monthly Trends** - When ride duration and ride frequency are compared across the days of the week, it is clear that member use peaks early in the week, remains consistent throughout, and then dips at the end of the week, remaining low through the weekend. By contrast, casual riders peak during the weekend and wane during the week.

## Visualization

NOTE: due to file size restrictions, this directory is limited from containing images of the files generated. Please locate the dataset and report online, at Kaggle if you are unable to generate these images on your local machine. 

 ### Chloropleth Maps
 
 By using publicly available shapefiles, we can map key statistical information about ride frequency and ride durations onto the neighborhoods of Chicago. Plotly Express allows for zooming, interaction, and a hovering tooltip.

 ### Violin Plot

Similar to a box and whisker plot, violin plots allow for the communication of both summary statistics and the distribution of data in ways that box plots or bar charts struggle to. Mean and median can describe the typical ride, but do not reveal how rides are distributed around these values. Violin plots show the median and quartiles, the density of observations, how the data skews, and if there are differences and variability between groups.

### Line Plots

We will need to analyze the duration and number of rides using mean, total, and categorization by day_of_week and month. A line plot allows for clear contrast for shifts in data points over time.

# Conclusion

This analysis demonstrates the statistically significant differences between the rider profiles of Cyclistic's annual members and casual riders. It suggests that focusing on the tending for casual riders to prefer longer rides seasonally and on weekends presents the best path forward. Cleaning, processing, and analyzing a dataset of this size presented many challenges, but allowed for clear patterns to be demonstrated for data-driven decision making, and for future lines of inquiry.

## Reflection

I'm putting the finishing touches on the initial draft of my completed report for this project. It will need to be cleaned up, polished, and put into a form where it can be publicized on github. At this point, however, all the necessary documentation has been generated, and the analysis is complete. I have debugged and tested my workflow from start to finish, and have not encountered any significant bugs after quite a bit of effort. Python is an easy language to pick up to due to the way its syntax resembles natural human language, and the library of packages available to assist with programming has allowed me to accomplish things in this language I would not have been able to otherwise.

Following the initial thread of seeing what postgreSQL could do with GIS coordinates ended up pushing this project into something far more ambitious than I originally intended. I'm glad I pursued these ambitions, however, as the resulting product allowed me to synthesize a lot of knowledge and skills, especially in Python, very quickly. I was able to integrate the information I learned from this Capstone and my own research to put together a report that exceeds my initial expectations. At the same time, Python's syntax, dynamic typing, and library of modules could make one overconfident without context. It was a real struggle to figure out how to wrangle the geodata onto a dataframe, and I want to go back and streamline my workflow. I should have made more commits on git to track my progress and monitor my thinking as I went.

The remaining work consists of taking this project, which is essentially complete, and packaging it into a form appropriate for publication. That will mean taking my oversized notebook and parceling it up into small notebooks. I should work to define functions I've generated, and create source code files for the user to reference. I have a fair amount of work to do to get to that point. At the same time, I know that there is room for polish and improvement, especially with regard to data visualization. At the same time, I feel satisfied with the quality, reliability, and validity of my data analysis. I enjoyed learning about Python, wrangling the data, and solving the problems presented by complex data processing. I hope that future projects can build on this model and allow me to explore other questions using increasingly sophisticated programming methods and statistical analysis. Projects like this help ensure I build that knowledge and skill base.

## Skills Demonstrated

**Data Analytics**
- Exploratory Data Analysis (EDA)
- Descriptive Statistics
- Data Cleaning
- Feature Engineering
- Business Insight Development

**Programming**

- Python
- SQL
- Pandas
- Data Visualization

**Geospatial Analytics**

- GeoPandas
- Spatial Analysis

**Communication**
- Data Storytelling
- Stakeholder Reporting
- Executive Summary Development