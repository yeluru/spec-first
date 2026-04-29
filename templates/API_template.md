# [Product Name] — API Contract (v1)

> Base URL: `/api/v1`
> All endpoints require `Authorization: Bearer <jwt>` unless marked **[PUBLIC]**
> All responses: `Content-Type: application/json`
> Errors follow: `{ "detail": "message", "code": "ERROR_CODE" }`

---

## Instructions for the AI

When generating this document, follow these rules:
- Every endpoint must have: method, path, description, request shape, response shape
- Document ALL response status codes for each endpoint (200, 201, 400, 401, 402, 404, etc.)
- Correct answer is NOT returned in quiz-style endpoints until the user submits — flag this pattern
- Paginate any list endpoint that could grow large (?page=1&limit=20)
- WebSocket endpoints must specify: auth mechanism, message format, close codes
- Streaming endpoints must specify: format (SSE or WebSocket), event shape
- One-time payment endpoints must specify: what triggers access, what gets unlocked
- Admin endpoints must specify: what role is required and how it's checked

---

## Authentication

### POST /api/v1/auth/[method] [PUBLIC]
```json
// Request
{ }

// Response 200
{ "access_token": "eyJ...", "refresh_token": "eyJ...", "token_type": "bearer", "expires_in": 3600 }
```

---

<!--
  Organize endpoints into logical groups with ## headers.
  Example groups:

  ## Authentication
  ## Profile
  ## [Core entity]
  ## Payments
  ## Settings
  ## Admin
  ## WebSocket / Real-time
-->

---

## Error Codes Reference

| HTTP | Code | Meaning |
|---|---|---|
| 400 | INVALID_INPUT | Malformed request body |
| 401 | UNAUTHORIZED | Missing or invalid JWT |
| 402 | PAYMENT_REQUIRED | Feature requires payment |
| 403 | FORBIDDEN | Authenticated but not allowed |
| 404 | NOT_FOUND | Resource doesn't exist |
| 409 | CONFLICT | Duplicate resource |
| 422 | VALIDATION_ERROR | Input validation failed |
| 429 | RATE_LIMITED | Too many requests |
| 500 | INTERNAL_ERROR | Unexpected server error |

---

*Last updated: [DATE]*
