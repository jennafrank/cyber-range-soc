# Escalation matrix

Knowing who needs a case, and what they need to act on it, is part of the job. This matrix is drawn from [rules-of-engagement.md](rules-of-engagement.md), [onboarding.md](onboarding.md), and [shift-handoff-process.md](shift-handoff-process.md). Rows marked [CONFIRM] are not backed by those docs yet.

**Review cadence:** there are no formal SLAs. The SOC runs on Jira Software Standard, which has no SLA engine, so each case carries a `SOC - Next Review Date` instead of a time target.

**The boundary:** Pacific Watch is advisory only. Analysts investigate, document, and recommend. Containment and remediation are decisions for the system owner or an authorized lead.

| Situation | Tier 1 action | Escalate to | Required context |
|---|---|---|---|
| You don't have a runbook for what you're seeing, or you're not sure what it is | Stop and document what you see in the case. Do not act on the range. | T2 on shift, then Shift Lead | Case link, what you observed, the query or table you saw it in, UTC time |
| Something feels significant | Document it in the case and escalate early. It is never wrong to ask. | Shift Lead | Case link, why it looks significant, affected host or account |
| Attacker behavior crosses a severity threshold: significant data access, domain-level compromise, or behavior outside expected range activity | Keep documenting. Do not intervene. | Shift Lead, who escalates to the SOC Lead | Case link, behavior observed, affected assets, evidence (table, field, value, UTC), current severity |
| Something you believe has implications beyond this SOC | Document it in the case | SOC Lead (through the Shift Lead) | Case link, why it matters beyond the SOC, evidence |
| A scope or authorization question nobody on shift can answer | Pause. Do not act until it's answered. | Shift Lead, then SOC Lead | The action in question, the asset, the case, and why you think it might be needed |
| A tool is critically broken and Infrastructure can't fix it within the shift | Record the tool status in your handoff | Infrastructure & Tooling team, then SOC Lead through the Shift Lead | Tool, symptom, when it started, what coverage is lost |
| You (or someone else) took an action without authorization | Stop. Tell the Shift Lead immediately. Document what was done, when, and the effect. Do not try to undo it without guidance. | Shift Lead; SOC Lead if it materially affects the range | What was done, when (UTC), on which asset, the effect observed |
| No handoff ticket exists 15 minutes into your shift | Open a handoff ticket yourself, note that no handoff was received, and reconstruct what you can | Shift Lead | Open cases, recent alerts, tool status, what could not be reconstructed |
| Cross-team conflict, resource decision, or anything touching range infrastructure or configuration (T2 level) | Raise it; don't decide it alone | Shift Lead, then SOC Lead | Teams involved, the decision needed, the impact of waiting |
| Evidence supports containment (for example, a confirmed compromise) | Write the recommendation in the case. Do not contain. | Shift Lead, who passes it to the system owner | Finding, confidence (High / Medium / Low), recommended action in priority order, what is not established from available telemetry |
| A case reaches its review date (the `SOC - Next Review Date` field) | Review the case and update its Triage Note | Shift Lead, if the case cannot move forward | Case link, what changed since the last review, the blocker |
