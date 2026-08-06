module_name := "cyclistic_case_study"

# list commands
default:
  @just --list

# install the packages
install:
  {{ if path_exists("uv.lock") == "true" { "uv sync --all-groups --all-extras --locked --inexact" } else { "uv sync --all-groups --all-extras --inexact" } }}

# setup for development
setup: install git-setup

# run test coverage and create
test-cov:
  uv run pytest

# update packages and uv lock file
update:
  uv sync -U --all-groups --all-extras --inexact

# set up the nbwipers git filter so notebooks stay clean on commit
git-setup:
  @[ -d .git ] || git init
  uv run nbwipers install local
