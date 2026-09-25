# Case study 01: The 316-case queue flood

**Type:** Detection engineering and queue operations
**Outcome:** Rules paused, queue clear within 24 hours, fix turned into a promotion rule
**Author:** Jenna Frank, Security Operations Manager

> Facts in this write-up are confirmed unless marked [CONFIRM] or [FILL IN].

## Summary

Unthresholded TEST brute-force rules flooded the case queue with 316 Jira cases. Alert volume ran at about 286 to 293 per day from Jul 12 to Jul 15, 2026. I traced the flood to those rules, the rules were paused, and the queue was clear within 24 hours. Volume fell to 8 per day by Jul 17 to 18. The fix became governance: a rule reaches SOC-BUILD only with a threshold and a dedup key.

## Problem

| Item | Value |
|---|---|
| Source | Unthresholded TEST brute-force rules |
| Rule configuration | No threshold, no alert grouping |
| Alert volume | About 286 to 293 per day, Jul 12 to Jul 15, 2026 |
| Cases in the queue | 316 |

- **Rule names:** [FILL IN]
- **Who noticed first:** [CONFIRM]

## Investigation

- **Why the rules over-fired:** with no threshold and no alert grouping, every matching event became its own alert, and each alert became its own case.
- **Evidence reviewed:** [FILL IN: table, field, value, e.g. `SecurityAlert` summarized by `AlertName` and day]

## Finding

The flood came from rules still in TEST that had no threshold and no alert grouping. [FILL IN: true positives among the 316, or "not established from available telemetry"]

## Resolution

1. The unthresholded TEST rules were paused. [CONFIRM: paused by you?]
2. Cleared the queue within 24 hours. [FILL IN: how the 316 cases were dispositioned, e.g. `Duplicate` or `False Positive` after sampling]
3. Confirmed the drop: alert volume fell to 8 per day by Jul 17 to 18, 2026.
4. Made the fix a promotion requirement: a rule reaches SOC-BUILD only with a threshold and a dedup key.

- **Others involved:** [CONFIRM]

## Lesson

Noise is operational risk. A rule with no threshold and no grouping can bury the cases that matter, so the requirement now sits in the promotion gate instead of depending on someone noticing.
