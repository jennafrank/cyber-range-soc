# Shift Handoff Process: Pacific Watch SOC

The handoff is one of the most important things you do during a shift. Not because it is administrative, but because the attacker does not stop when you log off.

Read this document before your first shift. Refer back to it whenever you are not sure what a good handoff looks like.

All case work lives in Jira (SOCOPS).

---

## 1. Why Handoffs Matter

Attackers move continuously through the range: pivoting to new systems, deploying tools, establishing persistence, moving laterally. They do not pause because your shift ended.

If you hand off poorly, the incoming analyst spends the first hour of their shift reconstructing context instead of working the case. Chains go cold. Behavior goes undocumented. The value of everything you observed drops to near zero.

A good handoff means the incoming analyst picks up exactly where you left off: not from scratch, not from memory, but from a clear written record in Jira.

This is not paperwork. It is continuity of investigation.

---

## 2. The Four Shifts

| Shift | Hours (UTC) | Hands off to |
|-------|-------------|--------------|
| **Alpha** | 00:00 to 06:00 | Bravo |
| **Bravo** | 06:00 to 12:00 | Charlie |
| **Charlie** | 12:00 to 18:00 | Delta |
| **Delta** | 18:00 to 00:00 | Alpha |

All times are UTC. Convert yours once and write it down; you will need it every shift.

---

## 3. How Handoff Works in Jira

A handoff has two parts.

**On every open case you own**, update the handoff fields so the case can stand on its own:

| Field | What goes in it |
|---|---|
| **SOC - Current Summary** | Where the investigation stands right now, in two or three sentences |
| **SOC - Handoff Summary** | What changed this shift, what you checked, and what you ruled out |
| **SOC - Next Action** | The single next step the incoming analyst should take |
| **SOC - Next Review Date** | When the case must be looked at again |
| **SOC - Ownership Accepted** | Set by the incoming analyst when they take the case over [CONFIRM] |

**Once per shift**, open a **Shift Handoff** record. It is a cross-case record, not a child of any one case: it covers the whole shift and points to every case being handed over.

Between the case fields and the Shift Handoff record, every handoff preserves:

- Case status
- Investigation summary
- Evidence reviewed
- Actions taken
- Open questions
- Escalations
- Current owner
- Next action

On Alert Cases, the two fields an analyst enters are **SOC - Disposition** and **SOC - Triage Note**. Make sure both are current before you hand off.

---

## 4. When to Start the Handoff

**Start the handoff 30 minutes before your shift ends. Not after. Not when the incoming analyst shows up. Before.**

The last 30 minutes of your shift are for writing the handoff, not for opening new investigations. Use them to:

- Update the handoff fields on each case you own
- Open the Shift Handoff record
- Confirm tool health
- Post the Shift Handoff link in Discord so the incoming analyst has it before they start

If you are in the middle of something active, that is fine. Document where you are in **SOC - Current Summary**, say it is live in **SOC - Next Action**, and tell the incoming analyst they are picking up a live thread.

---

## 5. What Goes in the Shift Handoff Record

### Handoff time, outgoing analyst, incoming analyst, shift

Fill these in first. @mention the incoming analyst in Jira so they get a notification.

### Shift Summary

Two or three sentences. What happened this shift? What was the attacker doing? What did you focus on?

| | Example |
|--|---------|
| **Poor** | "Monitored the range. Some activity observed. Passing to Bravo." |
| **Good** | "Attacker continued lateral movement from WKSTN-047 toward the domain controller segment. We observed credential dumping behavior on two additional hosts. Focus this shift was on tracing the movement path and documenting ATT&CK techniques." |

### Cases Handed Off

List every open case you are handing over, with its SOCOPS key. If it is actively moving, say so. If it has gone quiet, say that too. The detail lives in each case's handoff fields; this list is the index.

| | Example |
|--|---------|
| **Poor** | "See previous cases." |
| **Good** | `SOCOPS-XXX`: attacker on WKSTN-047, actively pivoting, priority. `SOCOPS-YYY`: quiet since 03:00 UTC, no new activity. |

### What the Attacker Is Doing Right Now

The most operationally important section. Be specific.

| | Example |
|--|---------|
| **Poor** | "Lateral movement ongoing." |
| **Good** | "As of 05:30 UTC, attacker was on WKSTN-047 using PsExec to attempt connections to WKSTN-103 and WKSTN-112. Sentinel alert ID: 8842." |

If you do not know where the attacker is right now, say that explicitly. "Last observed on WKSTN-047 at 04:15 UTC, no activity since" is useful. Silence is not.

### Anything Needing Immediate Attention

What should the incoming analyst look at first? If nothing is urgent, write "Nothing requiring immediate action."

### Open Questions for Next Shift

What do you not know yet? What are you handing off unresolved?

- "We do not know how the attacker got credentials for the `svc-backup` account. Worth investigating."
- "MISP has a new threat actor profile that may match observed TTPs. Not reviewed yet."

### Tool Health

Note each tool that was healthy and producing data during your shift. If something was degraded, describe it and link its Jira ticket.

### Threat Intel Updates

New MISP indicators, a new actor profile, or outside intel worth flagging. If nothing new, write "No updates this shift."

### Notes for Incoming Analyst

Loose threads, things that felt off but are not confirmed. Use it.

### Verbal / Discord Briefing

Did you brief the incoming analyst on Discord? Yes or no; if no, say why. A verbal brief supplements the written record; it never replaces it.

---

## 6. Letting the Incoming Analyst Know

**In Jira:** @mention the incoming analyst on the Shift Handoff record and anywhere you flag something specifically for them.

**In Discord:** post the Shift Handoff link in your shift channel before your shift ends. Do not assume the incoming analyst will find it on their own.

> "Bravo shift handoff is up. Active case on WKSTN-047, attacker is moving. Shift Handoff: [link]. @incominganalyst let me know when you have read it."

Short, linked, tagged.

---

## 7. What the Incoming Analyst Does

Your first task on shift is the handoff: not Sentinel, not Discord, not email.

1. **Read the Shift Handoff record** from start to finish.
2. **Open every case it lists.** Read SOC - Current Summary, SOC - Handoff Summary, and SOC - Next Action, then the case history.
3. **Check tool health.** If anything was flagged as degraded, verify it before you start.
4. **Take ownership.** Set **SOC - Ownership Accepted** on each case you pick up. [CONFIRM]
5. **Leave a receipt** on the Shift Handoff record:

   > "Bravo online as of 06:05 UTC. Reviewed handoff and active cases. Picking up SOCOPS-XXX; first update within 30 minutes."

If anything is unclear, ask in Discord right away. The outgoing analyst may still be around.

---

## 8. What Happens If No Handoff Is Posted

Handoffs are not optional.

**Shift Lead flags it.** If no Shift Handoff record exists 15 minutes into the new shift, the Shift Lead posts in Discord and pings the outgoing analyst.

**Incoming analyst posts a gap notice.** Open a Shift Handoff record yourself and note that no handoff was received. Reconstruct what you can from the open cases' handoff fields, recent Sentinel alerts, and tool status.

**The gap gets logged.** Add a comment to each active case noting the gap in coverage. This is not punitive; it is a record of continuity.

If you consistently struggle to complete handoffs, talk to your Shift Lead about what is getting in the way.

---

## 9. How Shift Leads Use the SOCOPS Board

At the start of every shift, the Shift Lead checks the SOCOPS board before doing anything else.

- **Columns:** Intake, Triage, Investigation, Advisory, Done. Look for cases piling up in any one column.
- **Swimlanes:** start with **Expedite**, then **Security Case**, then **Alert Queue**.
- **Quick filters:**
  - **Needs triage:** anything waiting for a first look.
  - **Stale:** cases that have not moved. Check their SOC - Next Review Date and SOC - Next Action, and ask the owner for an update.
  - **My work:** your own cases.
- **Escalations:** anything escalated to the SOC Lead that has not been addressed. Ping the SOC Lead on Discord with a link.
- **Tool issues:** any open tool ticket. Confirm whether the issue is still live and ping Infrastructure if needed.

This check should take 10 to 15 minutes. It is how the Shift Lead keeps situational awareness across the SOC.

---

## 10. Handoff Quality Standard

A complete example of a well-written Shift Handoff record. The hosts, keys, and addresses are illustrative.

---

**Title:** `[HANDOFF] Charlie → Delta | 18:00 UTC`

**Handoff time:** 17:45 UTC
**Outgoing analyst:** Charlie shift analyst
**Incoming analyst:** @delta-analyst
**Shift:** Charlie → Delta

**Shift Summary:**
Charlie shift observed continued attacker activity from the initial foothold on WKSTN-047. The attacker moved laterally to two more workstations using stolen credentials and deployed a lightweight implant on WKSTN-103. Activity slowed around 16:30 UTC, with no new movement in the last 90 minutes. Focus this shift was documenting the lateral movement path and logging the implant artifacts.

**Cases Handed Off:**

| Case | SOC - Current Summary | SOC - Next Action | SOC - Next Review Date |
|---|---|---|---|
| SOCOPS-XXX | Lateral movement from WKSTN-047; implant on WKSTN-103 | Check WKSTN-112 for new outbound connections | Next shift |
| SOCOPS-YYY | Initial access via exposed RDP; quiet since yesterday | Confirm no new logons, then move toward Advisory | Tomorrow |

**What the Attacker Is Doing Right Now:**
As of 17:30 UTC, last observed activity was on WKSTN-103. The implant appears to be beaconing outbound on port 443 to 203.0.113.47 (Sentinel alert ID 9104). No new lateral movement since 16:20 UTC. It is unclear whether the attacker is dormant or operating below our detection threshold.

**Anything Needing Immediate Attention:**
Check whether WKSTN-112 has any new outbound connections. The attacker attempted to reach it at 15:55 UTC and we lost visibility.

**Open Questions for Next Shift:**
- How did the attacker obtain credentials for `svc-backup`? Source not traced.
- The implant artifact on WKSTN-103 has not been identified. Worth running against MISP.
- The honeypot subnet has been quiet all shift. Worth a manual check.

**Tool Health:** Sentinel, Defender for Endpoint, MISP, and Tenable healthy. One OpenCanary sensor may be stale (last log 14:00 UTC); tool ticket opened.

**Threat Intel Updates:** A new MISP cluster was added at 14:00 UTC with TTPs that overlap this shift's activity. Worth reviewing before Delta works the implant.

**Notes for Incoming Analyst:**
The attacker has been patient, with long gaps between actions. Do not assume quiet means gone.

**Verbal briefing completed:** Yes, Discord voice, 17:40 UTC.

---

*If your handoff does not look something like this, it probably needs more detail. The incoming analyst would rather have too much context than too little.*

---

*Maintained by the Process & Documentation team. Questions or corrections: open a Jira ticket.*
