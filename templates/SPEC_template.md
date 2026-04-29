# [Product Name] — Product Specification (v1)

> **Status:** Living document. Built through Spec-Driven Development.
> Locked decisions are marked ✅. Items under debate are marked 🔄. Unknowns are marked ❓.

---

## 1. Vision ❓

> *One paragraph. What is this product? What does it do differently from anything else?*
> *The platform inverts [existing model] by [new model].*

---

## 2. Target User ❓

### Primary Persona (v1 scope only)
> *Give this user a label. Describe them in 5–7 bullet points:*
> - Years of experience / background
> - What they're trying to accomplish
> - What they already know / have
> - What they don't have time for
> - Why existing solutions don't work for them

### Explicitly Out of Scope (v1)
> *Who are you NOT building for? Be specific.*
- ❌
- ❌
- ❌

---

## 3. Success Metric ❓

### What "done" looks like for the user
> *One sentence. After using this product, the user can ______.*

This is NOT:
- ❌
- ❌

This IS:
- ✅
- ✅

### Content / Output Quality Bar ❓
> *If your product generates content or output, describe the bar.*
> *"A [expert user] opening [the output] should think 'this is excellent' because..."*

---

## 4. Authentication ❓

| Method | Role |
|---|---|
| ❓ | ❓ |

---

## 5. User Profile ❓

### Profile Inputs
| Input | Format | Purpose |
|---|---|---|
| ❓ | ❓ | ❓ |

### Explicitly Blocked
- ❌
- ❌

---

## 6. Core Flow ❓

> *Walk through the end-to-end user journey as a numbered list.*
> *Be specific: what triggers each step, what does the user see, what happens in the backend.*

```
1.
2.
3.
...
```

---

## 7. Key Feature: [Name of your core differentiator] ❓

> *Describe the feature that makes this product different. This section should be the most detailed.*

---

## 8. Content / Output Structure ❓

> *What does the product produce? How is it organized?*

---

## 9. Business Model ❓

### Model: [Freemium / Subscription / One-time / Usage-based]

| Tier | Price | What's included |
|---|---|---|
| ❓ | ❓ | ❓ |

### Cost Basis (estimated)
| Cost item | Estimated cost |
|---|---|
| ❓ | ❓ |

> Break-even estimated at ❓ paying users.

### Payment Infrastructure ❓
- **Processor:** ❓
- **Subscriptions:** ❓
- **One-time payments:** ❓

### Admin-Configurable Pricing ❓
> *How will prices be changed without code deployment?*

---

## 10. Architecture ❓

> *High-level description of how the system works.*
> *Include a flow diagram if the system has multiple stages.*

```
[Trigger]
    ↓
[Step 1]
    ↓
[Step 2]
    ↓
[Output]
```

---

## 11. Tech Stack ❓

| Layer | Technology | Notes |
|---|---|---|
| Frontend | ❓ | |
| Styling | ❓ | |
| Backend | ❓ | |
| Database | ❓ | |
| Background Jobs | ❓ | |
| Auth | ❓ | |
| Payments | ❓ | |
| Email | ❓ | |
| Real-time | ❓ | |
| Deployment | ❓ | |

---

## 12. Non-Functional Requirements ❓

| Requirement | Target |
|---|---|
| [Key operation] response time | ❓ |
| Page load | ❓ |
| API response (non-generation) | ❓ |
| Uptime | ❓ |
| Security | ❓ |
| Rate limiting | ❓ |

---

## 13. Feature Inventory ❓

| Feature | v1 | Future |
|---|---|---|
| ❓ | ✅ | |
| ❓ | | ✅ v2 |
| ❓ | | ❌ Never |

---

## 14. Explicitly Out of Scope ❓

> *List every feature, user type, or technical capability that is NOT in v1.*
> *This list resolves future debates. If it's on this list, the answer is always "no, not yet."*

- ❌
- ❌

---

## 15. Open Questions ❓

- ❓
- ❓

---

*Last updated: [DATE]*
*Spec owner: [NAME]*
