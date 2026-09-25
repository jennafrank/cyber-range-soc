---
name: Attacker Tracking Case
about: Open a new tracking case for observed post-compromise attacker behavior
title: "[TRACKING] "
labels: tracking-case, new
assignees: ""
---

<!--
  This is a TRACKING SOC. We observe and document. We do not contain, remediate, or evict.
  Fill out as much as you can at time of opening. Update this ticket as the chain develops.
-->

## Case Identification

**Case ID:** TRK-[YYYYMMDD]-[INITIALS]
**Date/Time Opened (UTC):**
**Analyst Name:**
**Shift:** <!-- Alpha / Bravo / Charlie / Delta -->

---

## Initial Observation

**Entry Point Observed:**
<!-- Which asset, IP, or service did you first see the attacker interact with? -->

**Initial Access Method:**
<!-- How did they get in? Phishing, exposed service, cred stuffing, etc. -->

---

## What We Are Seeing

**Attacker Tools / Commands Observed:**
<!-- List commands, binaries, scripts, or tooling you have observed -->

```
Paste commands or artifacts here
```

**Systems Touched:**
<!-- List hostnames, IPs, or asset names in the order they were observed -->

-

**Post-Compromise Behavior Summary:**
<!-- 2-4 sentences describing what the attacker is doing. Focus on observable behavior, not speculation. -->

---

## MITRE ATT&CK Techniques Observed

Check all that apply based on observed evidence:

- [ ] Initial Access
- [ ] Execution
- [ ] Persistence
- [ ] Lateral Movement
- [ ] Credential Access
- [ ] Defense Evasion
- [ ] Command and Control (C2)
- [ ] Exfiltration

<!-- Add specific technique IDs (e.g. T1078, T1059.001) in the notes below if known -->

**Technique Notes:**

---

## Chain Visibility

**How Far Was the Chain Traced:**
<!-- What is the furthest point in the attack chain you have documented? -->

**Where Did Visibility Go Cold:**
<!-- At what point did you lose the trail? Log gap, encrypted traffic, out-of-scope asset, etc. -->

---

## Analyst Notes

**Interesting Findings:**
<!-- Anything notable, unusual, or worth flagging — even if it does not fit neatly elsewhere -->

**Recommended Follow-Up for Next Shift:**
<!-- What should the incoming analyst look at? Be specific. -->

---

## Severity

**Severity of This Case:**
<!-- Select one and delete the rest -->
- Critical — Active high-value behavior requiring immediate documentation
- High — Significant post-compromise activity worth deep investigation
- Medium — Interesting behavior worth documenting
- Low — Routine activity, low investigative priority

---

## Assignment

**Assigned To:** @
