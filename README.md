# Cyclistic Case Study

This repository contains the Cyclistic Bike-Share Case Study analysis. Cyclistic is a fictional bike-sharing service (based on Chicago’s Divvy/Bluebikes) used for a data analytics capstone project. The analysis uses Python (pandas, NumPy, GeoPandas), PostgreSQL/PostGIS, and VS Code with the Data Wrangler extension to explore rider behavior and generate insights. JupyterLab notebooks are used for interactive data wrangling, processing, and visualization. A Zotero-managed bibliography file is included for managing citations.

# Repository Structure

- notebooks/ – Jupyter notebooks for each analysis step (data cleaning, exploration, statistics, mapping, etc.).
- reports/ – Final outputs and reports (e.g. slides, PDFs) summarizing the findings.
- src/ – Python modules and utility scripts (database connectors, analysis functions, etc.).
- requirements.txt – Lists all Python dependencies needed (see Installation below).
- references.bib – A Zotero-exported bibliography for citations used in the reports.
- README.md – Readme with setup and usage instructions.
- license.md license for project code and documentation only.

# Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/cyclistic_case_study.git
cd cyclistic_case_study
```

2. Ensure Python 3.8+ is installed. Create and activate a virtual environment:

```bash
python3 -m venv env
env\Scripts\activate
```

3. Install the required dependencies:

```bash
pip install -r requirements.txt
```

4. Install VS Code if it is not already installed. Optionally install the Data Wrangler extension (requires Python 3.8+) to inspect and manipulate DataFrames interactively.

5. Optionally install PostgreSQL and enable the PostGIS extension. Create a database for the project and configure any required connection settings.

6. `references.bib` contains the project's bibliography. It can be managed using Zotero or imported into another citation management tool.

# Usage

- Running notebooks: Launch JupyterLab or use VS Code’s Jupyter interface. Open the notebooks in the notebooks/ folder to run the analysis step by step. The Data Wrangler extension can be launched from a notebook to interactively clean and transform DataFrames.
- Data and Results: Sample data is not included in the repository. You must import the Cyclistic/Divvy trip datasets into your Postgres database or load CSV files as needed. The notebooks assume data tables (with geographic columns) are available in the database. Use GeoPandas to run spatial queries or visualize geospatial data (station locations, city map, etc.).
- Visualizations: Analysis and charts are created using Matplotlib and Plotly. The notebook code will generate figures based on the data. (Visual outputs are not stored in this repo by default – they can be saved to files or included in reports later.)
- Citations: When writing analysis in notebooks or preparing reports, cite sources using the citation keys in references.bib. If using the JupyterLab Citation Manager, it will automatically sync with your Zotero library and format citations/bibliography.

# Contributing

Contributions and feedback are welcome! To contribute:

    Fork this repository.
    Create a new branch for your feature or bugfix.
    Commit changes with clear messages.
    Open a pull request for review.

Please use GitHub Issues to report bugs or request enhancements. Keep code and notebooks well-documented.

Code: MIT License
Data: Subject to the original data provider's terms of use.

# Data Source

The dataset used in this project is provided by the original data owner and is
subject to their licensing and usage terms. This repository's MIT License
applies to the project code and documentation only.

# Contact

For questions or support, please open an issue on this GitHub repository.