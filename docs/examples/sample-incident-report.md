# Sample incident report: password spray against an instructor server

> **This is a sample.** It is built from a sanitized investigation in the Log(N) Pacific training cyber range (case SOCOPS-327). The Client is range leadership, which owns the always-on instructor assets. Source IP addresses are left out.
>
> **Status: draft.** Items marked [FILL IN] or [CONFIRM] need facts from the case before this is published.

**To:** Range leadership
**From:** Pacific Watch SOC
**Case:** SOCOPS-327
**Date:** [FILL IN]
**Severity:** [FILL IN]

---

## What happened

On July 19, 2026, someone tried to log in to one of your always-on Linux servers, `linux-target-1`, by guessing passwords across many different account names. This is called a password spray: instead of trying many passwords on one account, the attacker tries a few common passwords on lots of accounts, hoping one of them is weak.

## What we observed

| What | Detail |
|---|---|
| Server | `linux-target-1` |
| Date | July 19, 2026 |
| Login attempts | 101 |
| Different account names tried | 38 |
| Different source addresses | 12 |
| Did any attempt succeed? | [FILL IN] |

Our detection flags a server when 8 or more different account names are tried within one hour. In our testing, the normal level was 1 to 4 per hour.

**What we could not confirm:** [FILL IN: anything not established from available telemetry]

## Why it matters

If any of those 38 accounts has a weak password, the attacker could log in as that user and use the server as a foothold. Because this is an always-on instructor server, a compromise here could reach the exercises that depend on it.

## What we recommend

In priority order. Pacific Watch is advisory: we recommend, and you decide and act. [CONFIRM: these match the recommendation actually sent]

1. **Confirm no attempt succeeded.** If any login succeeded, reset that account's password and let us review what the account did afterward.
2. **Turn off password logins for remote access** where the server's purpose allows it, and use key-based access instead. A spray cannot guess a key.
3. **Remove or disable accounts that are not needed.** 38 account names were tried; any that exist but are unused are easy targets.
4. **Limit who can reach the login service**, if the range design allows it.

## What we need from you

- Tell us whether any of this login activity was expected, such as a scheduled exercise.
- Tell us which recommendations you decide to act on, and when, so we can watch for the attacker returning.

## Current status

[FILL IN: e.g. "The case is in Advisory. We are still watching the server for new login attempts and will update you by [UTC time]."]
