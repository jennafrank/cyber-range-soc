# Case study 02: Suspicious enumeration that was an exercise

**Type:** Investigation and disposition
**Disposition:** Authorized Simulated Activity
**Author:** Jenna Frank, Security Operations Manager

## Summary

Scripted Active Directory enumeration ran from the account `d.williams` against `gf-dc01` (`greenfield.local`), recurring at 42 minutes past the hour from Jun 24 to Jul 4, 2026. The first working theory was that a real participant's account was involved. That theory was wrong. The activity came from a staged threat hunt scenario, and `d.williams` is a scenario persona. The scenario owner confirmed this directly on Jul 22, 2026.

## What was observed

| Item | Value |
|---|---|
| Table | `IdentityQueryEvents` |
| Account | `d.williams` |
| Target | `gf-dc01`, domain `greenfield.local` |
| Pattern | Recurring at :42 past the hour |
| Window | Jun 24 to Jul 4, 2026 |
| ATT&CK | T1087.002, Account Discovery: Domain Account (checked against attack.mitre.org on 2026-09-25) |

The fixed :42 cadence points to scheduled, scripted execution rather than a person at a keyboard. (Confidence: High. Human activity does not repeat at the same minute across eleven days.)

## Initial working theory

A real participant's account was running domain enumeration. Scripted enumeration from a participant account would be worth escalating: participant VMs can be infected, and scripted is not the same as benign.

## Investigation

1. The enumeration was treated as potentially malicious until shown otherwise.
2. The source of `greenfield.local` was traced. The range's threat hunt engineering function stages scenarios in a separate workspace, and one active scenario was called "greenfield."
3. That changed the question from "whose account is this?" to "is this account part of a staged scenario?"

## Disposition

- **Confirmed** directly with the scenario owner on Jul 22, 2026: `d.williams` is a scenario persona.
- **Disposition:** Authorized Simulated Activity.

## Lessons

- **Scripted enumeration is not automatically benign.** Participant VMs can be infected, so a script is a reason to look closer, not to close the case.
- **Staged scenarios reach the SOC's hunting surface.** The SOC needs a way to recognize active scenario domains before spending a shift on them.
- **Detections should target always-on assets, not transient hostnames.** Scenario hosts come and go; rules built around them go stale or fire on exercises.
