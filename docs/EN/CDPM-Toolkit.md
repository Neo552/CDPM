---
title: "CDPM Toolkit"
subtitle: "Checklists & Templates"
description: "Practical checklists, templates, and guides for introducing and implementing Context Driven Project Management (CDPM)"
toc: true
---

# Checklists & Templates - Toolkit

## Kick-off Checklist (Pilot):

- Sponsor/PRO appointed, RACI confirmed

- Target metrics & baseline-0 date fixed

- Context template selected/adapted

- Distillation channels set up (alias, tags)

- Rituals scheduled (Daily/Weekly/Bi-Weekly)

- Approval thresholds and audit trail defined

## Definition of Done - Distillate:

- Effect explicit (time/budget/scope/goal)

- Sources/evidence linked

- Affected context elements referenced

- Commit metadata set (who/when/why)

## Template - Minimal Context (JSON Schema, simplified):

```json
{
  "Goals": [],
  "Scope": {},
  "Timeline": {"milestones": []},
  "Budget": {"total": 0, "items": []},
  "Risks": [],
  "Dependencies": [],
  "SuccessCriteria": [],
  "ActionItems": [],
  "CommitLog": []
}
```

## Context JSON (core structure)

The following JSON template contains only the core context fields and action items.

```json
{
  "id": "proj-123",
  "name": "Example Project",
  "fileName": "project.json",
  "folderName": "example-project",
  "categories": [
    { "id": "cat-1", "name": "Backlog", "parentId": null, "collapsed": false }
  ],
  "actionItems": [
    {
      "id": 1,
      "text": "Define MVP scope",
      "description": "Acceptance criteria: MVP feature set functional, tests passed, stakeholder sign-off.",
      "status": "open",
      "priority": 70,
      "impact": "high",
      "complexity": "moderate",
      "urgency": "medium",
      "responsible": "user-1",
      "startDate": "2025-09-01",
      "dueDate": "2025-09-30",
      "planBudget": { "value": 0, "currency": "EUR" },
      "isBudget": { "value": 0, "currency": "EUR" },
      "planEffort": { "value": 8, "unit": "hours" },
      "isEffort": { "value": 0, "unit": "hours" },
      "dependencies": []
    }
  ],
  "projectDescription": "Short project description ...",
  "projectGoal": "Top-level goal ...",
  "projectScope": "Scope boundaries ...",
  "successCriteria": [
    { "id": "crit-1", "content": "MVP feature set accepted" }
  ],
  "timeframe": { "start": "2025-09-01", "end": "2025-12-31" },
  "budget": { "amount": 100000, "currency": "EUR" },
  "mainRequirements": {
    "rows": [
      { "id": "row-1", "cells": [ { "id": "cell-1", "content": "Requirement A" } ] }
    ]
  },
  "technologiesMethods": {
    "rows": [
      { "id": "row-1", "cells": [ { "id": "cell-1", "content": "Tech A" } ] }
    ]
  },
  "milestones": {
    "rows": [
      { "id": "row-1", "cells": [ { "id": "cell-1", "content": "M1: MVP" } ] }
    ]
  },
  "dependencies": "Dependency: Supplier API",
  "risks": {
    "rows": [
      { "id": "row-1", "cells": [ { "id": "cell-1", "content": "Risk A" } ] }
    ]
  },
  "projectStatus": "on_track"
}
```

Notes:
- Priority: integer 1–100 (1 = lowest priority, 100 = highest)
- Impact: minimal | low | medium | high | critical
- Complexity: very simple | simple | moderate | complex | very complex
- Urgency: very low | low | medium | high | overdue

# Introduction & Pilot Projects

This chapter describes how Context Driven Project Management (CDPM) is pragmatically introduced and validated in a pilot project. The goal is quick, measurable value without big-bang transformation. CDPM supplements existing work methods and makes them context-capable, versionable, and AI-usable.

## Target Vision for Implementation

Guiding principle: Context before artifact. The pilot serves to prove that a leading project truth (SSOT)—managed through a cycle of distillation, analysis, and guidance—is operationally sustainable and enables measurably better decisions.

### Pilot Results (Definition of Success):

- A living SSOT (context) with basic components, the first action items, and a complete commit history is established and actively maintained.

- Rolling forecasts, risk assessments, and status projections are generated automatically or semi-automatically from the context.

- Delta latency (the time from a raw update to a context commit) is significantly reduced, while forecast stability increases.

- Stakeholders can independently run "what-if" scenarios via an AI interface (e.g., chat). The simulation's result serves as a dynamic basis for decisions without directly altering the context.

- Quick wins are evident, such as a 50% reduction in reporting effort and fewer surprises at milestone reviews.

## Pilot Blueprint

**Recommended scope:** 6-10 weeks, one project of medium complexity (clear scope, real dependencies, external signals). No "moonshot," but also not trivial.

### Team & Roles

- **PRO - Project Owner (Guardian):** Responsible for the distillation process, context validity, commit formalities, and baselines. Does not hold authority over content decisions.

- **Stakeholders/Delivery Leads:** Make **functional** trade-offs, approve impacts (on time/budget/scope/goals), provide updates, and implement AIs.

- **Sponsorship/Management:** Ensures the framework's integrity and transparency, moderates escalations, and does **not** make content decisions on behalf of others.

- **AI Assistance/Agents:** Fulfill roles in Context, Analysis, Guidance, Update, and Reporting. They operate on a "read → propose → justify" basis and are **not permitted to auto-commit**.

### Governance

- **RACI:** R=PRO (form/validity), **A=responsible stakeholders** (technical decisions), C=Experts, I=Organization via reports.

- **Approval Rule:** **No context commit is permitted without PRO approval** of its **form and validity**, along with documented **technical acceptance** from the source or a named stakeholder.

- **Small-Delta Batches:** Changes below a certain threshold (e.g., ≤ 5 WD / ≤ 10k) can be committed in batches, provided the source and affected parties are clearly listed.

### Tooling (minimal, low-mapping)

- **Context repository** (Doc/OneNote/DB/Repo with versioning of **commits/merges**).

- **Light connectors** to email/calendar/ticketing (ingest only).

- **Views** (roadmap/Gantt, status, risk, finance) as **thin artifacts** from the context.

- **AI optional:** Distillation suggestions, completeness check, scenarios.

### Data & Security

- Access for **all stakeholders + AI** according to role; shadow tools only for raw updates.

- Logging of sources/commits (audit trail); pseudonymization of sensitive content.

## Process in 6-10 Weeks (Cadence)

### Week 0: Preparation

- Select project, appoint sponsor, confirm PRO.

- Define pilot scope, target metrics, and success criteria.

- Agree on baseline-0 date and reporting rhythm.

### Week 1-2: Set Up MV-CDPM

- Create basic context (Goals, Scope, Timeline, Budget, Risks, Dependencies, Success Criteria, first Milestones).

- First analysis (completeness, triad tensions, critical path) → Top-10 action items with goal reference.

- Clarify distillation channels (email alias, meeting tagging, tool ingest); establish Daily Distillation Window (10-20 min).

- Make rolling forecast visible as projection; draw baseline-0.

### Week 3-6: Stabilize Cycle

- Continuous updates → distillates → commits; prioritize analysis findings.

- Guidance: Splitting/merging, re-prioritization by goal contribution/risk/time effect.

- Weekly Context Review (60 min): Hotspots, buffers, critical paths, decisions.

- Bi-weekly Forecast Update: Scenarios ("+1 team", "-2 features", "+150k") with explicit triad effects.

### Week 7-10: Prove Impact & Scale

- Review metrics (delta latency, context freshness, forecast stability, coverage, risk burn-down, outcome alignment).

- Show "before/after" in management review; lessons learned → standard (templates, checklists, thresholds).

- Decision: Roll-out to second project category / portfolio pilot.

## Quick Wins and Metrics

### Quick Wins (typical):

1.  **Rapid Transparency:** Establish a reliable project status in days, not weeks.
2.  **More Efficient Meetings:** Meetings transform from information exchange to decision workshops. The shared situational picture already exists, discussion immediately starts at strategic level.
3.  **Accelerated Onboarding:** New team members become productive in hours, not weeks. The central context provides a complete picture of goals, history, and current project status.
4.  **Objective Prioritization:** Prioritization follows project impact, not the loudest opinion. Decisions become objectively traceable and aligned with contribution to project goals.
5.  **Increased Stakeholder Trust:** End the "watermelon reporting" (green outside, red inside). Radical transparency and self-service inquiry capabilities build trust and reduce political maneuvering.
6.  **Early Warning System for Dependencies:** Domino effects become immediately visible. The system acts as an early warning system by showing the impact of delays on the entire project plan in real-time.
7.  **Reporting as a Byproduct:** Automated reports cut manual effort in half.
8.  **Better Decisions:** Safely explore "what-if" scenarios before committing to a change.

### Metrics (excerpt):

- Delta Latency ↓, PX ↓, DoCR ↑, Forecast Stability ↓ variance

- AI adoption KPIs (if active): Distillate precision/recall, acceptance rate of suggestions, forecast accuracy delta.

## Typical Pitfalls & Countermeasures

### Tool-First Instead of Context-First.

**Countermeasure:** Keep tooling minimal; every change must land in context first, artifacts are projections.

### "Everything into the Backlog" Without a Clear Target.

**Countermeasure:** Enforce the "one update, one target component" distillation rule; no commits are allowed without a clear assignment.

### Diffusion of Responsibility.

**Countermeasure:** Designate the PRO as the single point of truth, clarify the RACI matrix at kick-off, and document the approval rule in writing.

### Over-Prioritization Based on Capacity.

**Countermeasure:** Strictly align prioritization with goal contribution, risk mitigation, and time impact. Capacity should follow the context, not the other way around.

### Unclear Data Compliance.

**Countermeasure:** Implement pseudonymization, maintain access logs, and define clear storage locations. Conduct a small-scale DPIA if necessary.

## Change Management & Communication

- **Narrative:** Less politics, more impact. Decisions become explainable, reporting easier, surprises rarer.

- **Formats:** Short demo of SSOT, "live distillation" from real email, what-if scenario before sponsors.

- **Anchor rituals:** Daily Distillation Window, Weekly Context Review, Bi-Weekly Forecast Update.

- **Enablement:** Quick guides (1-pagers), context templates by project type, checklist "Definition of Done (Distillate)".

## Following Up: Scaling & Standardization

- **Standard kit:** Context templates per project type, thresholds (WD/€), distillation guide, PRO role description, KPI deck.

- **Portfolio view:** Comparable contexts enable objective resource allocation; reporting becomes organizationally homogeneous.

- **AI maturity levels:** from M0 (manual) to M3 (proactive, always with approval) - pilot provides data foundation.

## Effort & Investment

- **Time:** PRO effort initially 1-2 PT/week, later 0.5-1 PT/week depending on update volume.

- **Tooling:** Using existing platforms suffices for start; invest in connectors/automation evidence-driven.

- **Change/Enablement:** Short trainings, 1-pagers, brown-bag sessions, live demos.

## Summary

CDPM can be introduced without disruption. Start small, establish the context as the leader, measure the impact, and then scale. The pilot makes the core concepts tangible—context before artifact—and demonstrates how fragmented information can be transformed into a living project reality that accelerates decisions, mitigates risks, and turns reporting into a natural byproduct.
