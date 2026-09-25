# Case study 03: The first genuine password spray, end to end

**Type:** Detection engineering through to advisory
**Status:** Draft. Items marked [FILL IN] or [CONFIRM] need facts before this is published.
**Author:** Jenna Frank, Security Operations Manager
**Boundary:** Advisory only. The SOC observes and recommends. For instructor assets, range leadership is the Client and decides what action to take.

## Summary

A password spray detection built for always-on Linux assets was backtested, deployed, validated through the pipeline, and fired for real on Jul 19, 2026 against `linux-target-1`, an always-on instructor asset. The pipeline created case SOCOPS-327: 101 attempts, 38 distinct accounts, 12 source addresses. [FILL IN: outcome and recommendation, one sentence]

## The detection

| Item | Value |
|---|---|
| Rule | `SOC-BUILD-PASSWORDSPRAY-ALWAYSONLINUX-T1110.003` |
| Table | `DeviceLogonEvents` |
| Schedule | Hourly |
| Threshold | 8 or more distinct accounts per hour |
| ATT&CK | T1110.003, Brute Force: Password Spraying (checked against attack.mitre.org on 2026-09-25) |

**Backtest:** against a known spike, the rule would have caught 33 and 37 distinct accounts at 10:00 and 11:00 UTC, against a baseline of 1 to 4 per hour. [FILL IN: date of the backtested spike]

## Timeline (UTC)

| When | Event |
|---|---|
| [FILL IN] | Backtest against the known spike |
| Jul 18, 2026 | Rule deployed with a planned 48-hour alerts-only bake |
| Jul 18, 2026 | Logic App connected to validate the pipeline end to end |
| Jul 18, 2026, 21:38:36 | Tuned rule fired; pipeline created SOCOPS-320, the first correctly typed Alert Case |
| Jul 19, 2026 | Rule fired on `linux-target-1`; pipeline created SOCOPS-327 |
| [FILL IN] | [FILL IN: triage, investigation, advisory sent] |

The planned 48-hour alerts-only bake was shortened so the pipeline could be validated end to end.

## Evidence

| Item | Value |
|---|---|
| Case | SOCOPS-327 |
| Host | `linux-target-1` (always-on instructor asset) |
| Attempts | 101 |
| Distinct accounts | 38 |
| Source addresses | 12 (not published) |
| Successful logons | [FILL IN, or "not established from available telemetry"] |
| Follow-on activity | [FILL IN, or "not established from available telemetry"] |

## Finding

[FILL IN: was any attempt successful? Confidence (High / Medium / Low) with the reason.]

## Recommendation and communication

- **Client:** range leadership (owner of instructor assets)
- **Recommendation sent:** [FILL IN]
- **When:** [FILL IN: UTC]
- **Disposition:** [FILL IN: SOC - Disposition value]

## Lessons

[FILL IN]
