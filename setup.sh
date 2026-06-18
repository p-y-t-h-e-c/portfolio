#!/usr/bin/env bash

set -o pipefail

# -----------------------------------------------------------------------------
# ⚙️ Configuration
# -----------------------------------------------------------------------------
# 🌱 Default virtual environment directory
VENV_DIR=".venv"


# 🎨 Colors
NC='\033[0m'
CYAN='\033[0;36m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'


# -----------------------------------------------------------------------------
# 🎯 Logging Functions
# -----------------------------------------------------------------------------
print_info()  { echo -e " 💡 [${CYAN}INFO${NC}]   ${CYAN}$1${NC}"; }
print_task()  { echo -e " ⚡ [${YELLOW}TASK${NC}]   ${YELLOW}$1${NC}"; }
print_pass()  { echo -e " ✅ [${GREEN}PASS${NC}]   ${GREEN}$1${NC}"; }
print_warn()  { echo -e " ⚠️ [${MAGENTA}WARN${NC}]   ${MAGENTA}$1${NC}"; }
print_error() { echo -e " ❌ [${RED}FAIL${NC}]   ${RED}$1${NC}"; }


# -----------------------------------------------------------------------------
# 🔍 uv Check
# -----------------------------------------------------------------------------
uv_status_check() {
  print_info "Checking uv..."

  if ! command -v uv &> /dev/null; then
    print_warn "uv not found."
    print_task "Installing..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    print_pass "uv installed."
  else
    print_pass "uv is already installed."
  fi
}

uv_project_init_check() {
  print_info "Checking uv project init..."

  local output
  output="$(uv init 2>&1)"
  local exit_code=$?

  if echo "${output}" | grep -q "already initialized"; then
    print_pass "Project already initialised."
		print_info "Please ensure your pyproject.toml is correctly configured."
  elif [[ ${exit_code} -eq 0 ]]; then
    print_pass "Project initialised successfully."
		print_info "Please take a look at the generated pyproject.toml and adjust it to your needs."
  else
    print_error "uv init failed: ${output}"
    return 1
  fi
}


# -----------------------------------------------------------------------------
# 📦 Version Utilities
# -----------------------------------------------------------------------------
get_current_pre_commit_version() {
  uv pip show pre-commit 2>/dev/null \
    | grep -Eo '[0-9]+(\.[0-9]+){1,2}' \
    | head -n1
}

get_latest_pre_commit_version() {
  curl -s https://pypi.org/pypi/pre-commit/json \
    | grep -Eo '"version":"[^"]*"' \
    | head -n1 \
    | cut -d'"' -f4
}


# -----------------------------------------------------------------------------
# 🔧 pre-commit Management
# -----------------------------------------------------------------------------
pre_commit_status_check() {
  print_info "Checking pre-commit..."
  local current_version latest_version

  if ! command -v pre-commit >/dev/null 2>&1; then
    print_warn "pre-commit is missing."
    print_task "Installing..."
    uv add --dev pre-commit
    print_pass "pre-commit installed."
  else
    print_pass "pre-commit is installed."
  fi

  current_version="$(get_current_pre_commit_version)"
  latest_version="$(get_latest_pre_commit_version)"

  print_info "Current version: ${current_version}"
  print_info "Latest version:  ${latest_version:-unknown}"

  if [[ -z "${latest_version}" ]]; then
    print_warn "Could not reach PyPI to check latest version — skipping upgrade."
    return 0
  fi

  if [[ "${current_version}" == "${latest_version}" ]]; then
    print_pass "pre-commit is up to date (${current_version})."
  else
    print_warn "pre-commit is outdated."
    print_task "Upgrading ${current_version} → ${latest_version}..."
    uv lock --upgrade-package pre-commit
    uv sync --all-groups --all-extras
    current_version="$(get_current_pre_commit_version)"
    if [[ "${current_version}" == "${latest_version}" ]]; then
      print_pass "pre-commit upgraded to ${latest_version}."
    else
      print_error "Upgrade failed — current version is still ${current_version}."
      return 1
    fi
  fi
}


# -----------------------------------------------------------------------------
# 📄 Config File Creation
# -----------------------------------------------------------------------------
pre_commit_config_create() {
  cat << EOF > .pre-commit-config.yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v5.0.0
    hooks:
      - id: check-added-large-files
      - id: check-json
      - id: check-yaml
      - id: detect-private-key
      - id: end-of-file-fixer
      - id: no-commit-to-branch
        args: ["--branch", "main"]
      - id: trailing-whitespace

  - repo: https://github.com/pre-commit/mirrors-prettier
    rev: v3.1.0
    hooks:
      - id: prettier
        files: \.(astro|ts|js|css|md)$
EOF
}

commitlintrc_create() {
  cat << EOF > .commitlintrc.json
{
  "rules": {
    "body-leading-blank": [1, "always"],
    "footer-leading-blank": [1, "always"],
    "header-max-length": [2, "always", 72],
    "scope-case": [2, "always", "upper-case"],
    "scope-empty": [2, "never"],
    "subject-case": [2, "never", ["start-case", "pascal-case", "upper-case"]],
    "subject-empty": [2, "never"],
    "subject-full-stop": [2, "never", "."],
    "type-case": [2, "always", "lower-case"],
    "type-empty": [2, "never"],
    "type-enum": [
      2,
      "always",
      [
        "build",
        "chore",
        "ci",
        "docs",
        "feat",
        "fix",
        "perf",
        "refactor",
        "revert",
        "style",
        "test"
      ]
    ]
  }
}
EOF
}


# -----------------------------------------------------------------------------
# 🔍 Virtual Environment Check
# -----------------------------------------------------------------------------
virtual_environment_check() {
  print_info "Checking virtual environment status..."

  if [[ -d "${VENV_DIR}" ]] && [[ -f "${VENV_DIR}/bin/activate" ]]; then
    if [[ -n "${VIRTUAL_ENV}" ]]; then
      print_pass "Virtual environment found and active."
    else
      print_info "Virtual environment found but not active."
      print_task "Activating..."
      source "${VENV_DIR}/bin/activate"
    fi
  else
    print_warn "No virtual environment found."
    print_task "Creating and activating..."
    uv sync --all-groups --all-extras
    source "${VENV_DIR}/bin/activate"
  fi
}


# -----------------------------------------------------------------------------
# 🔧 Config File Checks
# -----------------------------------------------------------------------------
commitlintrc_file_check() {
  print_info "Checking .commitlintrc.json..."
  if [[ -f ".commitlintrc.json" ]]; then
    print_pass ".commitlintrc.json already exists, please ensure it has the correct format."
  else
    print_warn ".commitlintrc.json is missing."
    print_task "Creating..."
    commitlintrc_create
    print_pass ".commitlintrc.json created."
  fi
}


# -----------------------------------------------------------------------------
# 🔧 Pre-commit Hooks Check
# -----------------------------------------------------------------------------
commitlint_hook_check() {
  if grep -v '^[[:space:]]*#' .pre-commit-config.yaml | grep -Eq "commit-msg|commitlint"; then
    print_task "Installing commit-msg hook..."
    pre-commit install --hook-type commit-msg
    commitlintrc_file_check
  fi
}

pre_commit_hooks_check() {
  print_info "Checking pre-commit hooks..."
  if [[ -f ".pre-commit-config.yaml" ]]; then
    print_pass ".pre-commit-config.yaml already exists, please ensure it has the correct format."
  else
    print_warn ".pre-commit-config.yaml is missing."
    print_task "Creating..."
    pre_commit_config_create
    print_pass ".pre-commit-config.yaml created."
  fi

	print_task "Updating and installing hooks..."
	pre-commit autoupdate
	pre-commit install
	commitlint_hook_check
}


# -----------------------------------------------------------------------------
# 🚀 Execution Flow
# -----------------------------------------------------------------------------
uv_status_check
uv_project_init_check
pre_commit_status_check
virtual_environment_check
pre_commit_hooks_check

print_pass "Setup completed!"
