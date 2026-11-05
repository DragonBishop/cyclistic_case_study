## [1.4.0](https://github.com/DragonBishop/cyclistic_case_study/compare/v1.3.0...v1.4.0) - 2026-11-05

### 🚀 Features

- Add .copier-answers.yml for project configuration and remove from .gitignore ([d6f2840](https://github.com/DragonBishop/cyclistic_case_study/commit/d6f2840598d38c8f003bed70d530fdf028015d0b))

### ♻️ Refactor

- Move src/ into the cyclistic_case_study package ([e0d291f](https://github.com/DragonBishop/cyclistic_case_study/commit/e0d291fc63d8957b6255ea3598fa226f6efa41d1))

### ⚙️ Miscellaneous Tasks

- Sync repo with copier template v1.6.0 ([7d2dd25](https://github.com/DragonBishop/cyclistic_case_study/commit/7d2dd25e8cf787e33797b9865009fff1bbf3b87b))
- Update release configuration and versioning by bumping to copier template v1.7.0 ([26d7950](https://github.com/DragonBishop/cyclistic_case_study/commit/26d795069cc24c9ec164f5d96c4c3cebdd2e7388))
- Update project configuration and workflows for improved CI/CD processes, updating to python-copier-template-ds v.2.0.0 ([05a101f](https://github.com/DragonBishop/cyclistic_case_study/commit/05a101f5f65ec69555e6e84fa54ea28965e0011e))
- *(renovate)* Record the copier template's full git URL ([043ff9d](https://github.com/DragonBishop/cyclistic_case_study/commit/043ff9d7cd67989bcd822bccaa9773da37db3a86))
- Update copier template to v2.1.0 ([a787152](https://github.com/DragonBishop/cyclistic_case_study/commit/a7871522b21b55f18c3d3f2bc45b01894ded3cb9))
- Update dependencies and GitHub Actions versions by updating project template to v2.3.0 ([7dca831](https://github.com/DragonBishop/cyclistic_case_study/commit/7dca83194526e09621a04d084660882621743462))

## [1.3.0](https://github.com/DragonBishop/cyclistic_case_study/compare/v1.2.1...v1.3.0) - 2026-09-18

### 🚀 Features

- Integrate database connectivity for ride data analysis ([4ac9963](https://github.com/DragonBishop/cyclistic_case_study/commit/4ac99634f59c5c7c90701c07228d4c572684d716))

### 🐛 Bug Fixes

- Update release workflow to use GitHub app token for authentication ([1bcb30b](https://github.com/DragonBishop/cyclistic_case_study/commit/1bcb30be61de469f51fb65b3d890615e0e8e2341))
- Add missing matplotlib dependency to project requirements ([ecc9298](https://github.com/DragonBishop/cyclistic_case_study/commit/ecc9298692b17ea700f80ff3076b6f4ad1ec471e))

### ⚙️ Miscellaneous Tasks

- Update Python version requirement to 3.14.7 and adjust dependencies ([0c12227](https://github.com/DragonBishop/cyclistic_case_study/commit/0c12227d2b911242161ba4852baef8b2f22ad4b1))

## [1.2.1](https://github.com/DragonBishop/cyclistic_case_study/compare/v1.1.1...v1.2.1) - 2026-09-15

### 🚀 Features

- Implement PostGISConnector for database queries and update version to 1.1.1 ([33670ce](https://github.com/DragonBishop/cyclistic_case_study/commit/33670ce7ebc583ba22fb3baf9da274f1853bad83))

### ♻️ Refactor

- Streamline data analysis functions and improve code readability ([1d37fe2](https://github.com/DragonBishop/cyclistic_case_study/commit/1d37fe2ca8ab615e6e58f506de3fb05c59177566))
- Consolidate neighborhood data loading and processing into a single cell ([4d35e67](https://github.com/DragonBishop/cyclistic_case_study/commit/4d35e67ee463eec3f7160c3ff0ea7fbfc79a6820))
- Remove obsolete SQL files and improve null handling in queries ([218c3cc](https://github.com/DragonBishop/cyclistic_case_study/commit/218c3cc0ff85a12a085519bd84db94a9426cb476))
- Encapsulate neighborhood ride count logic into dedicated functions ([8272b39](https://github.com/DragonBishop/cyclistic_case_study/commit/8272b397177c6baf3beb9e3ebe5382cba2166e5f))
- Update PGISConnector to be more generic, refactor aggregation functions into separate script aggregation.py ([a936273](https://github.com/DragonBishop/cyclistic_case_study/commit/a9362731efc44d5e6e45c9efb867a58951fd14ca))

### ⚙️ Miscellaneous Tasks

- Bump version to 1.2.1 and update changelog ([8e30a58](https://github.com/DragonBishop/cyclistic_case_study/commit/8e30a5892fa63b71f2782264b22a021d73037ee4))

## [1.1.1](https://github.com/DragonBishop/cyclistic_case_study/compare/v1.1.0...v1.1.1) - 2026-08-31

### ⚙️ Miscellaneous Tasks

- Use dedicated PAT for release-please instead of repo Actions permission ([e5d601a](https://github.com/DragonBishop/cyclistic_case_study/commit/e5d601ad0e9e50dd96fb299db1ddf47bd5687172))

## [1.1.0](https://github.com/DragonBishop/cyclistic_case_study/releases/tag/v1.1.0) - 2026-08-31

### 🚀 Features

- Add raw data ingestion scripts ([2cb5508](https://github.com/DragonBishop/cyclistic_case_study/commit/2cb55081ce43d4270b64d03f956f900fb4189c04))
- Add duplicate detection and removal scripts ([74dc564](https://github.com/DragonBishop/cyclistic_case_study/commit/74dc5645a255257b1e1dd6b6fda8686a8eea5863))
- Add null and missing-value handling scripts ([cb30b92](https://github.com/DragonBishop/cyclistic_case_study/commit/cb30b923e1530bd8cdda7bb68cbcd3b9f414df8e))
- Add final cleaned ride-data table scripts ([9b296e7](https://github.com/DragonBishop/cyclistic_case_study/commit/9b296e7da4d4e1add96e413a98a5556be32e2c4b))
- Add Python SQL query engine ([ec8af39](https://github.com/DragonBishop/cyclistic_case_study/commit/ec8af396259161b9e1e8c99abb84ab3fd8230da5))
- Add Cyclistic ride data analysis notebook ([2800e88](https://github.com/DragonBishop/cyclistic_case_study/commit/2800e886c048c93d4313e62dabbfa49a71ef3cf2))
- Sync CI and tooling from python-copier-template-ds v1.4.0 ([d4fe1ad](https://github.com/DragonBishop/cyclistic_case_study/commit/d4fe1adc8c4db871881b036e98d9d41db83fb1fb))

### 🐛 Bug Fixes

- Apply ruff formatting to sql_query_engine.py ([f93d935](https://github.com/DragonBishop/cyclistic_case_study/commit/f93d935aaf8aa0388e345271e9c752aee82d7ce0))
- Ruff format notebook, merge startswith calls ([7df816e](https://github.com/DragonBishop/cyclistic_case_study/commit/7df816e34ed1260d6b7b9430aa7e77ce3191d675))

### 📚 Documentation

- Add data cleaning log ([a95988f](https://github.com/DragonBishop/cyclistic_case_study/commit/a95988f746e76a1a943978ef36c08f20a6bb61dc))
- Add final analysis report and bibliography ([da00ef6](https://github.com/DragonBishop/cyclistic_case_study/commit/da00ef65eae29a27b8d797a017ccb77e4dc0d1e8))
- Add feature-proposal and tech-debt issue templates ([57b1b6b](https://github.com/DragonBishop/cyclistic_case_study/commit/57b1b6b9c67c622bcd26d5a4ad35e0bc0dbba5ba))
- Finalize issue template wording and assignee defaults ([5c8e826](https://github.com/DragonBishop/cyclistic_case_study/commit/5c8e8262c6719f6faeb3d52e994f618fa1b77c1c))
- Clarify feature-proposal acceptance-criteria guidance ([5922455](https://github.com/DragonBishop/cyclistic_case_study/commit/5922455dd0d24416cd9d322d61dad14f8368e090))
- Simplify feature-proposal acceptance criteria ([3ae59ba](https://github.com/DragonBishop/cyclistic_case_study/commit/3ae59ba7c5d5774e2e0da71b55c2a77147c09526))
- Standardize issue template labels and field ownership ([daa6618](https://github.com/DragonBishop/cyclistic_case_study/commit/daa6618e30482a795d3ccad07c659dee656b38a9))
- Update README and report for new project structure ([260f40c](https://github.com/DragonBishop/cyclistic_case_study/commit/260f40c357c0d7ae558c70b235482cc41b4264c9))

### ♻️ Refactor

- Reorganize src/ into data and visualization ([6a3eb82](https://github.com/DragonBishop/cyclistic_case_study/commit/6a3eb82f2a245eda32b20d914c0608bb4dc0a39a))

### 🧪 Testing

- Add test suite scaffolding ([489bb11](https://github.com/DragonBishop/cyclistic_case_study/commit/489bb11aecdd8e1313af5d1d54cc339214afc6f4))

### ⚙️ Miscellaneous Tasks

- Initial project scaffolding ([dea9b62](https://github.com/DragonBishop/cyclistic_case_study/commit/dea9b626fd82020665225c95b27088d827f5b281))
- Normalize line endings and migrate dependency management to uv ([adb14a4](https://github.com/DragonBishop/cyclistic_case_study/commit/adb14a47eccd3bf599180538773ad0bcf8be0e53))
- Adopt copier project template scaffolding ([47ee208](https://github.com/DragonBishop/cyclistic_case_study/commit/47ee208674edf046466ada8668f45170483aebd3))
- Add GitHub Actions workflow ([3130601](https://github.com/DragonBishop/cyclistic_case_study/commit/3130601dcf2076fafc3b1ea6450ef3b143825105))
- Migrate issue templates to GitHub form schema ([dd496f2](https://github.com/DragonBishop/cyclistic_case_study/commit/dd496f26d0a76fbb04dd3e42fbb6dd14233112ac))
- Drop requirements.txt, uv now manages dependencies ([5ffb07e](https://github.com/DragonBishop/cyclistic_case_study/commit/5ffb07ea608468374ded476f0a592316c0f96794))

