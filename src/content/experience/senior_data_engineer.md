---
role: Senior Data Engineer
company: Jaguar Land Rover
period: 2022 — Present
current: true
stack: []
---

Part of the core Data Engineering team, focused on infrastructure,
developer tooling, and engineering standards across the data organisation.
Progressed from pipeline development and data products into platform and
infrastructure engineering, taking on technical leadership across several
working groups.

**Data Pipelines & Products**
Involved in the design, development and delivery of data pipelines and
data products across the organisation. Applied Data Contract standards
to enforce schema validation and detect data anomalies as part of the
pipeline quality framework.

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
Lead the Terraform working group, overseeing module standards, provisioning
patterns and infrastructure-as-code practices across the data platform.

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

**Python Task Orchestrator Evaluation — Lead**
Led a structured technical evaluation of enterprise Python task
orchestrators across two platforms. The evaluation involved building
end-to-end data pipelines including data validation, CI/CD integration,
event-triggered execution, cross-platform authentication, and integrations
with GCP, dbt, Dataform, and Snowflake. Assessment covered local and
cloud deployment, developer experience, private package management,
dependency isolation, and long-term maintainability. Produced a formal
evaluation report adopted as the technical recommendation to the Enterprise
Technology Board.
