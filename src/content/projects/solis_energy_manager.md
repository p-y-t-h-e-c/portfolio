---
title: Solis Battery Manager
summary: Automated solar energy monitoring pipeline — from inverter API to daily email notifications.
stack:
  [
    Dagster,
    Python,
    Docker,
    PostgreSQL,
    GitHub Actions,
    GitHub Container Registry,
    API,
    Pingram,
  ]
url: https://github.com/p-y-t-h-e-c/solis_energy_manager
---

A personal data pipeline monitoring solar panel performance and battery
status using the Solis Cloud API. Runs on a schedule, validates inverter
data, and delivers a daily summary notification via email covering battery
charge status, PV generation, and energy exported to the grid.

**Pipeline**
Dagster-based pipeline with scheduled execution — ingests data from the
Solis Cloud API using HMAC-signed authentication, validates the response,
and triggers a Pingram email notification with the day's solar metrics.

**Infrastructure & Deployment**
Full production-grade Dagster deployment: separate code server, webserver,
and daemon services orchestrated via Docker Compose, with PostgreSQL
backing run history and schedule state. Multi-platform Docker images
(amd64/arm64) built and pushed to GitHub Container Registry on every
merge to main. GitHub Actions handles the complete pipeline — build,
publish, SSH to Oracle Cloud VM, pull the new image, create environment
variables on the fly, and restart the stack with zero manual intervention.

**Documentation**
The project is backed by comprehensive documentation written for both
operational use and future reference — covering architecture decisions,
deployment runbook, environment setup, API authentication approach, and
local development guide. Written with the same standard applied
professionally at JLR: if someone else needs to pick this up, or future
me returns after a year away, the documentation should be enough to get
back to a running state without guesswork.

**Why it matters**
Built entirely outside of work on real infrastructure, this project
demonstrates a complete engineering workflow: API integration with
custom authentication, data validation, containerised multi-service
deployment, secrets management, multi-platform builds, and automated
CI/CD — using the same tools and patterns applied professionally.
