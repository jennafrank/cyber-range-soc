# Contributing to Pacific Watch

Welcome. This is how new analysts get set up and pick up their first piece of work. For the full guide, read [docs/onboarding.md](docs/onboarding.md).

## Before your first shift

1. **Send your Gmail to the point person on Skool.** You need a Gmail address to access the shared Google Workspace resources: shift documents, tracking sheets, and collaborative materials.
2. **Claim your role on Skool.** Find the signup post and claim the role and team that fit where you want to contribute. This puts you on the right team and the right shift rotation.

## The six teams

| Team | What they do |
|---|---|
| **Detection Engineering** | Builds, tunes, and maintains detection rules and analytics in Microsoft Sentinel. |
| **Process & Documentation** | Writes and maintains the SOPs, templates, runbooks, and documentation that keep the SOC running. |
| **Tracking & Incident Response** | Monitors attacker activity across the range, tracks post-compromise behavior, and manages the incident record. |
| **Threat Intelligence** | Collects, analyzes, and shares intelligence about attacker TTPs using MISP and other sources. |
| **Infrastructure & Tooling** | Manages the Azure environment, integrations, and tooling, and keeps the range operational. |
| **Mini SOC Honeypot Team** | Operates the OpenCanary honeypot network and analyzes the activity it generates. |

## Analyst levels

The ladder runs T1 → T2 → Shift Lead → Specialization.

| Level | Role |
|---|---|
| **T1** | Contributor: learns the environment, executes tasks, follows runbooks |
| **T2** | Builder / Owner: owns deliverables, mentors T1s, leads workstreams |
| **Shift Lead** | Runs the shift, coordinates across teams, makes sure tickets are filed |
| **Specialization** | Detection engineer, threat hunter, or Head Investigator |

## Picking up work

1. Browse open Jira tickets and find one that matches your skills or interests.
2. Comment on the ticket to claim it before you start.
3. Update the Jira ticket as you work, and when you finish.

On an Alert Case you enter two fields: **Triage Note** and **Disposition**. Disposition is one of seven values: True Positive – Malicious, Authorized Participant Activity, Authorized Simulated Activity, False Positive, Benign Positive, Insufficient Evidence, or Duplicate.

Cases are raised in Microsoft Defender and tracked in Jira. Case management is moving to DFIR-IRIS.

## Rules to know on day one

- **Advisory only.** You investigate, document, and recommend. You do not remediate. See [docs/rules-of-engagement.md](docs/rules-of-engagement.md).
- **If there is no ticket, it did not happen.** Every observation, alert, investigation thread, and completed task needs a Jira ticket.
- **Hand off every open case** before your shift ends. See [docs/shift-handoff-process.md](docs/shift-handoff-process.md).
- **Escalate early.** See [docs/escalation-matrix.md](docs/escalation-matrix.md).

Questions go to your Shift Lead.
