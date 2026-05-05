# sdd-with-ai

> **Spec-Driven Development with AI** — a reusable methodology for writing a complete,
> buildable product specification before writing a single line of code.

The spec is the building. Everything else is just typing.

---

## Install

Works with Claude Code CLI, Claude Cowork, Cursor, Windsurf, GitHub Copilot, Codex CLI, Antigravity, ChatGPT, Gemini, and any LLM tool with a system prompt field.

**One-liner — auto-detects your tools:**

```bash
curl -sL https://raw.githubusercontent.com/yeluru/sdd-with-ai/main/install.sh | bash
```

**Or install manually for your tool:**

| Tool | Command |
|---|---|
| Claude Code CLI / Cowork | `git clone https://github.com/yeluru/sdd-with-ai ~/.claude/skills/sdd-with-ai` |
| Cursor (global) | `curl -sL .../formats/cursorrules > ~/.cursor/rules/sdd-with-ai.mdc` |
| Cursor (per-project) | `curl -sL .../formats/cursorrules > .cursorrules` |
| Windsurf | `curl -sL .../formats/cursorrules > ~/.windsurf/rules/sdd-with-ai.md` |
| GitHub Copilot | `curl -sL .../formats/cursorrules > .github/copilot-instructions.md` |
| Codex CLI | `curl -sL .../formats/system-prompt.md >> ~/.codex/instructions.md` |
| ChatGPT / Gemini / other | Paste [`formats/system-prompt.md`](./formats/system-prompt.md) into custom instructions |

Once installed, just tell your AI: *"I want to build X"* — the skill takes over from there.

---

## What's in This Repo

```
sdd-with-ai/
├── README.md                        ← you are here
├── SKILL.md                         ← Claude Code CLI / Cowork skill definition
├── install.sh                       ← auto-detect installer for all tools
├── formats/
│   ├── system-prompt.md             ← universal prompt for ChatGPT, Gemini, Codex, etc.
│   └── cursorrules                  ← Cursor / Windsurf / Copilot rules format
├── prompts/
│   ├── 01_starter.md               ← the one prompt to start your SDD session
│   └── 02_session_tips.md          ← prompts to use during the session
└── templates/
    ├── SPEC_template.md             ← product spec template
    ├── DATAMODEL_template.md        ← database schema template
    ├── API_template.md              ← API contract template
    ├── SCREENS_template.md          ← UI screen spec template
    └── AGENTS_template.md           ← AI agent design template (if applicable)
```

---

## How to Use This

### Step 1 — Start the session

Open any AI assistant (Claude, Gemini, ChatGPT, Copilot Chat).
Copy the prompt from [`prompts/01_starter.md`](./prompts/01_starter.md) and paste it.

The AI will ask: **"What's on your mind to build?"**

Answer in one paragraph. The Socratic process begins from there — one question at a time.

### Step 2 — Let the AI guide you through the spec

The AI will work through these sections in order:

1. **Vision** — what is this, what does it do differently?
2. **User** — who specifically, and who is it NOT for?
3. **Success metric** — one sentence: after using this, the user can ___
4. **Features & scope** — what's in v1, what's explicitly out?
5. **Business model** — pricing, cost basis, payment infrastructure
6. **Tech stack** — what gets built on what?
7. **Architecture** — how does the system work end to end?
8. **NFRs** — performance, uptime, security, rate limits

Every decision gets locked with ✅ before moving on.

### Step 3 — Generate the technical documents

Once the product spec is locked, prompt the AI to generate each document
using the templates in [`/templates`](./templates/) as structure guides.

Do one document per session:
```
Using our locked decisions, generate DATAMODEL.md following the structure 
in the DATAMODEL_template.md format. Start with the entity relationship 
overview before writing any tables.
```

### Step 4 — Verify the spec is ready to build from

Use this prompt to check before you start coding:
```
Could a developer who was not in this conversation pick up this spec 
and build exactly what I have in my head — without asking me anything?
Tell me honestly what's missing.
```

### Step 5 — Hand the SDD to a coding tool

Reference the spec files explicitly in your build prompts:
```
Using SPEC.md, DATAMODEL.md, and API.md as your reference, scaffold the 
FastAPI backend with SQLAlchemy models and the auth routes.

Before writing any code, show me the full folder tree you plan to create 
and wait for my approval.
```

---

## What a Complete SDD Looks Like

| File | What It Contains |
|---|---|
| `SPEC.md` | Product decisions, user persona, features, business model, tech stack, NFRs |
| `DATAMODEL.md` | Every database table, column, constraint, index, and business rule |
| `API.md` | Every API endpoint with method, path, request/response shapes, error codes |
| `SCREENS.md` | Every UI screen with layout, elements, behavior, and flow |
| `AGENTS.md` | Every AI agent with inputs, outputs, prompt strategy, and failure modes |

The spec is done when **a developer who was not in the room for any design decisions
could build exactly what you have in your head — without asking you anything.**

---

## The Methodology in One Page

> Read the full experience write-up: [How I wrote my product spec with AI before writing a single line of code](./EXPERIENCE.md)

**The questions that matter most:**
- Who specifically is this for — and who is it NOT for?
- What does "done" look like for your user in one sentence?
- What are we explicitly NOT building in version one?
- What's the basis for that number?

**The prompts that keep the session honest:**
- *"What's wrong with what I just said? Push back."*
- *"Don't give me options. Tell me what you'd recommend and why."*
- *"Did you calculate that number or estimate it? Show your work."*
- *"Do a full pass and tell me what's still ❓ or 🔄."*

**The signals that the spec is ready:**
- Every decision is locked with ✅
- No section has ❓ or 🔄 remaining
- The out-of-scope list exists and is specific
- A stranger could build from it

---

## Contributing

Used this methodology? Improved the prompts? PRs welcome.

If you produced a SDD using this approach and want to share a sanitized version
as an example (with product details removed), open a PR to add it to `/examples`.

---

*Built from a real SDD session. No product details included — just the methodology.*
