# Shift Handoff Process — Cyber Range SOC

The handoff is one of the most important things you do during a shift. Not because it is administrative — because the attacker does not stop when you log off.

Read this document before your first shift. Refer back to it whenever you are not sure what a good handoff looks like.

---

## 1. Why Handoffs Matter

The Cyber Range SOC operates 24/7. Attackers move continuously through the range — pivoting to new systems, deploying tools, establishing persistence, moving laterally — and they do not pause because your shift ended.

What that means in practice: if you hand off poorly, the incoming analyst spends the first hour of their shift reconstructing context instead of tracking the attacker. Chains go cold. Behavior goes undocumented. The value of everything you observed during your shift drops to near zero.

A good handoff means the incoming analyst picks up exactly where you left off — not from scratch, not from memory, but from a clear, complete written record that gives them everything they need to keep tracking.

This is not paperwork. This is continuity of observation. It is core to how this SOC functions.

---

## 2. The Four Shifts

| Shift | Hours (UTC) | Hands Off To |
|-------|-------------|--------------|
| **Alpha** | 00:00 – 06:00 | Bravo |
| **Bravo** | 06:00 – 12:00 | Charlie |
| **Charlie** | 12:00 – 18:00 | Delta |
| **Delta** | 18:00 – 00:00 | Alpha |

All times are UTC. If you are not sure what UTC is for your timezone, convert it once and write it somewhere — you will need it every shift.

---

## 3. When to Open a Handoff Ticket

**Open the handoff ticket 30 minutes before your shift ends. Not after. Not when the incoming analyst shows up. Before.**

This is deliberate. The last 30 minutes of your shift are for writing the handoff, not for opening new investigations. It gives you time to:

- Pull together what you observed during the shift
- Check active tracking cases for status updates
- Confirm tool health
- Post the link in Discord so the incoming analyst has it before they start

If you are in the middle of something active when it is time to write the handoff, that is fine — document where you are, flag it as active, and let the incoming analyst know they are picking up a live thread.

---

## 4. How to Fill Out the Handoff Ticket

Go to Issues → New Issue → Shift Handoff. Walk through each field carefully. Here is what each section is asking for and what a good answer looks like.

---

### Handoff Date/Time, Outgoing Analyst, Incoming Analyst, Shift

Fill these in first. For the incoming analyst, use their GitHub @mention so they get a notification.

---

### Shift Summary

**What it is asking for:** 2-3 sentences. What happened this shift? What was the attacker doing? What did your team focus on?

| | Example |
|--|---------|
| **Poor** | "Monitored the range. Some activity observed. Passing to Bravo." |
| **Good** | "Attacker continued lateral movement from WKSTN-047 toward the domain controller segment. We observed credential dumping behavior on two additional hosts. Focus this shift was on tracing the movement path and documenting MITRE techniques." |

The poor version tells the incoming analyst nothing useful. The good version tells them exactly what is happening and what to focus on.

---

### Active Tracking Cases

List every open tracking case with a link. If it is actively moving, say so. If it has gone quiet, say that too.

| | Example |
|--|---------|
| **Poor** | "See previous cases." |
| **Good** | `TRK-20240315-JF` — Attacker on WKSTN-047, actively pivoting. Priority case. `TRK-20240312-RB` — Cold since 03:00 UTC, no new activity. |

---

### What the Attacker Is Doing Right Now

This is the most operationally important field. Be specific.

| | Example |
|--|---------|
| **Poor** | "Lateral movement ongoing." |
| **Good** | "As of 05:30 UTC, attacker was on WKSTN-047 using PsExec to attempt connections to WKSTN-103 and WKSTN-112. Last observed command: `psexec \\WKSTN-103 -u admin -p [redacted] cmd`. Sentinel alert ID: 8842." |

If you do not know where the attacker is right now, say that explicitly — "last observed on WKSTN-047 at 04:15 UTC, no activity since" is useful. Silence is not.

---

### Anything Needing Immediate Attention

Flag anything the incoming analyst should look at first — before they check anything else. If nothing is urgent, say "Nothing requiring immediate action."

---

### Open Questions for Next Shift

What do you not know yet? What are you handing off unresolved?

Examples:
- "We do not know how the attacker got credentials for the `svc-backup` account — worth investigating."
- "MISP has a new threat actor profile that may match observed TTPs — has not been reviewed yet."
- "Honeypot on subnet 10.10.4.0/24 has been quiet all shift — unclear if attacker has moved through it already or not yet reached it."

---

### Tool Health Status

Check the box for each tool that was healthy and producing data during your shift. If something was degraded, describe it briefly and link the tool issue ticket if one exists.

---

### Threat Intel Updates

If MISP has new indicators, a new threat actor profile was added, or you came across external intel worth flagging — note it here. If nothing new, write "No updates this shift."

---

### Notes for Incoming Analyst

Anything that does not fit neatly elsewhere. Gut feelings, loose threads, things that felt off but are not confirmed. This is the informal notes section — use it.

---

### Verbal/Discord Briefing

If you briefed the incoming analyst on Discord before or during handoff — yes or no. If no, explain why. A verbal brief does not replace the ticket, but it supplements it. Aim for both.

---

## 5. How to Tag the Incoming Analyst

**In the ticket:**
Use `@githubusername` in the Incoming Analyst field and anywhere in the comments where you are flagging something specifically for them. They will receive a GitHub notification.

**In Discord:**
Post the link to the handoff ticket in the appropriate shift channel before your shift ends. Do not assume the incoming analyst will find it on their own.

A good Discord handoff message looks like this:

> "Bravo shift handoff is up. Active tracking case on WKSTN-047, attacker is moving. Handoff ticket: [link]. @incominganalyst let me know when you have read it."

That is all it needs to be. Short, linked, tagged.

---

## 6. What the Incoming Analyst Does

When you start your shift, your first task is the handoff — not Sentinel, not Discord, not email. The handoff ticket.

1. **Read the entire handoff ticket** before doing anything else
2. **Check all linked tracking cases** — open each one and review the comment history
3. **Check tool health** — if anything was flagged as degraded, verify current status before you start working
4. **Leave a receipt comment** on the handoff ticket confirming you received it. Something like:

   > "Bravo online as of 06:05 UTC. Reviewed handoff and active cases. Picking up TRK-20240315-JF — will post first update within 30 minutes."

5. **Close the handoff ticket** once you have left your receipt comment. You are the one who closes it, not the outgoing analyst.

If anything in the handoff is unclear, ask in Discord immediately — the outgoing analyst may still be around for a few minutes.

---

## 7. What Happens If No Handoff Is Posted

Handoffs are not optional. If one is missing, here is what happens:

**Shift Lead flags it.** If no handoff ticket exists 15 minutes into the new shift, the Shift Lead posts in Discord and pings the outgoing analyst.

**Incoming analyst posts a gap notice.** Open a handoff ticket yourself and note in the description that no handoff was received. Document what you can reconstruct — check open tracking cases, review recent Sentinel alerts, check tool status. Your goal is to reconstruct continuity as best you can.

**The gap gets logged.** A comment is added to any active tracking cases noting the gap in coverage. This is not punitive — it is a record of continuity. If something significant happened during an unhandoff window, we need to know.

Missing handoffs degrade the entire SOC's ability to track. If you consistently struggle to complete them, talk to your Shift Lead about what is getting in the way.

---

## 8. How Shift Leads Use the Project Board

At the start of every shift, the Shift Lead checks the project board before doing anything else. Here is what to look for:

**Open tracking cases** — How many are active? Are they assigned? Has anything gone cold that should be closed?

**Escalated tickets** — Anything marked `status: escalated-to-josh` that has not been addressed. If yes, ping Josh on Discord with a link.

**Tool issues** — Anything in the In Progress column tagged `type: tool-issue`. If a tool is degraded, the Shift Lead confirms whether it is still an issue and pings Infra if needed.

**Overdue deliverables** — Any deliverable tasks that are past their target date and still in Backlog or In Progress. Flag them in Discord and ask the owner for a status update.

**Stale handoff tickets** — Any handoff ticket from the previous shift that was never closed. Ping the incoming analyst from that shift to close it.

This board check should take 10-15 minutes at the start of every shift. It is how the Shift Lead maintains situational awareness across the entire SOC.

---

## 9. Handoff Quality Standards

Below is a complete example of a well-written handoff. Use this as a benchmark.

---

**Title:** `[HANDOFF] Charlie → Delta | 2024-03-15 18:00 UTC`

**Handoff Date/Time:** 2024-03-15 17:45 UTC
**Outgoing Analyst:** Jane F.
**Incoming Analyst:** @rbravo-soc
**Shift Transitioning From:** Charlie
**Shift Transitioning To:** Delta

---

**Shift Summary:**
Charlie shift observed continued attacker activity originating from the initial foothold established on WKSTN-047 during Bravo. The attacker moved laterally to two additional workstations using stolen credentials and deployed a lightweight implant on WKSTN-103. Activity slowed around 16:30 UTC with no new movement observed in the last 90 minutes. Focus this shift was on documenting the lateral movement path and logging the implant artifacts.

---

**Active Tracking Cases:**

| Case ID | Summary | Status | Link |
|---------|---------|--------|------|
| TRK-20240315-JF | Lateral movement from WKSTN-047, implant on WKSTN-103 | Active / Watching | #42 |
| TRK-20240312-RB | Initial access via exposed RDP | Cold since 2024-03-13 | #38 |

---

**What the Attacker Is Doing Right Now:**
As of 17:30 UTC, last observed activity was on WKSTN-103. Implant appears to be beaconing outbound on port 443 to 185.220.101.47 — logged in Sentinel, alert ID 9104. No new lateral movement observed since 16:20 UTC. It is unclear whether the attacker is dormant or operating below our current detection threshold.

**Anything Needing Immediate Attention:**
Check whether WKSTN-112 has any new outbound connections. The attacker attempted to reach it at 15:55 UTC but we lost visibility — may have succeeded via a path we are not monitoring.

**Open Questions for Next Shift:**
- How did the attacker obtain credentials for `svc-backup`? We have not traced the source.
- The implant artifact on WKSTN-103 has not been identified yet — worth running against MISP.
- Honeypot on 10.10.4.x has been quiet all shift. Worth a manual check.

---

**Tool Health:**
- [x] Microsoft Sentinel — healthy
- [x] Microsoft Defender for Endpoint — healthy
- [x] MISP — healthy
- [x] Honeypots (OpenCanary) — healthy, one sensor on 10.10.4.22 may be stale (last log 14:00 UTC)
- [x] Tenable — healthy

**Tool Issues:** OpenCanary sensor 10.10.4.22 may need a restart — flagged in #43.

---

**Threat Intel Updates:**
MISP has a new cluster for the threat actor group "UNC2452" added at 14:00 UTC. Some of the observed TTPs this shift overlap. Worth reviewing before Delta starts investigating the implant.

**Notes for Incoming Analyst:**
The attacker has been patient — long gaps between actions. Do not assume quiet means gone. Sentinel query `SOC-LateralMovement-WKSTN` is already set up and running. The implant on WKSTN-103 is the most interesting thing in the range right now.

**Verbal briefing completed:** Yes — Discord voice, 17:40 UTC.

---

*If your handoff does not look something like this, it probably needs more detail. When in doubt, add more. The incoming analyst would rather have too much context than too little.*

---

*Maintained by the Process & Documentation team. Questions or corrections — open a ticket.*
