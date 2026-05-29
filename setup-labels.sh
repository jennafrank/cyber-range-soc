#!/usr/bin/env bash
# setup-labels.sh
# Creates all cyber-range-soc GitHub labels using the GitHub CLI (gh).
#
# Usage:
#   ./setup-labels.sh <owner/repo>
#
# Example:
#   ./setup-labels.sh your-org/cyber-range-soc
#
# Requirements:
#   - GitHub CLI installed: https://cli.github.com
#   - Authenticated: run `gh auth login` first
#   - Write access to the target repository

set -euo pipefail

REPO="${1:-}"

if [[ -z "$REPO" ]]; then
  echo "Error: No repository specified."
  echo "Usage: ./setup-labels.sh <owner/repo>"
  exit 1
fi

echo "Creating labels for: $REPO"
echo "──────────────────────────────────────────"

create_label() {
  local name="$1"
  local color="$2"
  local description="$3"

  if gh label create "$name" \
    --color "$color" \
    --description "$description" \
    --repo "$REPO" \
    --force 2>/dev/null; then
    echo "  [OK] $name"
  else
    echo "  [FAIL] $name"
  fi
}

# ──────────────────────────────────────────────
# SEVERITY
# ──────────────────────────────────────────────
echo ""
echo "SEVERITY"
create_label "severity: critical"  "B60205" "Active high-value attacker behavior requiring immediate documentation"
create_label "severity: high"      "E4801A" "Significant post-compromise activity worth deep investigation"
create_label "severity: medium"    "FBCA04" "Interesting attacker behavior worth documenting"
create_label "severity: low"       "0E8A16" "Routine activity, low investigative priority"

# ──────────────────────────────────────────────
# TYPE
# ──────────────────────────────────────────────
echo ""
echo "TYPE"
create_label "type: tracking-case"  "5319E7" "Active attacker behavior being followed"
create_label "type: shift-handoff"  "0075CA" "Shift transition ticket"
create_label "type: deliverable"    "006B75" "Phase deliverable task"
create_label "type: tool-issue"     "666666" "Infrastructure or tool problem"

# ──────────────────────────────────────────────
# TEAM
# ──────────────────────────────────────────────
echo ""
echo "TEAM"
create_label "team: detection-eng"  "B60205" "Detection Engineering team"
create_label "team: tracking-ir"    "5319E7" "Tracking & Incident Response team"
create_label "team: threat-intel"   "0075CA" "Threat Intelligence team"
create_label "team: infra"          "24292E" "Infrastructure & Tooling team"
create_label "team: mini-soc"       "006B75" "Mini SOC Honeypot Team"
create_label "team: process-docs"   "795548" "Process & Documentation team"

# ──────────────────────────────────────────────
# STATUS
# ──────────────────────────────────────────────
echo ""
echo "STATUS"
create_label "status: new"               "C5DEF5" "Newly opened, not yet assigned or started"
create_label "status: in-progress"       "FEF2C0" "Actively being worked"
create_label "status: needs-review"      "F9D0C4" "Work complete, awaiting review"
create_label "status: done"              "C2E0C6" "Completed and closed"
create_label "status: escalated-to-josh" "B60205" "Escalated to lead for decision or action"

# ──────────────────────────────────────────────
# PHASE
# ──────────────────────────────────────────────
echo ""
echo "PHASE"
create_label "phase: 1" "EDEDED" "Phase 1 deliverable"
create_label "phase: 2" "EDEDED" "Phase 2 deliverable"
create_label "phase: 3" "EDEDED" "Phase 3 deliverable"
create_label "phase: 4" "EDEDED" "Phase 4 deliverable"
create_label "phase: 5" "EDEDED" "Phase 5 deliverable"

# ──────────────────────────────────────────────
# MITRE ATT&CK STAGE
# ──────────────────────────────────────────────
echo ""
echo "MITRE ATT&CK STAGE"
create_label "att&ck: initial-access"      "1D1D1D" "MITRE ATT&CK — Initial Access (TA0001)"
create_label "att&ck: execution"           "1D1D1D" "MITRE ATT&CK — Execution (TA0002)"
create_label "att&ck: persistence"         "1D1D1D" "MITRE ATT&CK — Persistence (TA0003)"
create_label "att&ck: lateral-movement"    "1D1D1D" "MITRE ATT&CK — Lateral Movement (TA0008)"
create_label "att&ck: exfiltration"        "1D1D1D" "MITRE ATT&CK — Exfiltration (TA0010)"
create_label "att&ck: command-and-control" "1D1D1D" "MITRE ATT&CK — Command and Control (TA0011)"
create_label "att&ck: defense-evasion"     "1D1D1D" "MITRE ATT&CK — Defense Evasion (TA0005)"
create_label "att&ck: credential-access"   "1D1D1D" "MITRE ATT&CK — Credential Access (TA0006)"

echo ""
echo "──────────────────────────────────────────"
echo "Done. All labels processed for $REPO"
