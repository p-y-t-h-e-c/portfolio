---
role: Senior Data Engineer
company: Jaguar Land Rover
period: 2022 — Present
current: true
stack: []
---

Part of the core Data Engineering team within JLR's Data & AI Office (DAIO),
focused on infrastructure, developer tooling, and engineering standards.
Progressed from pipeline development and data products into platform
engineering, taking on technical leadership across multiple working groups.

**Data Pipelines & Products**

- Designed, developed and delivered ETL and ELT data pipelines for
  high-volume data applications using Python and SQL, incorporating
  automated data testing to ensure continuous data quality in deployment
- Evaluated Data Contract standards through hands-on testing, including
  dbt integration — and made a merged contribution to the Open Data
  Contract Standard (ODCS) open source project, shipped in v3.1.0

**CI/CD Working Group — Lead**
Own and maintain semantically versioned GitLab CI/CD pipeline templates
across the Data & AI Office and wider organisation, acting as one of the
primary merge request reviewers and approvers.

- Develop new templates and drive reusability, code quality, security,
  and consistency — enabling multiple teams across the enterprise to
  validate and deploy code quickly with enforced standards
- Refactored multiple existing pipelines into a modular structure of
  reusable components, default templates, and pipeline definitions —
  covering Docker image builds, container scanning, Cloud Run, Cloud
  Functions, and other deployment targets
- Led the Workload Identity Federation rollout, designing an
  authentication template that replaces long-lived credentials in CI/CD
  variables with short-lived OIDC tokens while remaining backward
  compatible with legacy Service Account Key projects — materially
  improving security posture across a high volume of daily pipeline runs
- Designed and delivered bespoke CI/CD pipelines for the Dagster and
  Astronomer Airflow orchestration platforms, enabling SaaS integration
  with automated, controlled deployments

**Terraform Working Group — Lead**
Lead the Terraform working group, owning module standards, provisioning
patterns, and infrastructure-as-code practices across the data platform.

- Build and maintain reusable Terraform modules that let teams provision
  cloud resources consistently via CI/CD, without bespoke infrastructure
  work per project
- Provisioned the Workload Identity Federation infrastructure — Pool,
  Provider, and bindings — underpinning keyless GitLab to GCP
  authentication across the organisation
- Refactored the Notifications System Terraform module end to end —
  Cloud Run services behind API Gateway, private Cloud SQL PostgreSQL
  with enforced SSL and automated backups, Memorystore Redis, and Secret
  Manager with least-privilege IAM access, all over private VPC networking

**Docker Images Working Group — Lead**
Lead the working group responsible for maintaining and improving
standardised Docker images stored in GCP Artifact Registry, used by the
DAIO and other teams.

- Maintain and improve custom runtime images for GitLab runners with the
  required tooling and dependencies pre-installed — removing runtime
  install steps from CI jobs, simplifying pipeline definitions, and
  reducing pipeline execution time
- Keep images current and secure through regular base image version
  updates and package maintenance

**Standards, Documentation & Best Practices**
Develop and maintain engineering standards, guides, and best practices
adopted by technical and non-technical teams across the organisation —
written as Docs as Code, versioned and reviewed alongside the code they
describe.

- Authored end-to-end documentation for key platform initiatives —
  including the Workload Identity Federation architecture, implementation
  and migration guide, the Notifications System, Terraform modules, test
  projects, Dagster and Astronomer Airflow guides, CI/CD components
  and pipeline templates and others
- Primary developer of standardised project setup scripts in Bash (Linux)
  and PowerShell (Windows), paired with pre-commit hooks for linting,
  formatting, and validation — promoting consistent development practices
  across teams

**Notable Projects**

- **Python Task Orchestrator Evaluation (Lead)** — structured evaluation
  of two enterprise orchestration platforms, building end-to-end data
  pipelines covering data validation, CI/CD integration, event-triggered
  execution, cross-platform authentication, and integrations with GCP,
  dbt, Dataform, and Snowflake. The formal evaluation report was adopted
  as the technical recommendation to the Enterprise Technology Board
- **Notifications System** — core developer of a GCP-based notifications
  system routing messages to email, Slack, and Jira based on subscription
  behaviour and API calls during pipeline execution
- **GitLab Instance Migration** — part of the team that designed and
  provisioned the Kubernetes cluster, namespace, and Helm module for
  self-hosted GitLab runners during a full instance migration, managed
  entirely via Terraform
- **Enterprise Data Platform Investigation** — contributed to a
  cross-functional investigation with the Enterprise Architect into the
  target layout and usage patterns for JLR's Enterprise Data Platform
