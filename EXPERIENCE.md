# Spec-Driven Development with AI — A Practical Guide

> **How to write a complete, buildable product spec before writing a single line of code — using an AI as your Socratic design partner.**

---

## Table of Contents

- [Why SDD?](#why-sdd)
- [What is an SDD?](#what-is-an-sdd)
- [The Experience: What Actually Happened](#the-experience-what-actually-happened)
  - [Questions That Unlocked Everything](#the-questions-that-unlocked-everything)
  - [Where I Pushed Back on the AI](#where-i-pushed-back-on-the-ai--and-why-it-mattered)
  - [When the Spec Was Ready](#the-moment-i-knew-the-spec-was-ready)
- [The Starter Prompt](#the-starter-prompt)
- [Session Tips](#session-tips)
- [Output Structure](#output-structure)
- [Key Principles](#key-principles)

---

## Why SDD?

Most builders have the same problem. They have an idea, they're excited, and they open their IDE before they've answered the most basic questions about what they're building and for whom.

The result: you build for weeks, then realize you've been solving the wrong problem for the wrong user. Or you build three features that contradict each other because you never resolved a design conflict upfront.

Spec-Driven Development (SDD) fixes this by forcing you to produce a complete, internally consistent specification *before* a single line of code is written. The spec is specific enough that a developer — or an AI coding tool — could pick it up and build without inventing design decisions.

> **The spec is the building. Everything else is just typing.**

---

## What is an SDD?

A complete SDD is five documents:

| Document | Traditional Name | What It Answers |
|---|---|---|
| `SPEC.md` | Product Requirements Document (PRD) | *What* to build and *why* |
| `DATAMODEL.md` | Data Design Specification | *How* data is structured |
| `API.md` | API Specification | *How* systems communicate |
| `SCREENS.md` | UI/UX Specification | *How* users interact |
| `AGENTS.md` | Agent Design Specification | *How* the AI pipeline works (if applicable) |

`SPEC.md` alone is the PRD — product decisions, user persona, business model, tech choices. It answers "what are we building and why."

The full SDD is all five files together. A coding agent handed only `SPEC.md` would know *what* to build but not *how* — it would have to guess at schema, endpoints, and screen layouts. All five files together eliminate that guesswork.

---

## The Experience: What Actually Happened

I sat down with an AI assistant and didn't let it write a single line of code until we had a complete SDD. The session took a few hours. Here's what made it work.

### The Questions That Unlocked Everything

#### "Who, specifically, is this for?"

I described my product idea. The AI's first response wasn't "great, let's design it." It was:

> *"Before we go further — who specifically is this for? I can think of at least three very different user types who might want this. They have different needs, different willingness to pay, and different success metrics. Which one are you building for in version one?"*

It laid out the user types. I picked one. The AI immediately said:

> *"Good. Now: are you sure? Because if you're building for this user, then features X and Y that you mentioned earlier actually don't serve them. Do you want to remove those from scope or reconsider who you're building for?"*

That single question — *are you sure?* — probably saved me three months of building the wrong thing.

> **Takeaway:** Don't just describe your user. Let the AI challenge whether your feature list is consistent with the user you described.

---

#### "What does 'done' look like for your user?"

Not "what features does the product have." What does success look like for the person using it?

I gave a vague answer. The AI pushed:

> *"That's too broad. You've described three different success states there. Let me be specific: after using this product, what should your user be able to do that they couldn't before? Give me one sentence."*

That one-sentence success metric became the quality bar for every content and feature decision afterward. Whenever we debated whether to include something, we'd check it against that sentence.

> **Takeaway:** A one-sentence success metric is more useful than a paragraph of goals. Make the AI help you find it.

---

#### "What are we explicitly NOT building?"

I didn't ask this. The AI introduced it. After we agreed on scope, it said:

> *"Let me play back what I think you're explicitly NOT building in version one, so we have it written down. I'm hearing: [list]. Are these correct? Because if any of them are wrong, it'll affect several decisions we just made."*

Having an explicit out-of-scope list turned out to be as valuable as the feature list. It resolves future debates instantly.

> **Takeaway:** Make the AI write your "not building" list. It's as important as your roadmap.

---

### Where I Pushed Back on the AI — and Why It Mattered

#### When it made up numbers

The AI proposed a pricing model with specific dollar amounts. I asked:

> *"Did you come up with those numbers to make a profit, or to cover costs? What's the basis?"*

The AI stopped and said:

> *"Honest answer: I made those up. Let me actually do the cost math."*

It then estimated real costs — API calls per generation, infrastructure, third-party services — and derived a minimum viable price based on actual numbers, not gut feel. The final pricing was different from the original suggestion and grounded in reality.

> **Takeaway:** Challenge the AI when it produces numbers. Ask "what's the basis?" It will either justify the number or admit it guessed. Guessing is not a spec.

---

#### When it gave me two options instead of a recommendation

At one point the AI presented two approaches and asked me to choose. I said:

> *"Which one do you suggest based on the long-term vision of this product?"*

This is important. AI assistants are trained to present options neutrally. But a good spec requires *decisions*, not menus. When you push the AI to make a recommendation, it has to reason about trade-offs and commit to a position. That reasoning is often more valuable than the recommendation itself.

> **Takeaway:** Don't let the AI hide behind "here are your options." Push it to make a recommendation, then push back on the recommendation.

---

#### When I asked it to verify its own work

After a while, I said:

> *"Do another pass on the spec. Tell me line by line what you've captured and verify it against our full conversation."*

It found five things it had missed. One was significant: a whole business model section that still said "TBD" when we had actually made the decision in conversation 30 minutes earlier. Decisions made in chat don't automatically make it into the document.

> **Takeaway:** Periodically ask the AI to audit its own work against the conversation. Then audit the audit.

---

### The Moment I Knew the Spec Was Ready

I asked:

> *"Can this spec be used by any coding tool to start development right now?"*

The AI's answer was honest:

> *"Partially, but not fully. The product spec tells a tool what to build, but without the data model, API contract, and screen spec, the tool would have to guess at schema, endpoints, and layouts. Those guesses will be inconsistent."*

That answer told me exactly what was missing. We spent another hour writing the technical specs. At the end, the AI confirmed: *"Now any AI coding tool can pick this up and build without inventing design decisions."*

That's the bar. Not "we have a document." But "a tool can build from this without guessing."

---

## The Starter Prompt

Copy and paste this to begin your own SDD session with any AI assistant:

```
I have a product idea I want to build, but I do NOT want you to write any 
code yet. Instead, I want to use Spec-Driven Development (SDD).

Your job is to act as a Socratic product partner. That means:

1. Ask me hard questions before accepting any decision
2. Push back when my answers are vague, contradictory, or skipping 
   important trade-offs
3. Challenge my assumptions — especially about users, pricing, and scope
4. When I give you a direction, ask "are you sure?" if something doesn't 
   add up
5. Make recommendations when I ask, but justify them — never just give me 
   options and ask me to pick

The output we are working toward is a complete SDD made of 5 documents:
- SPEC.md — product decisions, users, features, business model, tech stack, NFRs
- DATAMODEL.md — every database table, column, constraint, and index
- API.md — every API endpoint with request/response shapes
- SCREENS.md — every UI screen with layout and behavior
- AGENTS.md — AI agent design (only if the product uses AI agents)

Rules for our session:
- Lock decisions with ✅ before moving to the next topic
- Mark open debates with 🔄 and unknowns with ❓
- No section is "done" until it has no ❓ or 🔄 items
- Periodically audit what's been captured vs. what we've discussed
- The spec is done when a developer who wasn't in this conversation 
  could build exactly what I have in my head without asking me anything

Start by asking me to describe my product idea in one paragraph. 
Then begin the Socratic process.
```

---

## Session Tips

These two follow-up prompts matter most during the session:

**When the AI gets too agreeable:**
```
What's wrong with what I just said? Push back.
```

**When you think a section is done:**
```
Do a complete pass and tell me everything you've captured so far.
Verify it line by line against our full conversation and flag anything missing.
```

**When the AI makes up numbers:**
```
What's the basis for that? Did you calculate it or estimate it?
Show your work.
```

**When you want an opinion, not options:**
```
Don't give me options. Tell me what you would recommend and why.
```

---

## Output Structure

When the session is complete, you should have these files in your repo:

```
your-project/
├── SPEC.md          # Product spec — the PRD
├── DATAMODEL.md     # Database schema
├── API.md           # API contract
├── SCREENS.md       # UI screen spec
└── AGENTS.md        # AI agent design (if applicable)
```

### How to use the SDD to start building

Reference the documents explicitly in your coding prompts:

```
Using SPEC.md, DATAMODEL.md, and API.md as your reference, scaffold the 
FastAPI backend with SQLAlchemy models and the auth routes.

Before writing any code, show me the full folder tree you plan to create 
and wait for my approval.
```

```
Using AGENTS.md, implement the [Agent Name] as a LangGraph node.
Match the input/output schema exactly as specified.
```

```
Using SCREENS.md and DATAMODEL.md, build the [Screen Name] in Next.js 
with shadcn/ui. Match the layout and element spec exactly.
```

> **Rule:** One domain per prompt. Agents lose coherence on large tasks.
> Build backend before frontend. Frontend depends on API shapes.

---

## Key Principles

| Principle | Why It Matters |
|---|---|
| Start with constraints, not features | What you won't build is as clarifying as what you will |
| Push back on every vague answer | Great specs are built through disagreement, not agreement |
| Make numbers traceable | Every price, target, and threshold needs a reason |
| Lock decisions explicitly | Unconfirmed discussions don't count as decisions |
| Keep the open questions list | Honest unknowns beat fake decisions |
| The spec is done when a stranger can build from it | Not when it feels complete |

---

## Contributing

If you've used this approach and want to share your experience or improve the prompts, PRs are welcome.

---

*Built from a real SDD session. No product details included — just the methodology.*
