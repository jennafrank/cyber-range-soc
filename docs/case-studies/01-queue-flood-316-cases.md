# Case study 01: The 316-case queue flood

**Type:** Detection engineering and queue operations
**Outcome:** Rules paused, queue clear within 24 hours, fix turned into a promotion requirement
**Author:** Jenna Frank, Security Operations Manager

## Summary

Unthresholded SOCBUILD test rules flooded the case queue with 316 Jira cases. Alert volume ran at about 286 to 293 per day from Jul 12 to Jul 15, 2026. I traced the flood to those rules, the rules were paused, and the queue was clear within 24 hours. Volume fell to 8 per day by Jul 17 to 18. The fix became governance: a rule reaches SOC-BUILD only with a threshold and a dedup key.

## Problem

The rules were brute-force test rules with **no threshold and no alert grouping**, so every matching event became its own alert, and each alert became its own case.

At the time, rule names used underscores (`SOCBUILD_...`). They were later renamed to the hyphenated `SOC-BUILD-...` convention used today.

## Investigation

Alert volume by day and rule:

```kql
SecurityAlert
| where TimeGenerated between (datetime(2026-07-11) .. datetime(2026-07-19))
| where AlertName startswith "SOCBUILD"
| summarize Alerts = count() by Day = bin(TimeGenerated, 1d), AlertName
| order by Day asc
```

Daily totals across the SOCBUILD rules:

| Day (2026) | Alerts |
|---|---|
| Jul 11 | 10 |
| Jul 12 to Jul 15 | about 286 to 293 per day |
| Jul 16 | 58 |
| Jul 17 | 8 |
| Jul 18 | 8 |

The jump on Jul 12 and the drop on Jul 16 line up with the unthresholded test rules running and then being paused. (Confidence: High. The timing matches; the per-rule breakdown from the query above is the supporting evidence.)

## Finding

The flood came from SOCBUILD test rules running with no threshold and no alert grouping.

The remaining 8 alerts per day as of Jul 18, 2026 came from three rules:

| Rule | Note |
|---|---|
| `SOCBUILD_Test_ValidAccounts_DeviceLogon` | Test rule |
| `SOCBUILD_Test_PowerShell` | Test rule |
| `SOCBUILD_PowerShell` | Production-named, but still querying `ago(7d)` with no threshold |

**True-positive count not established; tickets predate the disposition field.** The `SOC - Disposition` field was created on Jul 18, 2026, after the flood, so the 316 cases were not dispositioned through it.

## Resolution

1. The unthresholded test rules were paused.
2. The queue was clear within 24 hours.
3. Alert volume fell to 8 per day by Jul 17 to 18, 2026.
4. The fix became a promotion requirement: a rule reaches SOC-BUILD only with a threshold and a dedup key.
5. Since Jul 18, 2026, Alert Cases carry the `SOC - Disposition` field, so a future flood would have a measurable true-positive rate.

## Lesson

Noise is operational risk. A rule with no threshold and no grouping can bury the cases that matter. The requirement now sits in the promotion gate instead of depending on someone noticing, and the disposition field means the next flood can be measured, not just cleared.
