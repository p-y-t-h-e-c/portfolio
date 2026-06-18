---
title: Octopus Energy Dashboard
summary: End-to-end personal energy monitoring pipeline — from API ingestion to Grafana dashboards.
stack: [Dagster, Python, PostgreSQL, Grafana, GitHub Actions, Docker]
url: ""
---

Built a personal data pipeline to track and visualise energy costs and
consumption using the Octopus Energy API. The project covers the full
data lifecycle — ingestion, transformation, storage, and visualisation.

**Pipeline**
Dagster-based pipeline runs multiple times daily, pulling variable tariff
rates and consumption data from the Octopus API, performing cleaning and
transformation in Python, and writing to a PostgreSQL database hosted on
an Oracle Cloud VM.

**Infrastructure & Deployment**
GitHub Actions handles deployment, authenticating to the Oracle VM and
deploying the Dagster pipeline automatically. The database is connected
to a Grafana dashboard providing day-on-day and week-on-week comparisons,
including year-over-year cost tracking.

**Why it matters**
Built entirely outside of work, this project touches every layer of a
real data platform — orchestration, transformation, storage, deployment
and visualisation — using the same tools evaluated professionally
(Dagster) and hosted on real infrastructure.
