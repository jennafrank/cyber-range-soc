# Rules of Engagement — Cyber Range SOC

This document defines what analysts at each level are authorized to do — and what requires approval before acting. Read it before your first shift. If something you want to do is not on this list, **stop and ask your Shift Lead first.**

These rules exist for two reasons: to protect the integrity of the range as a learning environment, and to protect you.

---

## The Tracking SOC Principle

**We are advisory only. We observe, investigate, and recommend. We do not contain or remediate.**

The environment is intentionally vulnerable. Attackers are supposed to be here. Isolating a device, blocking an IP, or revoking a session would disrupt the attacker's behavior, destroy the learning opportunity that behavior represents, and could tip off the attacker that they are being watched. Those decisions belong to the system owner, never to the SOC.

**Observation is the mission. Document everything. Change nothing without authorization.**

---

## What ALL Analysts Can Do

No approval needed. This is your core job.

- Monitor alerts in Sentinel and Defender for Endpoint
- Review logs, run queries in Log Analytics / KQL
- Open, update, and comment on Jira tickets
- Document observed attacker behavior in tracking cases
- Review MISP threat intelligence
- Check Tenable for asset and vulnerability context
- Escalate observations to your Shift Lead
- Update ticket status in Jira
- Post in Discord shift channels

---

## What No Analyst Does

No analyst at any level takes these actions. If evidence supports one of them, write it up as a recommendation (see below).

- Isolate or quarantine any device in MDE
- Disable or lock any user account in Entra ID
- Revoke a user's sessions
- Block an IP address at the firewall or in any security tool
- Delete any log, alert, artifact, or ticket, anywhere
- Take any action on a live attacker session

Changing a detection rule or any tool configuration needs explicit Shift Lead authorization.

---

## When Evidence Supports Containment

1. Write the recommendation in the case: the finding, your confidence (High / Medium / Low), and the recommended actions in priority order.
2. Note anything that is not established from available telemetry.
3. Tell the Shift Lead. The Shift Lead passes the recommendation to the system owner, who decides whether and how to act.

---

## What Only Shift Lead or SOC Lead Can Authorize

These actions require explicit sign-off from a Shift Lead or above. T1 and T2 analysts do not authorize these independently.

- **Passing a containment recommendation to the system owner**
- **Severity changes on active tracking cases** — upgrading or downgrading case severity
- **Escalation to SOC Lead:** escalating any Jira case to the SOC Lead
- **Communication with external parties** about range activity

---

## If You Accidentally Take an Unauthorized Action

It happens. Here is what to do.

1. **Tell your Shift Lead immediately.** Do not wait. Do not finish your shift first. Tell them now.
2. **Document what happened** in the relevant Jira ticket: what you did, when, and what the effect was.
3. **Do not try to undo it without guidance.** Sometimes the undo causes more disruption than the original action. Wait for direction.

**There is no judgment for honest mistakes. There is judgment for hiding them.**

An undisclosed action that affects the range can corrupt tracking data, confuse the next shift, and invalidate case documentation. Hiding it makes everything worse. Saying something immediately makes it a fixable problem.

---

## The Escalate-to-SOC-Lead Threshold

Record the escalation in the Jira case and ping the SOC Lead directly on Discord when:

- **Attacker behavior crosses a severity threshold** that the team believes warrants leadership awareness — significant data access, domain-level compromise, behavior outside expected range activity
- **A tool is critically broken** and Infra cannot resolve it within the shift
- **A scope or authorization question** arises that no one on shift can answer
- **An analyst takes an unauthorized action** that materially affects the range
- **You observe something** that you believe has implications beyond this SOC

**When in doubt, escalate.** Escalating something that turns out to be fine has zero cost. Failing to escalate something significant has real consequences.

When you escalate, record it in the Jira case and send the SOC Lead a direct Discord message with a link to the case. The case note creates the record. The message creates the urgency.

---

*These rules apply to everyone, every shift, without exception. If you have a question about scope or authorization that this document does not answer — ask your Shift Lead before acting.*

*Last updated by the Process & Documentation team.*
