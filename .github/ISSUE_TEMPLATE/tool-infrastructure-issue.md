---
name: Tool / Infrastructure Issue
about: Report a problem with SOC tooling or infrastructure that is affecting visibility or operations
title: "[TOOL ISSUE] "
labels: tool-issue, new, infra
assignees: ""
---

<!--
  Open this ticket as soon as you notice a tool problem — especially if it is affecting
  your ability to observe attacker activity. Tag the Infra point person immediately.
  Do not wait until the end of your shift.
-->

## Tool Affected

<!-- Select one and delete the rest -->
- Microsoft Sentinel
- Microsoft Defender for Endpoint (MDE)
- MISP
- Tenable
- OpenCanary (Honeypots)
- Microsoft Entra ID
- Azure Logic Apps
- Other — specify below

**If Other, specify:**

---

## What Broke

<!-- Describe what is not working. Be specific: what did you expect to see vs. what are you actually seeing? -->

**Expected behavior:**

**Actual behavior:**

---

## When Noticed

**Date/Time (UTC):**
**Discovered by:**

<!-- Was this noticed during normal operations or did something trigger the alert? -->

---

## Impact on Visibility

<!-- How is this affecting our ability to observe attacker activity across the range? -->
<!-- Examples: alerts not firing, logs not ingesting, honeypots offline, telemetry gap on specific assets -->

---

## Affecting an Active Tracking Case?

**Yes / No**

**If yes, link the tracking case:** #

<!-- Describe how the tool issue is impacting the active case -->

---

## Steps to Reproduce

<!-- If applicable, describe how someone else can observe the same issue -->

1.
2.
3.

---

## Screenshots / Evidence

<!-- Attach screenshots, error messages, or log snippets below -->
<!-- You can drag and drop images directly into this text box -->

---

## Severity of Impact

<!-- Select one and delete the rest -->
- Critical — Complete loss of visibility or core tool offline; active tracking case affected
- High — Major degradation; significant gaps in telemetry or alerting
- Medium — Partial degradation; workarounds available
- Low — Minor issue; minimal operational impact

---

## Assignment

**Assigned To (tag Infra point person):** @
