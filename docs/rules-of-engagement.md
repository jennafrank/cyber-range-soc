# Rules of Engagement — Cyber Range SOC

This document defines what analysts at each level are authorized to do — and what requires approval before acting. Read it before your first shift. If something you want to do is not on this list, **stop and ask your Shift Lead first.**

These rules exist for two reasons: to protect the integrity of the range as a learning environment, and to protect you.

---

## The Tracking SOC Principle

**We are observers first. Intervention is the exception, not the default.**

The environment is intentionally vulnerable. Attackers are supposed to be here. When we intervene — isolate a device, block an IP, revoke a session — we disrupt the attacker's behavior and destroy the learning opportunity that behavior represented. We also potentially tip off the attacker that they are being watched.

**Observation is the mission. Document everything. Change nothing without authorization.**

---

## What ALL Analysts Can Do

No approval needed. This is your core job.

- Monitor alerts in Sentinel and Defender for Endpoint
- Review logs, run queries in Log Analytics / KQL
- Open, update, and comment on GitHub tickets
- Document observed attacker behavior in tracking cases
- Review MISP threat intelligence
- Check Tenable for asset and vulnerability context
- Escalate observations to your Shift Lead
- Apply labels and update ticket status in GitHub
- Post in Discord shift channels

---

## What T1 Analysts CANNOT Do Without Approval

**Do not take any of these actions without explicit Shift Lead authorization.**

- Isolate or quarantine any device in MDE
- Disable or lock any user account in Entra ID
- Block an IP address at the firewall or in any security tool
- Modify, enable, or disable any detection rule or analytic in Sentinel
- Delete any log, alert, artifact, or ticket — anywhere
- Change any configuration in any tool in the range
- Take any action on a live attacker session

If you are unsure whether an action you want to take falls into this list — **it probably does. Ask first.**

---

## What T2 Analysts Can Do With Shift Lead Awareness

T2s can take the following actions, but **must notify the Shift Lead before acting** and document the action in the relevant GitHub ticket immediately after.

- Device isolation in MDE — for assets confirmed out of scope or confirmed destroyed
- Active session revocation in Entra ID — with documented justification
- IP blocks at the firewall level — only when explicitly approved for the specific case

**"Shift Lead awareness" means you told them before you did it, not after.** A quick Discord message is sufficient — "About to isolate WKSTN-047 in MDE, confirming this is in scope. Case: #42." Wait for acknowledgment before acting.

---

## What Only Shift Lead or SOC Lead Can Authorize

These actions require explicit sign-off from a Shift Lead or above. T1 and T2 analysts do not authorize these independently.

- **Any containment action** — isolation, blocking, account disabling — outside the T2 scope above
- **Severity changes on active tracking cases** — upgrading or downgrading case severity
- **Escalation to Josh** — applying `status: escalated-to-josh` to any ticket
- **Any action that would affect the attacker's ability to operate in the range**
- **Communication with external parties** about range activity

---

## If You Accidentally Take an Unauthorized Action

It happens. Here is what to do.

1. **Tell your Shift Lead immediately.** Do not wait. Do not finish your shift first. Tell them now.
2. **Document what happened** in the relevant GitHub ticket — what you did, when, and what the effect was.
3. **Do not try to undo it without guidance.** Sometimes the undo causes more disruption than the original action. Wait for direction.

**There is no judgment for honest mistakes. There is judgment for hiding them.**

An undisclosed action that affects the range can corrupt tracking data, confuse the next shift, and invalidate case documentation. Hiding it makes everything worse. Saying something immediately makes it a fixable problem.

---

## The Escalate-to-Josh Threshold

Apply `status: escalated-to-josh` and ping Josh directly on Discord when:

- **Attacker behavior crosses a severity threshold** that the team believes warrants leadership awareness — significant data access, domain-level compromise, behavior outside expected range activity
- **A tool is critically broken** and Infra cannot resolve it within the shift
- **A scope or authorization question** arises that no one on shift can answer
- **An analyst takes an unauthorized action** that materially affects the range
- **You observe something** that you believe has implications beyond this SOC

**When in doubt, escalate.** Escalating something that turns out to be fine has zero cost. Failing to escalate something significant has real consequences.

When you apply the label — also send a direct Discord message to Josh with a link to the ticket. The label creates the record. The message creates the urgency.

---

*These rules apply to everyone, every shift, without exception. If you have a question about scope or authorization that this document does not answer — ask your Shift Lead before acting.*

*Last updated by the Process & Documentation team.*
