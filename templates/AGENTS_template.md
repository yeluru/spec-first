# [Product Name] — Agent Design Document (v1)

> Only include this file if your product uses AI agents.
> Specifies each agent's purpose, inputs, outputs, prompt strategy, and failure modes.
> All agents should run inside a stateful workflow (e.g. LangGraph).
> Trace all runs via an observability tool (e.g. LangSmith).

---

## Instructions for the AI

When generating this document, follow these rules:
- Every agent gets: Purpose, Model, Inputs, Outputs (with JSON schema), Prompt strategy, Failure modes
- The pipeline diagram must show SEQUENTIAL dependencies (A must finish before B starts)
  and PARALLEL opportunities (A, B, C can run simultaneously) separately
- Human-in-the-loop steps must be marked explicitly in the pipeline
- Prompt strategies should include: system role, non-negotiable rules, output format
- Failure modes must be a table: [what fails] → [what happens]
- Specify max retry/iteration limits for every loop to prevent runaway cost
- Specify which model each agent uses and WHY (reasoning, cost, speed trade-off)
- Cross-model evaluation: if one model generates, a DIFFERENT model should evaluate

---

## State Structure

```python
# Define the shared state that flows through the pipeline
class [ProductName]State(TypedDict):
    # Add fields here
    pass
```

---

## Pipeline Flow

```
[Entry point]
      ↓
[Agent 1]              ← [what it reads]
      ↓
[HUMAN-IN-THE-LOOP: ...]    ← user confirms/adjusts before pipeline continues
      ↓
[Agent 2]
      ↓
[Per-item, sequential within item:]
  [Agent 3]            ← must complete before Agent 4
      ↓
  [Agent 4]
      ↓
  ┌─────────────────────────────┐
  │  Parallel:                  │
  │  [Agent 5]                  │
  │  [Agent 6]                  │
  └─────────────────────────────┘
      ↓
  [Quality Agent]  ←────────────┐
      ↓                         │ revise loop (max N iterations)
  [Evaluator Agent] ────────────┘
      ↓
  [Final Agent]
      ↓
  [Output ready → notify UI]
```

---

## Agent Template

> Copy and fill in this block for each agent:

---

## Agent [N]: [Agent Name]

**Purpose:** [One sentence. What does this agent do?]

**Model:** `[model-name]` — [reason: e.g. "strong structured reasoning", "long-form quality", "fast, low-cost"]

**Inputs:**
- `[field]` — [description]
- `[field]` — [description]

**Outputs:**
```json
{
  "[field]": "[type and description]"
}
```

**Prompt strategy:**
```
System: [Role definition]

Rules:
1. [Rule]
2. [Rule]
3. Output strictly as JSON matching the schema.
```

**Failure modes:**
| Failure | Handling |
|---|---|
| [What can go wrong] | [What the system does] |
| Model refuses / errors | Retry once, then fail with clear error |

---

<!--
  Repeat the agent template above for every agent in your pipeline.
  Then add the sections below.
-->

---

## Model Selection Summary

| Agent | Model | Why |
|---|---|---|
| [Agent name] | [model] | [reason] |

> BYOK: if user provides their own API key, all agents use that provider.

---

## Evaluation Datasets (Development)

> For each agent, maintain an evaluation dataset in your observability tool.

| Dataset | What it tests |
|---|---|
| `[agent]-eval` | [What correct behavior looks like] |

> Run evals after any prompt change to a core agent before deploying.

---

*Last updated: [DATE]*
*Referenced by: SPEC.md Section [N]*
