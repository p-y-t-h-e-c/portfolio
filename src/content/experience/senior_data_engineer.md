---
role: Senior Data Engineer
company: "TBC"
period: 2022 — Present
current: true
stack:
  [
    GCP,
    Terraform,
    GitLab CI/CD,
    Docker,
    Dagster,
    Python,
    PostgreSQL,
    Cloud Run,
    Airflow,
    Snowflake,
    dbt,
  ]
---

Part of the core Data Engineering platform team, focused on infrastructure,
developer tooling, and engineering standards across the data organisation.
Progressed from pipeline development into platform and infrastructure
engineering, taking on technical leadership across several working groups.

**CI/CD Working Group — Lead**
Lead the GitLab custom CI/CD pipelines working group, responsible for
refactoring, improving and standardising pipeline templates across the
data engineering organisation. Designed a reusable authentication template
supporting both Workload Identity Federation and legacy Service Account Key
methods, ensuring backward compatibility across all existing projects.

**Workload Identity Federation — Owner & Lead**
Sole owner of the WIF rollout between GitLab and GCP. Designed and
provisioned the full infrastructure via Terraform — Pool, Provider and
bindings — and redesigned the GitLab CI/CD authentication layer to support
WIF while remaining fully compatible with existing projects. Fully
documented end to end.

**Docker Images Working Group — Lead**
Lead the working group responsible for designing, maintaining and building
custom Docker images stored in GCP Artifact Registry, used across data
engineering pipelines and services.

**Terraform Working Group — Lead**
Recently took on leadership of the Terraform working group, overseeing
module standards, provisioning patterns and infrastructure-as-code
practices across the data platform.

**Notifications System**
One of the core developers of a GCP-based notifications system that
triggers messages to the right channels based on subscription behaviour
and API endpoint calls during pipeline execution. Fully refactored the
Terraform module for Cloud Run and PostgreSQL infrastructure, and authored
extensive documentation covering database management and operational
runbooks.

**GitLab Instance Migration**
Part of the team that designed and provisioned the Kubernetes cluster,
namespace and Helm module for GitLab runners during a full GitLab instance
migration — infrastructure managed entirely via Terraform.

**Python Task Orchestrator POC — Lead**
Led the evaluation of enterprise Python task orchestrators, assessing
Astronomer and Dagster against defined criteria. Produced a technical
evaluation report adopted as the recommendation to the Enterprise
Technology Board — Dagster selected as the preferred platform.
