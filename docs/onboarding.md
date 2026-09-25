# Welcome to the Cyber Range SOC

Hey. I am genuinely glad you are here.

What you are about to step into is something most people in cybersecurity never get access to: a real, live security operations center running on a real enterprise environment with real attacker activity. Not a simulation. Not a lab with scripted scenarios. Real post-compromise behavior from real threat actors, documented by a team working across four shifts.

That is what we built. And you get to be part of it.

This document will walk you through everything you need to know before your first shift. Read the whole thing. It will save you a lot of confusion later.

---

## 1. What This SOC Is — And Why It Is Different

Most SOCs exist to stop attacks. When a threat is detected, the team springs into action to contain, remediate, and eject the attacker as fast as possible.

We do the opposite.

The Cyber Range SOC is a **tracking SOC**. The environment is intentionally vulnerable. We let attackers in — and then we follow them. We watch what they do, document how they move, map their techniques to MITRE ATT&CK, and build intelligence from their behavior.

We do not contain. We do not remediate. We do not evict.

Why? Because the most valuable thing you can learn as a security analyst is what attackers actually do after they get in. Not what vendor marketing says they do. Not what a lab exercise simulates. What they actually do — in a real enterprise environment, with real tooling, making real decisions.

That is what you will see here.

About 50 builders and 15 leaders across six teams keep this SOC running. The range runs on Microsoft Azure with up to 1,500 virtual machines. It is ambitious. It is real. And it is the kind of experience that genuinely changes how you think about security.

Welcome to it.

---

## 2. What You Will Learn Here

You will not just read about these tools. You will use them on live data.

| Tool / Skill | What You Will Do With It |
|---|---|
| **Microsoft Sentinel** | Write KQL queries, investigate alerts, build detection rules |
| **Microsoft Defender for Endpoint** | Review endpoint telemetry, trace process trees, analyze attacker behavior on hosts |
| **Microsoft Entra ID** | Track identity-based activity — credential use, account behavior, authentication patterns |
| **Log Analytics / KQL** | Query raw log data to find attacker activity that alerts did not catch |
| **Tenable** | Understand the attack surface — what is exposed, what is vulnerable, what the attacker likely knew |
| **MISP** | Work with threat intelligence — log indicators, look up threat actors, map TTPs |
| **Real Attacker Behavior** | See how attackers actually operate post-compromise — their tools, their decisions, their mistakes |
| **Shift Operations** | Run a real shift: open cases, write handoffs, coordinate with other analysts |
| **SOC Documentation** | Write documentation that actually helps your teammates — clear, complete, actionable |

None of this requires you to be an expert on day one. It requires you to show up, pay attention, and document what you see.

---

## 3. Three Things to Do Before Your First Shift

Before you touch a single ticket or open a single alert, complete these three steps.

**Step 1 — Join the Discord**
Discord is where the SOC lives. Shift coordination, tool alerts, quick questions, team channels — it all happens there. If you are not in Discord, you are not in the loop.
→ **[DISCORD LINK]**

**Step 2 — Submit your Gmail to the point person on Skool**
You will need a Gmail address to access shared Google Workspace resources — shift documents, tracking sheets, and collaborative materials. Find the point person in the Skool community and DM them your Gmail. Do not skip this step — you will need access before your first shift.

**Step 3 — Claim your role in the Phase 1 signup post**
Head to the Skool community and find the Phase 1 signup post. Claim the role and team that fits where you want to contribute. This is how you get added to the right team, the right Discord channels, and the right shift rotation.

Once those three things are done — you are ready.

---

## 4. Your Role Level

Everyone in the SOC operates at one of three levels. Know where you are starting and what is expected of you.

### T1 — Contributor

This is where most people start, and it is exactly where you should start.

**What you do:**
- Follow runbooks and SOPs to complete assigned tasks
- Document what you observe during your shift
- Open and update tickets in Jira (SOCOPS)
- Ask questions when you are not sure — asking is your job at this level
- Show up for your shift and complete your handoff

**What you do not do yet:**
- Make independent decisions about scope or priority without checking
- Modify any system, asset, or configuration in the range
- Close a deliverable ticket without reviewer sign-off

**When to escalate:** Any time something is happening that you do not have a runbook for, you are not sure what you are looking at, or something feels significant. Escalate early. It is never wrong to ask.

---

### T2 — Builder / Owner

T2s have demonstrated they understand the environment and can work independently.

**What you do:**
- Own deliverables end-to-end — from scoping through completion
- Mentor T1s during your shift
- Make judgment calls within your team's scope
- Review and sign off on work from your team
- Lead workstreams within your team

**What you do not do:**
- Make decisions that affect other teams without coordination
- Change scope or priorities without aligning with the point person

**When to escalate:** Cross-team conflicts, resource decisions, or anything that touches the infrastructure or the range configuration.

---

### Shift Lead

Shift Leads are responsible for the whole shift — not just their own work.

**What you do:**
- Check the SOCOPS board at the start of every shift
- Ensure active tracking cases have eyes on them
- Verify handoffs are complete and incoming analysts are briefed
- Flag tool issues, escalations, and anything needing leadership attention
- Be the person T1s and T2s can come to during the shift

**What you do not do:**
- Handle everything yourself — your job is coordination, not doing every task

**When to escalate:** Apply `status: escalated-to-soc-lead` and ping the SOC Lead on Discord directly for anything that needs a leadership decision.

---

## 5. Rules of Engagement

This section is short because the rules are simple. Read them carefully.

**We are observers and trackers. We are not responders.**

Your job is to document what the attacker is doing. Your job is not to stop them, warn systems, push patches, change configurations, or interfere with the range in any way. The environment is intentionally vulnerable. The attacker is supposed to be there.

**You will not make unauthorized changes to any system in the range.**

No patches. No firewall rules. No password resets. No account modifications. No configuration changes. If you see something that looks like it needs fixing — document it and bring it to the Infra team. You do not touch it yourself.

**Everything stays inside the SOC.**

What happens in the range stays in the range. You will see real attacker techniques, real credentials, real infrastructure details. None of that leaves the SOC. Do not screenshot and post to social media. Do not share case details outside the team.

**If you are unsure, ask before you act.**

There is no situation where acting without clarity is better than pausing and asking. Ask your Shift Lead. Ask in Discord. The worst outcome is a short delay. The alternative is much worse.

---

## 6. First Shift Checklist

Before you do anything else on your first shift, complete these:

- [ ] Read the Shift Handoff record from the previous shift
- [ ] Open and review all active tracking cases — read the full comment history
- [ ] Check tool health (Sentinel, MDE, MISP, honeypots, Tenable) — note anything flagged as degraded
- [ ] Introduce yourself in Discord in your shift channel if you have not already
- [ ] Find your Shift Lead and confirm you are present and ready
- [ ] Open the SOCOPS board and orient yourself: what is in Intake, Triage, Investigation, and Advisory
- [ ] Identify one task or tracking case you will focus on this shift — do not try to do everything
- [ ] Leave a receipt on the Shift Handoff record confirming you received the brief

If you get through all eight and still feel lost — that is normal. Post in Discord and ask your Shift Lead to walk you through what to focus on.

---

## 7. How to Ask for Help

Asking for help is a skill. Getting good at it will make your time here significantly better.

**Who to ask:**

- **Your Shift Lead** — for anything shift-related, tool questions, or "what should I be doing right now"
- **Your team channel in Discord** — for team-specific questions, process questions, anything that is not urgent
- **The Process & Documentation team:** for Jira questions, documentation questions, and template questions
- **#general or #help in Discord** — for anything that does not fit elsewhere

**What a good help request looks like:**

> "I am looking at TRK-20240315-JF and I can see the attacker was on WKSTN-047 at 14:00 UTC, but I cannot find any logs showing where they went next. I checked Sentinel with query `SOC-LateralMovement-WKSTN` and got nothing after 14:15. Am I looking in the right place, or is there another data source I should check?"

That tells someone exactly what you are trying to do, what you already tried, and what you need. Someone can answer that in 60 seconds.

**What a hard-to-answer help request looks like:**

> "I am confused about the case, can someone help?"

That requires someone to ask you five follow-up questions before they can actually help. Save everyone time — give context upfront.

**There are no stupid questions here.** Seriously. The only way to get bad at this job is to not ask when you do not know something. Ask early. Ask often.

---

## 8. Documentation Standards

Documentation is not a chore here. It is the product. The tracking cases, handoffs, and deliverables you document are what make this SOC valuable — for your own learning and for the whole team.

**What good documentation looks like:**

- **Specific** — includes hostnames, timestamps (UTC), command strings, alert IDs, query names
- **Observable** — describes what you saw, not what you assume happened
- **Actionable** — tells the next person what to do with the information
- **Complete** — fills out every field in the template, does not leave blanks

**Good example:**

> "As of 14:32 UTC, attacker executed `net user /domain` on WKSTN-047. This was captured in MDE process telemetry — process ID 4412, parent process cmd.exe. Sentinel alert ID 8801 fired at 14:33. This suggests the attacker is enumerating domain users, consistent with T1087.002."

**Poor example:**

> "Attacker did some recon stuff on the workstation around 2pm."

The poor example cannot be acted on. The time is vague, there are no artifact references, no technique mapping, and no specific system. If someone read that during a handoff they would have no idea where to start.

**Required fields on every ticket:**
- UTC timestamp for every observation
- Hostname or asset name (not just "a workstation")
- Tool or data source where the activity was observed
- MITRE ATT&CK technique if applicable
- What you want the next person to do with this information

On an Alert Case, the two fields you enter are **SOC - Disposition** and **SOC - Triage Note**.

When in doubt, write more. You can always summarize. You cannot recreate lost context.

---

## 9. The Mindset

You are not expected to know everything. You are expected to pay attention.

The analysts who get the most out of this SOC are not the ones who came in with the most experience. They are the ones who showed up consistently, documented carefully, asked questions without embarrassment, and kept going when something did not make sense.

This environment will expose you to things that feel overwhelming at first — Sentinel dashboards full of alerts, attacker activity spanning dozens of hosts, tool names and KQL queries and MITRE technique IDs flying around in Discord. That is normal. It settles.

What you are building here is not a single skill. You are building the habit of thinking like an analyst — of seeing a piece of data and asking the right question, of following a thread even when you are not sure where it leads, of writing it down even when you are not sure it matters.

That habit is worth more than any certification. And you build it by doing the work, shift after shift, ticket after ticket.

You are going to be good at this. Give it time.

See you in Discord.

— Jenna

---

*Questions about this document? Open a Jira ticket or ask in Discord. This is a living document; if something is wrong or missing, say so.*
