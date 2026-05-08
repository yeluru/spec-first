# spec-first

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> **Stop building the wrong thing.**
> spec-first turns your AI assistant into a Socratic design partner that produces a complete, developer-ready product specification — before you write a single line of code.

---

## Quick Start

```bash
curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/install.sh | bash
```

Auto-detects Claude, Cursor, Windsurf, Copilot, and Codex. Installs to the right place for each.

Then just say *"I want to build X"* — spec-first takes over from there.

---

## The Problem

Most builders open their IDE the moment they have an idea. Weeks later, they realize they've been solving the wrong problem for the wrong user, with a data model that can't support the features they actually need.

AI coding tools made this worse. With Claude or Cursor in the room, you can go from idea to running code in thirty minutes — which means you can build the wrong thing at unprecedented speed.

**spec-first fixes this at the root.**

> *The spec is the building. Everything else is just typing.*

---

## What You Get

A complete Software Design Document in five files — produced through conversation, before any code:

| File | What's Inside |
| --- | --- |
| `SPEC.md` | Product vision, target users, features, business model, tech stack, NFRs with real numbers |
| `DATAMODEL.md` | Every table, column, type, constraint, index, and RLS policy — ready to run |
| `API.md` | Every endpoint with method, path, auth, full request/response shapes, and error codes |
| `SCREENS.md` | Every UI screen with layout, all elements, interactions, and edge case behavior |
| `AGENTS.md` | Every AI agent with typed inputs/outputs, full system prompt, model config, failure handling |

The session is done when **a stranger could build exactly what you have in your head — without asking you anything.**

---

## Why It Works

Most design sessions fail because the AI is too agreeable. It takes your vague answer and moves on. spec-first doesn't.

It asks one question at a time and **pushes back** when:

- Your audience is too broad (*"any industry, any level"* → *"Who are you actually building for first?"*)
- Your scope creeps into V2 (*"we'll also need..."* → *"Is this V1 or are we building the whole platform?"*)
- Your numbers have no basis (*"we'll handle a million users"* → *"How did you arrive at that number?"*)
- You use lazy words (*"simple"*, *"just"* → *"Simple for whom? Unpack it."*)

Every decision gets locked with ✅ before moving on. Nothing progresses while open debates 🔄 or unknowns ❓ exist. By the time documents are generated, there is nothing left to guess.

---

## Install

### One-line installer (recommended)

```bash
curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/install.sh | bash
```

Detects and installs for every supported tool found on your machine.

### Manual install by tool

| Tool | Command |
| --- | --- |
| **Claude / Cowork** | `git clone https://github.com/yeluru/spec-first ~/.claude/skills/spec-first` |
| **Codex** | `git clone https://github.com/yeluru/spec-first ~/.codex/skills/spec-first` |
| **Cursor** (global) | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/cursorrules > ~/.cursor/rules/spec-first.mdc` |
| **Cursor** (per-project) | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/cursorrules > .cursorrules` |
| **Windsurf** | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/cursorrules > ~/.windsurf/rules/spec-first.md` |
| **GitHub Copilot** | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/cursorrules > .github/copilot-instructions.md` |
| **ChatGPT / Gemini / any LLM** | Paste [`formats/system-prompt.md`](./formats/system-prompt.md) into custom instructions |

---

## How a Session Works

### Phase 1 — Discovery

The AI works through 11 design domains in order, one question at a time. No domain closes until every decision in it is locked with ✅.

1. **Vision** — what is this, in one sentence to a smart friend?
2. **Audience** — who specifically? Who is it NOT for?
3. **Core flow** — step by step, what does the user actually do?
4. **Features & scope** — what's in V1, what's explicitly out?
5. **AI rules** — if AI is involved, what can it touch vs. never touch?
6. **Business model** — pricing, tiers, cost basis, payment infrastructure
7. **Tech stack** — what gets built on what? No vague answers.
8. **Auth** — how do users log in?
9. **Storage** — where do files, data, and generated content live?
10. **NFRs** — real numbers for latency, uptime, scale, security, privacy
11. **Roadmap** — V2/V3 documented and explicitly locked out of scope

### Phase 2 — Final check

Before writing anything, the AI lists every locked decision, surfaces remaining unknowns, and asks: *"Is there anything a developer would need to know that we haven't discussed?"*

### Phase 3 — Document generation

One file at a time: `SPEC.md` → `DATAMODEL.md` → `API.md` → `SCREENS.md` → `AGENTS.md`. Each follows a strict template. No hand-waving, no placeholders.

After the last file: *"Could a developer who was not in this conversation build exactly what you have in your head — without asking you anything? Tell me honestly what's missing."*

---

## Prompts That Keep the Session Honest

Use these when the conversation needs a nudge:

```
What's wrong with what I just said? Push back hard.
```

```
Don't give me options. Tell me what you'd recommend and why.
```

```
Do a full pass — what's still ❓ or 🔄?
```

```
Is this a V1 feature or am I describing V2?
```

More in [`prompts/02_session_tips.md`](./prompts/02_session_tips.md).

---

## Handing the SDD to a Coding Tool

Once your spec is locked, reference it explicitly in every build prompt:

```
Using SPEC.md, DATAMODEL.md, and API.md as your reference, scaffold the
FastAPI backend with SQLAlchemy models and the auth routes.

Before writing any code, show me the full folder tree you plan to create
and wait for my approval.
```

The spec becomes your source of truth. The AI stops inventing and starts building.

---

## What's in This Repo

```
spec-first/
├── SKILL.md                      ← Claude / Cowork skill definition
├── EXPERIENCE.md                 ← Three real spec sessions, what actually happened
├── install.sh                    ← auto-detect installer for all tools
├── formats/
│   ├── system-prompt.md          ← universal prompt for ChatGPT, Gemini, any LLM
│   └── cursorrules               ← Cursor / Windsurf / Copilot rules
├── prompts/
│   ├── 01_starter.md             ← the one prompt to start a session manually
│   └── 02_session_tips.md        ← prompts to keep the session honest
└── templates/
    ├── SPEC_template.md
    ├── DATAMODEL_template.md
    ├── API_template.md
    ├── SCREENS_template.md
    └── AGENTS_template.md
```

---

## Real Sessions

[`EXPERIENCE.md`](./EXPERIENCE.md) walks through three real products spec'd with this methodology:

- **HireVault** — a local-first resume extraction tool, and why a single constraint question rewrote the entire architecture before a line was coded
- **JDX** — a job description intelligence engine, and how "Resume Matcher" became the wrong name right before the spec was locked
- **AgentRoom** — a hybrid voice meeting platform, and how a latency number that didn't exist yet shaped every backend decision that followed

These aren't sanitized examples. They're the actual moments where the session forced a decision that would have been a rewrite mid-build.

---

## Contributing

Used spec-first on a real project? Improved the prompts? Found a better way to handle a specific domain?

PRs are welcome. If you want to add tool support, add both a format file in `formats/` and install instructions in the README.

---

## License

MIT — see [LICENSE](./LICENSE).
