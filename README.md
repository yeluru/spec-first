# spec-first

> **Stop building the wrong thing.**
> spec-first is a Socratic AI methodology that produces a complete, developer-ready product specification — before you write a single line of code.

---

Most builders open their IDE the moment they have an idea. Weeks later, they realize they've been solving the wrong problem for the wrong user, with a data model that can't support the features they actually need.

**spec-first fixes this at the root.**

It turns your AI assistant into a relentless Socratic design partner — one question at a time, no hand-waving, no "we'll figure it out later." By the end of a session, you have five documents so precise that a developer who wasn't in the room could build exactly what you have in your head, without asking you a single question.

> *The spec is the building. Everything else is just typing.*

---

## What You Get

A complete Software Design Document in five files — produced through conversation, before any code:

| File | What's Inside |
|---|---|
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

- Your audience is too broad (*"any industry, any level"* → "Who are you actually building for first?")
- Your scope creeps into V2 (*"we'll also need..."* → "Is this V1 or are we building the whole platform?")
- Your numbers have no basis (*"we'll handle a million users"* → "How did you arrive at that number?")
- You use lazy words (*"simple"*, *"just"* → "Simple for whom? Unpack it.")

Every decision gets locked with a ✅ before moving on. Nothing progresses while open debates 🔄 or unknowns ❓ exist. By the time documents are generated, there is nothing left to guess.

---

## Works With Every Tool You Already Use

Install once. Use everywhere.

```bash
curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/install.sh | bash
```

Auto-detects and installs for every tool found on your machine. Or install manually:

| Tool | How |
|---|---|
| **Claude Code CLI / Cowork** | `git clone https://github.com/yeluru/spec-first ~/.claude/skills/spec-first` → use `/spec-first` |
| **Cursor** (global) | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/cursorrules > ~/.cursor/rules/spec-first.mdc` |
| **Cursor** (per-project) | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/cursorrules > .cursorrules` |
| **Windsurf** | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/cursorrules > ~/.windsurf/rules/spec-first.md` |
| **GitHub Copilot** | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/cursorrules > .github/copilot-instructions.md` |
| **Codex CLI** | `curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/formats/system-prompt.md >> ~/.codex/instructions.md` |
| **ChatGPT / Gemini / any LLM** | Paste [`formats/system-prompt.md`](./formats/system-prompt.md) into custom instructions |

Once installed, just say *"I want to build X"* — spec-first takes over from there.

---

## How a Session Works

### Phase 1 — Discovery

Your AI works through 11 design domains in order, one question at a time. No domain is closed until every decision in it is locked with ✅.

1. **Vision** — what is this, in one sentence to a smart friend?
2. **Audience** — who specifically? Who is it NOT for?
3. **Core flow** — step by step, what does the user actually do?
4. **Features & scope** — what's in v1, what's explicitly out?
5. **AI rules** — if AI is involved, what can it touch vs. never touch?
6. **Business model** — pricing, tiers, cost basis, payment infrastructure
7. **Tech stack** — what gets built on what? No vague answers.
8. **Auth** — how do users log in?
9. **Storage** — where do files, data, and generated content live?
10. **NFRs** — real numbers for latency, uptime, scale, security, privacy
11. **Roadmap** — V2/V3 documented and locked out of scope

### Phase 2 — Final check

Before writing anything, the AI lists every locked decision, surfaces remaining unknowns, and asks: *"Is there anything a developer would need to know that we haven't discussed?"*

### Phase 3 — Document generation

One file at a time: SPEC.md → DATAMODEL.md → API.md → SCREENS.md → AGENTS.md. Each file follows a strict template. No hand-waving, no placeholders.

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
```
Could a developer who was not in this conversation build from this spec without asking me anything?
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
├── SKILL.md                         ← Claude Code CLI / Cowork skill definition
├── install.sh                       ← auto-detect installer for all tools
├── formats/
│   ├── system-prompt.md             ← universal prompt for ChatGPT, Gemini, Codex, etc.
│   └── cursorrules                  ← Cursor / Windsurf / Copilot rules
├── prompts/
│   ├── 01_starter.md               ← the one prompt to start a session manually
│   └── 02_session_tips.md          ← prompts to keep the session honest
└── templates/
    ├── SPEC_template.md
    ├── DATAMODEL_template.md
    ├── API_template.md
    ├── SCREENS_template.md
    └── AGENTS_template.md
```

---

## The Full Story

> [How I wrote my product spec with AI before writing a single line of code](./EXPERIENCE.md)

A first-person account of running a real SDD session — the questions that unlocked everything, where the AI pushed back and why it mattered, and what the finished spec looked like.

---

## Contributing

Used spec-first on a real project? Improved the prompts? Found a better way to handle a specific domain?

PRs are welcome. If you want to add tool support, add both a format file in `formats/` and install instructions in the README.

If you produced a spec using this methodology and want to share a sanitized version (product details removed), open a PR to add it to `/examples` — real-world specs are the best documentation.

---

*Built spec-first. No product details included — just the methodology.*
