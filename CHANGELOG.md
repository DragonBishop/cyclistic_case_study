## [1.2.1] - 2026-09-15

### ♻️ Refactor

- Consolidate neighborhood data loading and processing into a single cell
- Remove obsolete SQL files and improve null handling in queries
- Encapsulate neighborhood ride count logic into dedicated functions
- Update PGISConnector to be more generic, refactor aggregation functions into separate script aggregation.py

## [1.3.0](https://github.com/DragonBishop/cyclistic_case_study/compare/v1.2.1...v1.3.0) (2026-09-18)


### Features

* integrate database connectivity for ride data analysis ([4ac9963](https://github.com/DragonBishop/cyclistic_case_study/commit/4ac99634f59c5c7c90701c07228d4c572684d716))


### Bug Fixes

* add missing matplotlib dependency to project requirements ([ecc9298](https://github.com/DragonBishop/cyclistic_case_study/commit/ecc9298692b17ea700f80ff3076b6f4ad1ec471e))
* update release workflow to use GitHub app token for authentication ([1bcb30b](https://github.com/DragonBishop/cyclistic_case_study/commit/1bcb30be61de469f51fb65b3d890615e0e8e2341))

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

### ⚙️ Miscellaneous Tasks

- Use dedicated PAT for release-please instead of repo Actions permission
- *(main)* Release 1.1.1

### 📚 Documentation

- Regenerate changelog for v1.1.0

## [1.1.0] - 2026-08-31

### Test

- Add test suite scaffolding

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

### 🚀 Features

- Add raw data ingestion scripts
- Add duplicate detection and removal scripts
- Add null and missing-value handling scripts
- Add final cleaned ride-data table scripts
- Add Python SQL query engine
- Add Cyclistic ride data analysis notebook
- Sync CI and tooling from python-copier-template-ds v1.4.0
