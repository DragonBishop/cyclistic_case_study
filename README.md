# Cyclistic Case Study

## Table of Contents

* [Project Overview](#project-overview)
* [Data Sources](#data-sources)
* [Directory Structure](#directory-structure)
* [Environment Setup](#environment-setup)
* [Usage](#usage)
* [Methodology](#methodology)
* [Results](#results)
* [Contributing](#contributing)
* [License](#license)

## Project Overview

This repository contains the Cyclistic Bike-Share Case Study analysis. Cyclistic is a fictional bike-sharing service (based on Chicago's Divvy/Bluebikes) used for a data analytics capstone project. The analysis uses Python (pandas, NumPy, GeoPandas), PostgreSQL/PostGIS, and VS Code with the Data Wrangler extension to explore rider behavior and generate insights. JupyterLab notebooks are used for interactive data wrangling, processing, and visualization. A Zotero-managed bibliography file is included for managing citations.

## Data Sources

The dataset used in this project is provided by the original data owner and is subject to their licensing and usage terms. This repository's MIT License applies to the project code and documentation only.

## Directory Structure

```text
├── justfile                        # Command runner recipes (setup, tests, etc.)
├── notebooks                       # Jupyter notebooks for each analysis step (data cleaning, exploration, statistics, mapping, etc.)
│   └── cyclistic_data_analysis_notebook.ipynb
├── pyproject.toml                  # Configuration file for project and dependency management
├── reports                         # Final outputs and reports summarizing the findings
│   ├── REPORT.md                   # Full write-up: summary, methodology, findings
│   ├── cleaning_log.md             # Running log of data-cleaning decisions
│   └── bibliography_cyclistic.bib  # Zotero-exported bibliography for citations used in the reports
├── src
│   ├── data                        # SQL scripts and the database query engine (connectors, cleaning, aggregation)
│   └── visualization                # Scripts to create exploratory and results-oriented visualizations
├── tests                           # Unit tests and integration tests
│   ├── __init__.py
│   └── test_example.py
├── license.md                      # License for project code and documentation only
└── README.md                       # The top-level README for developers using this project
```

## Environment Setup

Instructions on how to set up the isolated computational environment to run the analysis scripts. Choose the package manager that fits your workflow.

```bash
# Clone the repository
git clone https://github.com/DragonBishop/cyclistic_case_study.git
cd cyclistic_case_study
```

### Option 1: uv

```bash
# uv sync automatically creates the .venv and installs dependencies from pyproject.toml
uv sync
source .venv/bin/activate  # On Windows use `.venv\Scripts\activate`, or run via WSL2 terminal
```

### Option 2: Standard pip (venv)

```bash
python -m venv .venv
source .venv/bin/activate  # On Windows use `.venv\Scripts\activate`, or run via WSL2 terminal
pip install .              # Installs dependencies listed in pyproject.toml
```

### Option 3: Poetry

```bash
poetry install
poetry shell
```

### Additional Tools

Install VS Code if it is not already installed. Optionally install the Data Wrangler extension (requires Python 3.8+) to inspect and manipulate DataFrames interactively.

Optionally install PostgreSQL and enable the PostGIS extension. Create a database for the project and configure any required connection settings.

## Usage

- **Running notebooks:** Launch JupyterLab or use VS Code's Jupyter interface. Open the notebooks in the `notebooks/` folder to run the analysis step by step. The Data Wrangler extension can be launched from a notebook to interactively clean and transform DataFrames.
- **Data and Results:** Sample data is not included in the repository. You must import the Cyclistic/Divvy trip datasets into your Postgres database or load CSV files as needed. The notebooks assume data tables (with geographic columns) are available in the database. Use GeoPandas to run spatial queries or visualize geospatial data (station locations, city map, etc.). The SQL scripts and query engine used to build and query the cleaned dataset live in `src/data/`.
- **Visualizations:** Analysis and charts are created using Matplotlib and Plotly. The notebook code will generate figures based on the data. (Visual outputs are not stored in this repo by default – they can be saved to files or included in reports later.)
- **Citations:** `reports/bibliography_cyclistic.bib` contains the project's bibliography and can be managed using Zotero or imported into another citation management tool. When writing analysis in notebooks or preparing reports, cite sources using the citation keys in this file. If using the JupyterLab Citation Manager, it will automatically sync with your Zotero library and format citations/bibliography.

## Methodology

Data moves from Excel (initial exploration) into a PostgreSQL/PostGIS database (cleaning, aggregation, and geospatial processing), then into Python/GeoPandas for statistical analysis and visualization. See `reports/REPORT.md` for the full methodology write-up and `reports/cleaning_log.md` for the detailed, dated log of cleaning decisions.

## Results

Analysis of 12 months of Cyclistic ride data revealed clear and statistically significant differences in the ride patterns of annual members and casual riders. See `reports/REPORT.md` for the full Key Findings, Top Three Recommendations, and supporting analysis.

## Contributing

Contributions and feedback are welcome!

1. Fork this repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes with clear messages.
4. Push to the branch.
5. Open a pull request for review.

Please use GitHub Issues to report bugs or request enhancements. Keep code and notebooks well-documented.

## License

This project is licensed under the MIT License — see [license.md](license.md) for the full text.

Code: MIT License. Data: subject to the original data provider's terms of use — this repository's MIT License applies to the project code and documentation only.

## Contact

For questions or support, please open an issue on this GitHub repository.
