# Case study 01: The 316-case queue flood

**Type:** Detection engineering and queue operations
**Outcome:** Rule paused; the fix became the build standard
**Author:** Jenna Frank, Security Operations Manager

## Summary

One unthresholded test rule, `SOCBUILD_Test_BruteForce`, scoped to 1 host, flooded the case queue. It produced 210 to 292 alerts per day from Jul 8 to 15, 2026, and 49 more on Jul 16 before it was paused: 2,210 alerts in total. Separately, the queue took 316 Jira cases. I traced the flood to that rule and it was paused. The fix became the build standard: a rule reaches SOC-BUILD only with a measured threshold and a dedup key.

## Problem

The rule was a brute-force test rule with **no threshold and no alert grouping**, so every matching event became its own alert, and each alert became its own case.

At the time, rule names used underscores (`SOCBUILD_...`). They were later renamed to the hyphenated `SOC-BUILD-...` convention used today.

## Investigation

Alerts per day, SOCBUILD and SOC-BUILD rules, split into the flood rule and all other rules (SecurityAlert, full days, UTC). Run on 2026-09-25, this query returns the 12 rows below.

```kql
SecurityAlert
| where TimeGenerated between (datetime(2026-07-01) .. datetime(2026-07-20))
| where AlertName startswith "SOCBUILD" or AlertName startswith "SOC-BUILD"
| summarize Flood      = countif(AlertName startswith "SOCBUILD_Test_BruteForce"),
            OtherRules = countif(not(AlertName startswith "SOCBUILD_Test_BruteForce")),
            Total      = count()
    by Day = startofday(TimeGenerated)
| order by Day asc
```

| Day (2026, UTC) | Flood rule (`SOCBUILD_Test_BruteForce`) | Other rules | Total |
|---|---|---|---|
| Jul 8 | 228 | 0 | 228 |
| Jul 9 | 210 | 0 | 210 |
| Jul 10 | 285 | 0 | 285 |
| Jul 11 | 284 | 0 | 284 |
| Jul 12 | 288 | 0 | 288 |
| Jul 13 | 288 | 0 | 288 |
| Jul 14 | 286 | 0 | 286 |
| Jul 15 | 292 | 1 | 293 |
| Jul 16 | 49 | 9 | 58 |
| Jul 17 | 0 | 8 | 8 |
| Jul 18 | 0 | 9 | 9 |
| Jul 19 | 0 | 6 | 6 |
| **Total** | **2,210** | **33** | **2,243** |

| Queue impact | Jira cases |
|---|---|
| Total created by the flood | 316 |

The flood rule's last alerts were on Jul 16 (49). It produced none after that.

## Finding

The flood came from one test rule running with no threshold and no alert grouping.

Alerts from other rules after the flood rule stopped (SecurityAlert, UTC):

| Rule | Jul 17 | Jul 18 | Jul 19 | Note |
|---|---|---|---|---|
| `SOCBUILD_Test_ValidAccounts_DeviceLogon` | 4 | 3 | 0 | Test rule |
| `SOCBUILD_Test_PowerShell` | 4 | 3 | 0 | Test rule |
| `SOCBUILD_POWERSHELL` | 0 | 2 | 0 | Production-named, but still querying `ago(7d)` with no threshold |
| `SOCBUILD_PASSWORDSPRAY` | 0 | 1 | 0 | Password spray rule under its earlier name |
| `SOC-BUILD-PASSWORDSPRAY` | 0 | 0 | 6 | Password spray rule, renamed |

**True-positive count not established; tickets predate the disposition field.** The `SOC - Disposition` field was created on Jul 18, 2026, after the flood, so the 316 cases were not dispositioned through it.

## Resolution

1. `SOCBUILD_Test_BruteForce` was paused.
2. Across all SOCBUILD and SOC-BUILD rules, alert volume fell to 58 on Jul 16 (49 of them from the flood rule before it was paused), then 8 on Jul 17, 9 on Jul 18 and 6 on Jul 19, 2026.
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
