# Case study 01: The 316-case queue flood

**Type:** Detection engineering and queue operations
**Outcome:** Rule paused; the fix became the build standard
**Author:** Jenna Frank, Security Operations Manager

## Summary

One unthresholded test rule, `SOCBUILD_Test_BruteForce`, scoped to 1 host, flooded the case queue. It produced 228 alerts on Jul 8, 285 on Jul 10, and about 286 to 293 alerts per day from Jul 12 to 15, 2026, and the queue took 316 Jira cases in total. I traced the flood to that rule and it was paused. The fix became the build standard: a rule reaches SOC-BUILD only with a measured threshold and a dedup key.

## Problem

The rule was a brute-force test rule with **no threshold and no alert grouping**, so every matching event became its own alert, and each alert became its own case.

At the time, rule names used underscores (`SOCBUILD_...`). They were later renamed to the hyphenated `SOC-BUILD-...` convention used today.

## Investigation

### The test rule: `SOCBUILD_Test_BruteForce`

Alerts per day (SecurityAlert, UTC):

| Day (2026) | Alerts |
|---|---|
| Jul 8 | 228 |
| Jul 10 | 285 |
| Jul 12 to Jul 15 | about 286 to 293 per day |

| Queue impact | Jira cases |
|---|---|
| Total created by the flood | 316 |

### All SOCBUILD rules

Alert volume by day and rule, across every SOCBUILD rule:

```kql
SecurityAlert
| where TimeGenerated between (datetime(2026-07-11) .. datetime(2026-07-19))
| where AlertName startswith "SOCBUILD"
| summarize Alerts = count() by Day = bin(TimeGenerated, 1d), AlertName
| order by Day asc
```

Daily totals, all SOCBUILD rules (UTC). The counts came from a 7-day lookback run on Jul 18, so the first day of the window was partial and is left out, and Jul 18 is marked partial.

| Day (2026) | Alerts |
|---|---|
| Jul 12 to Jul 15 | about 286 to 293 per day |
| Jul 16 | 58 |
| Jul 17 | 8 |
| Jul 18 | 8 (partial day: the query ran on Jul 18) |

The drop to 58 on Jul 16 and 8 on Jul 17 follows the test rule being paused. (Confidence: High. The timing matches; the per-rule breakdown from the query above is the supporting evidence.)

## Finding

The flood came from one test rule running with no threshold and no alert grouping.

The remaining alerts on Jul 17 and 18, 2026 came from three rules:

| Rule | Note |
|---|---|
| `SOCBUILD_Test_ValidAccounts_DeviceLogon` | Test rule |
| `SOCBUILD_Test_PowerShell` | Test rule |
| `SOCBUILD_PowerShell` | Production-named, but still querying `ago(7d)` with no threshold |

**True-positive count not established; tickets predate the disposition field.** The `SOC - Disposition` field was created on Jul 18, 2026, after the flood, so the 316 cases were not dispositioned through it.

## Resolution

1. `SOCBUILD_Test_BruteForce` was paused.
2. Across all SOCBUILD rules, alert volume fell to 58 on Jul 16 and 8 on Jul 17, 2026 (Jul 18: 8, a partial day).
3. The fix became the build standard: a rule reaches SOC-BUILD only with a measured threshold and a dedup key. The dedup key is a promotion requirement; duplicate suppression in the Logic App was not built.
4. Since Jul 18, 2026, Alert Cases carry the `SOC - Disposition` field, so a future flood would have a measurable true-positive rate.

## After: rules built under the card

17 alerts across 6 rules, 2026-09-25 to 09-26 UTC (09-26 partial), 1 host per alert:

| Rule | Alerts |
|---|---|
| DEFEVADE-REGMOD-T1112 | 9 |
| INGRESSTOOLTRANSFER | 3 (2 hosts) |
| IMPACT-RANSOMNOTE-T1491.001 | 2 |
| NETWORKSERVICEDISCOVERY | 1 |
| PERSIST-RUNKEY-T1547.001 | 1 |
| DISCOVERY-ACCTENUM-T1087 | 1 |

One unthresholded test rule produced hundreds of alerts per day in July. Rules built under the card run at 1 to 9 alerts per rule per day. The two periods are not a controlled comparison: different rules, different weeks, different range activity.

Two open findings from this window are recorded in the [detection engineering repo's conformance review](https://github.com/jennafrank/pacific-watch-detection-engineering/blob/main/examples/PASSWORDSPRAY-ALWAYSONLINUX-T1110.003/v3-conformance-review.md): REGMOD fired 9 times on Sep 25, above the 3 to 5 per rule target, and two rule names do not follow the naming pattern.

## Lesson

Noise is operational risk. A rule with no threshold and no grouping can bury the cases that matter. The requirement now sits in the promotion gate instead of depending on someone noticing, and the disposition field means the next flood can be measured, not just stopped.
