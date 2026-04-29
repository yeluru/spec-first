# [Product Name] — Data Model (v1)

> Derived from SPEC.md. All tables use UUID primary keys.
> PostgreSQL in production. SQLite for local development.

---

## Instructions for the AI

When generating this document, follow these rules:
- Every table gets: id (UUID PK), created_at (TIMESTAMPTZ DEFAULT NOW())
- Every table that gets updated gets: updated_at (TIMESTAMPTZ)
- Use TIMESTAMPTZ for all timestamps — never TIMESTAMP
- Use JSONB for structured but schema-flexible fields (list the expected shape in a comment)
- Use VARCHAR with a length for short strings. TEXT for long content.
- Every FK relationship must be explicit — no implicit joins
- Every UNIQUE constraint must be listed
- Write all indexes at the end in a dedicated section
- Write all business rules (constraints that can't be expressed in SQL alone) in a dedicated section

---

## Entity Relationship Overview

```
[Draw the tree of relationships here before writing any tables]

User
 ├── [Child entity] (1:1)
 ├── [Child entity] (1:many)
 └── [Main entity] (1:many)
      └── [Sub-entity] (1:many, ordered)
```

---

## Tables

> For each table, follow this format:

### [table_name]
| Column | Type | Notes |
|---|---|---|
| id | UUID PK | |
| [fk_column] | UUID FK → [other_table] | |
| [field] | [TYPE] | [constraint or description] |
| created_at | TIMESTAMPTZ DEFAULT NOW() | |
| updated_at | TIMESTAMPTZ | |

---

<!--
  Repeat the table block above for every entity in your system.
  Group related tables with a comment header, e.g.:

  ## Auth tables
  ### users
  ### otp_codes
  ### refresh_tokens

  ## Course tables
  ### courses
  ### chapters
  ### topics
-->

---

## Key Indexes

```sql
-- [Describe what each index is for]
CREATE INDEX idx_[table]_[column] ON [table]([column]);
```

---

## Key Business Rules

> List constraints that cannot be expressed in SQL column definitions alone.
> These are enforced in application code or triggers.

1. [Rule description]
2. [Rule description]

---

*Last updated: [DATE]*
