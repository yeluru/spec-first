# Spec-Driven Development with AI — Three Real Sessions

> **What actually happened when I refused to open my IDE until the spec was done.**

---

## Why I Built This

I've been building products for twenty years. I know better than to start coding before designing. And I still do it. The excitement of a new idea, the pull of the IDE — it happens every time.

What changed for me was realizing that AI coding tools made this problem *worse*, not better. With Claude or Cursor in the room, you can go from idea to running code in thirty minutes. Which means you can build the wrong thing at unprecedented speed.

I started forcing myself to run spec sessions before touching code. What came out of those sessions — the pushback, the decisions locked in before a single file was created — is what this methodology is about. Here are three real examples.

---

## Session 1: HireVault — The Tool That Had to Stay Offline

**What I thought I was building:** An automated resume extraction tool for recruiters. Emails come in, the agent pulls the resume, parses the candidate, adds them to a pipeline. Straightforward.

**The first thing that got challenged:** My stack assumption.

I described the product and jumped to implementation questions. The AI asked before we got there:

> *"Before we talk about stack — who is using this, and where does the data live? Because those two answers will determine whether Supabase is the right call or completely the wrong one."*

I said recruiters would use it. I said it should probably just use Supabase like everything else I build.

> *"Stop. Your recruiter's inbox contains candidate names, contact details, employment histories, and in some cases immigration status. You just told me the product's core value is that it reads email automatically. If Supabase is in the stack, you've made a promise you might not be able to keep — that this data is private. Is privacy the value proposition, or is it not?"*

It was. I just hadn't said it out loud.

That one question locked in the entire architecture. SQLite. Local file system. No cloud dependencies. No server process. The tool runs on the recruiter's machine and the data never leaves it.

Then I asked: *"But can this ever become a SaaS product?"*

> *"Yes, and the spec is already designed for it if we're careful now. Every table gets a* `user_id` *column — NULL in local mode, populated in SaaS mode. When you're ready to migrate, you're populating an existing column, not restructuring every table. That's a ten-second decision now versus a painful migration later."*

We locked the local-first constraint, documented the SaaS upgrade path, and moved on. I didn't have to revisit the architecture question once during the build.

**What the spec session prevented:** I would have started with Supabase. I would have gotten halfway through before someone asked me where the data was going. I would have had to rebuild the storage layer.

---

## Session 2: JDX — The Product That Almost Had the Wrong Name

**What I thought I was building:** A tool that matches resumes to job descriptions and tells you how well you fit.

**The name I almost shipped with:** Resume Matcher.

We were at the end of the spec session. Five documents nearly done. I said the product didn't have a name yet and suggested Resume Matcher as a placeholder.

> *"Honest pushback: Resume Matcher sounds like a recruiter tool that matches resumes to jobs in bulk. ATS software. Something Workday or Greenhouse already does.*
>
> *This product does something more interesting — it decodes what a company is actually hiring for, scores your fit honestly, and teaches you the skills you're missing. That's not matching. That's intelligence.*
>
> *A few directions: JDX — short for JD decoded. RoleReady — speaks to the outcome. DecodeHire — direct. FitMap — visualizes your fit. But you know your audience. What feels right?"*

I said JDX. The AI locked it immediately and didn't let me waver.

**The moment that mattered most in this session** wasn't the naming — it was earlier, when I tried to add a feature at the end of the spec.

We had finalized scope. Locked decisions everywhere. Then I said: *"Actually, what if the app could find a real JD based on just a job title? So you don't have to paste anything."*

> *"That's a significant feature addition and worth thinking through carefully before we lock it. You're describing a JD Discovery Agent — the user types a title, the agent searches for real current JDs, presents options, and the user picks one. That changes the input contract, the agent architecture, and the first-run experience. Do you want to add this to V1, or document it as V2 and keep the scope we've built?"*

I tried to add it to V1.

> *"If we add it, we need to spec it properly — not just mention it. That means: which search provider? What happens when results are low quality? What's the UI for presenting options? How does it interact with the resume you've already uploaded? We can go through all of that now, but be aware it's at least another hour of design work and significantly more build complexity. Is this a V1 feature or are you describing V2?"*

I documented it as V2. The discipline of that question — *is this V1 or V2?* — is the single most useful thing I've taken out of these sessions.

**The out-of-scope list we produced before writing a single file:**
- PDF/doc export
- Team workspaces
- Paid tiers and BYOK in V1
- Resume version history
- Shareable link expiry or password protection
- Mobile-native app
- JD Discovery Agent

That list resolved more debates during the build than any feature we actually shipped.

---

## Session 3: AgentRoom — When the Hard Constraint Changes Everything

**What I was building:** A virtual meeting platform where human team members and AI agent personas participate together in live voice sessions. After the meeting, agents execute their action items — including a Developer agent that writes and commits real code.

**The spec session that forced clarity:** The latency question.

I described the product, the agent personas (PM, Architect, Developer, Business Analyst), the voice interaction model. The AI asked:

> *"One hard constraint question before we go further: what is the acceptable perceived latency between a human speaking and an agent responding? Because that single number determines your entire backend architecture. If it's under one second, you're in streaming territory with aggressive pre-buffering. If it's two to three seconds, you have more options. What's the bar?"*

I hadn't put a number on it. I said it should feel natural.

> *"'Natural' isn't a spec. Human conversation turn-taking is 200 to 500 milliseconds. You're not hitting that with LLM inference plus TTS. A realistic target for this product is under 1.5 seconds perceived latency — that's the point where people stop noticing the pause. Is 1.5 seconds your ceiling?"*

Yes. That became the hard NFR that shaped every downstream decision: why we pre-buffer the first 500ms of ElevenLabs audio, why Deepgram STT is streaming not batch, why the LangGraph conversation state lives in Redis not Supabase for the duration of a meeting.

**The scope question that almost derailed the session:**

I described the Developer agent and said it should write code. The AI asked:

> *"Write code and do what with it? There are three very different products hiding in that sentence: (1) write code and show it in the meeting as a deliverable, (2) write code and commit it to a feature branch post-meeting, (3) write code and submit a PR for human review. These are not the same scope. Which one are you building?"*

I said option 2 — commit to a feature branch, never main.

> *"Good. Lock that. And I want to capture the implication: the Developer agent needs GitHub OAuth in the stack, the meeting record needs to know which repo it's operating on, and the RAG layer needs to include codebase context so the agent isn't writing code blind. None of that was in what you described. Do you want to add those requirements now?"*

We added them. The RAG layer for AgentRoom ended up being more complex than I anticipated — not just meeting docs but also the actual codebase the Developer agent would be writing against. That would have been a mid-build discovery without the spec session.

**The risk table that paid for itself:**

At the end of the Architecture phase, the AI produced a risk table. One entry:

> *"RAG context quality too low for useful agent responses — Likelihood: High — Impact: High — Mitigation: Onboarding flow enforces minimum document upload before first meeting. RAG status check before meeting start."*

Likelihood High, Impact High, and I hadn't thought about it at all. The mitigation became a first-class feature: you can't start a meeting until your project documents are uploaded and indexed. That's now a core part of the onboarding flow, not an afterthought.

---

## What I Learned Across All Three Sessions

**The out-of-scope list is as valuable as the feature list.** Every session, the most useful artifact wasn't what we were building — it was the explicit record of what we decided not to build. That list ends debates instantly during development.

**"Is this V1 or V2?" is the most useful question in a spec session.** I tried to add features at the end of every session. Every time, the AI made me decide: is this real V1 scope, or am I describing V2? The honest answer was almost always V2.

**The AI will make up numbers if you let it.** In the AgentRoom session, I asked about concurrent meeting limits for pricing. The AI gave me a number. I asked: *"Did you calculate that or estimate it?"* It said: *"Honest answer — I estimated it. Let me do the actual math."* The real number was different. Push back on every number that appears without a derivation.

**Architecture decisions made in a spec session are cheaper than architecture decisions made mid-build by a factor of ten.** The HireVault local-first constraint, the JDX shareable link design, the AgentRoom Redis-for-session-state decision — every one of those resolved in the spec phase would have been a partial rewrite if discovered during coding.

**The bar is right: a developer who wasn't in the room should be able to build from the spec without asking anything.** I tested this on AgentRoom. I gave the five documents to a collaborator who hadn't been in the session. They had one question — about which ElevenLabs voice model to use. That question was already answered in AGENTS.md. They missed it. The spec was complete.

---

## The One Prompt That Changes the Session

When the AI gets too agreeable — when it's summarizing what you said instead of challenging it — use this:

> *"What's wrong with what I just said? Push back hard."*

That single prompt, used three or four times in a session, will surface the assumptions you didn't know you were making.

---

*Built from three real spec sessions. Product names and some implementation details are real — these are products currently in development or production.*
