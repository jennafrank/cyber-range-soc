# How to Use GitHub — Cyber Range SOC

Hey, welcome. If you have never used GitHub before, that is completely fine. This guide will walk you through everything you need to do your job here. You do not need to be a developer. You do not need to know how to code. GitHub is just how we keep track of our work — and this doc will show you exactly how.

Read this once. Keep it bookmarked. You will probably not need it after your first week.

---

## 1. Why We Use GitHub

The Cyber Range SOC runs across four shift rotations with about 50 builders and 15 leaders. That means at any given moment, someone is handing off to someone else, picking up a case mid-stream, or starting fresh with no context.

GitHub is how we make sure nothing gets lost.

Every observation, every task, every handoff, every deliverable lives here as a **ticket** (called an Issue in GitHub). That ticket is the record. It is searchable, linkable, and visible to everyone on the team.

Which brings us to the most important rule in this SOC:

> **If there is no ticket, it did not happen.**

Saw something interesting? Open a ticket. Finished a handoff? Open a ticket. Fixed a tool issue? Open a ticket. Working on a deliverable? There should already be a ticket — go find it and add yourself.

This is not bureaucracy. It is how we function as a team across time zones and shift rotations.

---

## 2. The Four Ticket Types

When you go to open a new issue, you will see four templates. Here is when to use each one:

| Template | Use It When... |
|----------|----------------|
| **Attacker Tracking Case** | You are observing and documenting post-compromise attacker behavior in the range |
| **Shift Handoff** | Your shift is ending and you need to pass context to the incoming analyst |
| **Deliverable Task** | You are working on (or claiming) a phase deliverable |
| **Tool / Infrastructure Issue** | Something is broken — a tool is down, telemetry is missing, alerts stopped firing |

When in doubt, pick the template that is closest to what you are doing. You can always ask in Discord if you are not sure.

---

## 3. How to Open a Ticket

This is the most common thing you will do here. It takes about two minutes.

1. Go to the **Issues** tab at the top of the repository page
2. Click the green **New Issue** button on the right
3. You will see a list of templates — click **Get started** next to the one that fits your situation
4. Give the issue a **clear title** — the template will pre-fill the prefix (like `[TRACKING]` or `[HANDOFF]`)
5. **Fill out the template fields** — do your best, leave nothing blank if you can help it. If you genuinely do not know something, write "unknown" rather than skipping it
6. **Add labels** on the right sidebar — at minimum add your team label and the appropriate severity or status label
7. **Assign yourself or the right person** in the Assignees field on the right
8. Click **Submit new issue**

That is it. You just made a ticket.

---

## 4. How to Update a Ticket

Tickets are living documents. As a tracking case develops, a tool issue gets investigated, or a deliverable moves forward — the ticket should reflect that.

**The right way to update a ticket:**

- Scroll to the bottom of the issue and **leave a comment** with your new information
- Use **@mentions** to bring in another analyst — type `@` followed by their GitHub username and they will get a notification
- Update the **labels** on the right sidebar if the status has changed (for example, from `status: new` to `status: in-progress`)
- If you are the incoming analyst on a handoff, leave a comment confirming you received the brief

**What not to do:**

- Do not go back and edit the original description to add new information. The description is a snapshot of what was known at open time. New information goes in comments. This keeps the timeline intact.

---

## 5. How to Close a Ticket

Not everyone closes every ticket. Here is who closes what:

| Ticket Type | Who Closes It |
|-------------|---------------|
| Attacker Tracking Case | The analyst who determines the chain has gone cold or visibility is lost — note what was observed and why the case is being closed |
| Shift Handoff | The incoming analyst, after confirming they have read the handoff and received a briefing |
| Deliverable Task | The **Reviewer** — after they have reviewed the work and left sign-off in the comments |
| Tool / Infrastructure Issue | The Infra point person, after the issue is resolved and tool health is confirmed |

Before closing any ticket, leave a comment explaining why it is being closed. "Closing — visibility lost at [asset], no further activity observed" is enough. Never close a ticket silently.

---

## 6. How to Use Labels

Labels are colored tags that help the whole team filter, sort, and understand tickets at a glance. You will use them every time you open or update an issue.

**How to add labels:**

1. Open the issue
2. Look at the right sidebar and click **Labels**
3. A dropdown will appear — click the labels you want to apply
4. Click anywhere outside the dropdown to close it

Labels save automatically. You can add or remove them at any time.

**Quick reference:**

| Category | Examples | What It Tells Us |
|----------|----------|-----------------|
| `severity:` | critical, high, medium, low | How important or urgent this is |
| `type:` | tracking-case, shift-handoff, deliverable, tool-issue | What kind of ticket this is |
| `team:` | detection-eng, tracking-ir, threat-intel, infra, mini-soc, process-docs | Which team owns this |
| `status:` | new, in-progress, needs-review, done | Where this ticket is in its lifecycle |
| `phase:` | phase-1 through phase-5 | Which project phase this belongs to |
| `att&ck:` | initial-access, persistence, lateral-movement, etc. | Which MITRE ATT&CK stage was observed |

Try to always have at least a `type:`, `team:`, and `status:` label on every ticket.

---

## 7. The Project Board

The project board is a visual overview of all active work organized into columns. Think of it like a Kanban board — cards (tickets) move left to right as work progresses.

**The columns:**

| Column | What It Means |
|--------|---------------|
| **Backlog** | Tickets that exist but no one has started yet |
| **In Progress** | Someone is actively working on this right now |
| **Needs Review** | Work is done and waiting on a reviewer |
| **Done** | Completed and closed |

**How to move a card:**

You can drag and drop cards between columns on the board, or you can update the status label on the issue itself — the board will update automatically if it is configured to do so.

Check the board at the start of your shift to see what is active across the whole SOC.

---

## 8. Escalate to the SOC Lead

`status: escalated-to-soc-lead` is a special label that means: this ticket needs a decision or action from the SOC Lead that the team cannot resolve on their own.

**When to use it:**

- The tracking case is significant enough that leadership should be aware
- A tool is critically broken and the Infra team needs senior support
- There is a process or scope question that no one on shift can answer
- Something is happening that you believe needs a human decision fast

**Who can apply it:**

Anyone. If you think something needs to go to the SOC Lead, apply the label and leave a comment explaining why. Do not sit on it waiting for permission.

**What to do after applying it:**

Ping the SOC Lead directly on Discord with a link to the ticket. The label alone may not get their attention quickly enough. The label creates the record; the Discord message creates the urgency.

---

## 9. The Golden Rules

1. **If there is no ticket, it did not happen.** Observations, handoffs, finished tasks — all of it needs a ticket.

2. **Comments are for new information. The description is a snapshot.** Do not edit the original description. Leave updates as comments so the timeline stays intact.

3. **Labels are not optional.** Every ticket should have a type, team, and status label before it is submitted.

4. **Do not close tickets silently.** Always leave a comment explaining why you are closing. Give the next person enough context to understand what happened.

---

## 10. Getting Help

Stuck on something GitHub-related? That is normal. Here is how to get help without spinning your wheels.

**Who to ask:**

- The **Process & Documentation team** owns this guide and GitHub workflows — they are your first stop
- Your **Shift Lead** can also answer most GitHub questions during your shift
- The `#github-help` channel on Discord (if it exists) is a good place for quick questions

**How to ask a good question:**

A good help request gives people enough context to actually help you. Here is a simple format:

> "I am trying to [do X]. I expected [Y to happen] but instead [Z happened]. Here is the ticket I am working on: [link]."

That is it. The more specific you are, the faster someone can help.

**What not to do:**

- Do not ask "can someone help me with GitHub" without any context — it is hard to help without knowing what you are trying to do
- Do not DM someone cold without at least one attempt in a public channel first — your question might help someone else who has the same one

You are not expected to know everything. Ask early, ask often.

---

*Last updated by the Process & Documentation team. If something in this guide is wrong or out of date, open a ticket.*
