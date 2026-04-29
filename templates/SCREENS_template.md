# [Product Name] — Screen & UI Flow Specification (v1)

> All screens implement light/dark theme toggle.
> Responsive: mobile-first.
> Component library: [specify — e.g. shadcn/ui + Tailwind CSS]

---

## Instructions for the AI

When generating this document, follow these rules:
- Every screen gets: Purpose, Layout, Elements, Behavior, and Flow (what happens next)
- Specify mobile layout separately from desktop wherever they differ
- Every "TBD" UX decision must be resolved before the spec is complete — pick one and justify it
- Specify empty states for every list or data-dependent screen
- Specify error states: what does the user see when something fails?
- Specify loading states: skeleton loaders, not spinners, for content
- For multi-step flows: specify what happens if the user refreshes mid-flow
- The "wow" screen — the core differentiator — gets the most detailed spec

---

## Screen Map

```
PUBLIC
  ├── / (Landing)
  └── /sign-in

ONBOARDING
  └── /onboarding
       ├── Step 1: [name]
       ├── Step 2: [name]
       └── Step 3: [name]

APP
  ├── /home
  ├── /[core-flow-route]
  └── /settings

ADMIN
  └── /admin/[admin-route]

MODALS
  └── [Modal name] — triggered when [condition]
```

---

## Screen Template

> Copy and fill in this block for each screen:

---

## [N]. [Screen Name] — `/route`

**Purpose:** [One sentence. What does this screen do and why does the user land here?]

**Layout:** [Describe the layout structure. Sidebar + main? Centered card? Full-screen? How does it change on mobile?]

**Elements:**
- [Element name]: [description, behavior on interaction]
- [Element name]: [description]

**Behavior:**
- [What happens when X?]
- [What is the empty state?]
- [What is the error state?]
- [What is the loading state?]

**Flow:**
- [Action] → redirects to [route]
- [Action] → triggers [effect]

---

<!--
  Repeat the screen template above for every screen in your Screen Map.
  Then define Global Components at the bottom.
-->

---

## Global Components

### Navigation
| Item | Icon | Route |
|---|---|---|
| [label] | [icon] | /[route] |

### Theme
- Light and dark themes with toggle
- System preference respected on first load
- Preference persisted to localStorage

### Loading States
- Skeleton loaders for content loading
- [Specific loading UI for async operations, e.g. generation feeds]

### Notifications
- Toast notifications for: [list events]

---

*Last updated: [DATE]*
