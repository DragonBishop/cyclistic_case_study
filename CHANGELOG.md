## [1.2.0] - 2026-09-03

### 🚀 Features

- Implement PostGISConnector for database queries and update version to 1.1.1

### 📚 Documentation

- Regenerate changelog for v1.1.1

### ♻️ Refactor

- Streamline data analysis functions and improve code readability

### ⚙️ Miscellaneous Tasks

- *(main)* Release 1.2.0
## [1.1.1] - 2026-08-31

### 📚 Documentation

- Regenerate changelog for v1.1.0

### ⚙️ Miscellaneous Tasks

- Use dedicated PAT for release-please instead of repo Actions permission
- *(main)* Release 1.1.1
## [1.1.0] - 2026-08-31

### 🚀 Features

- Add raw data ingestion scripts
- Add duplicate detection and removal scripts
- Add null and missing-value handling scripts
- Add final cleaned ride-data table scripts
- Add Python SQL query engine
- Add Cyclistic ride data analysis notebook
- Sync CI and tooling from python-copier-template-ds v1.4.0

### 🐛 Bug Fixes

- Apply ruff formatting to sql_query_engine.py
- Ruff format notebook, merge startswith calls

### 📚 Documentation

- Add data cleaning log
- Add final analysis report and bibliography
- Add feature-proposal and tech-debt issue templates
- Finalize issue template wording and assignee defaults
- Clarify feature-proposal acceptance-criteria guidance
- Simplify feature-proposal acceptance criteria
- Standardize issue template labels and field ownership
- Update README and report for new project structure

### ♻️ Refactor

- Reorganize src/ into data and visualization

### ⚙️ Miscellaneous Tasks

- Initial project scaffolding
- Normalize line endings and migrate dependency management to uv
- Adopt copier project template scaffolding
- Add GitHub Actions workflow
- Migrate issue templates to GitHub form schema
- Drop requirements.txt, uv now manages dependencies
- *(main)* Release 1.1.0

### Test

- Add test suite scaffolding
