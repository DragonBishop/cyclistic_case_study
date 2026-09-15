## [1.2.1] - 2026-09-15

### ♻️ Refactor

- Consolidate neighborhood data loading and processing into a single cell
- Remove obsolete SQL files and improve null handling in queries
- Encapsulate neighborhood ride count logic into dedicated functions
- Update PGISConnector to be more generic, refactor aggregation functions into separate script aggregation.py

## [1.3.0](https://github.com/DragonBishop/cyclistic_case_study/compare/v1.2.1...v1.3.0) (2026-09-15)


### Features

* add Cyclistic ride data analysis notebook ([2800e88](https://github.com/DragonBishop/cyclistic_case_study/commit/2800e886c048c93d4313e62dabbfa49a71ef3cf2))
* add duplicate detection and removal scripts ([74dc564](https://github.com/DragonBishop/cyclistic_case_study/commit/74dc5645a255257b1e1dd6b6fda8686a8eea5863))
* add final cleaned ride-data table scripts ([9b296e7](https://github.com/DragonBishop/cyclistic_case_study/commit/9b296e7da4d4e1add96e413a98a5556be32e2c4b))
* add null and missing-value handling scripts ([cb30b92](https://github.com/DragonBishop/cyclistic_case_study/commit/cb30b923e1530bd8cdda7bb68cbcd3b9f414df8e))
* add Python SQL query engine ([ec8af39](https://github.com/DragonBishop/cyclistic_case_study/commit/ec8af396259161b9e1e8c99abb84ab3fd8230da5))
* add raw data ingestion scripts ([2cb5508](https://github.com/DragonBishop/cyclistic_case_study/commit/2cb55081ce43d4270b64d03f956f900fb4189c04))
* implement PostGISConnector for database queries and update version to 1.1.1 ([33670ce](https://github.com/DragonBishop/cyclistic_case_study/commit/33670ce7ebc583ba22fb3baf9da274f1853bad83))
* sync CI and tooling from python-copier-template-ds v1.4.0 ([d4fe1ad](https://github.com/DragonBishop/cyclistic_case_study/commit/d4fe1adc8c4db871881b036e98d9d41db83fb1fb))


### Bug Fixes

* apply ruff formatting to sql_query_engine.py ([f93d935](https://github.com/DragonBishop/cyclistic_case_study/commit/f93d935aaf8aa0388e345271e9c752aee82d7ce0))
* ruff format notebook, merge startswith calls ([7df816e](https://github.com/DragonBishop/cyclistic_case_study/commit/7df816e34ed1260d6b7b9430aa7e77ce3191d675))


### Documentation

* add data cleaning log ([a95988f](https://github.com/DragonBishop/cyclistic_case_study/commit/a95988f746e76a1a943978ef36c08f20a6bb61dc))
* add feature-proposal and tech-debt issue templates ([57b1b6b](https://github.com/DragonBishop/cyclistic_case_study/commit/57b1b6b9c67c622bcd26d5a4ad35e0bc0dbba5ba))
* add final analysis report and bibliography ([da00ef6](https://github.com/DragonBishop/cyclistic_case_study/commit/da00ef65eae29a27b8d797a017ccb77e4dc0d1e8))
* clarify feature-proposal acceptance-criteria guidance ([5922455](https://github.com/DragonBishop/cyclistic_case_study/commit/5922455dd0d24416cd9d322d61dad14f8368e090))
* finalize issue template wording and assignee defaults ([5c8e826](https://github.com/DragonBishop/cyclistic_case_study/commit/5c8e8262c6719f6faeb3d52e994f618fa1b77c1c))
* regenerate changelog for v1.1.0 ([5ffd75b](https://github.com/DragonBishop/cyclistic_case_study/commit/5ffd75bea8b907815130241c444f470e51b95f56))
* regenerate changelog for v1.1.1 ([2f877c5](https://github.com/DragonBishop/cyclistic_case_study/commit/2f877c535be0f4dd5fdda9bf9ef813cdc8c05829))
* simplify feature-proposal acceptance criteria ([3ae59ba](https://github.com/DragonBishop/cyclistic_case_study/commit/3ae59ba7c5d5774e2e0da71b55c2a77147c09526))
* standardize issue template labels and field ownership ([daa6618](https://github.com/DragonBishop/cyclistic_case_study/commit/daa6618e30482a795d3ccad07c659dee656b38a9))
* update README and report for new project structure ([260f40c](https://github.com/DragonBishop/cyclistic_case_study/commit/260f40c357c0d7ae558c70b235482cc41b4264c9))

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
