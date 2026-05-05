#!/usr/bin/env bash
# install.sh — sdd-with-ai installer
# Detects your installed tools and installs the skill/prompt to the right place.
#
# Usage:
#   bash install.sh
#   curl -sL https://raw.githubusercontent.com/yeluru/sdd-with-ai/main/install.sh | bash

set -e

REPO="https://github.com/yeluru/sdd-with-ai"
SKILL_DIR="$HOME/.claude/skills/sdd-with-ai"
TMPDIR_CLONE=$(mktemp -d)

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}sdd-with-ai installer${RESET}"
echo -e "Spec-Driven Development with AI — ${CYAN}${REPO}${RESET}"
echo ""

installed=()
skipped=()

clone_repo() {
  if [ ! -d "$TMPDIR_CLONE/sdd-with-ai" ]; then
    echo "  Fetching repo..."
    git clone --quiet "$REPO" "$TMPDIR_CLONE/sdd-with-ai"
  fi
}

# ─── 1. Claude Code CLI + Claude Cowork ──────────────────────────────────────
if command -v claude &>/dev/null || [ -d "$HOME/.claude" ]; then
  echo -e "${CYAN}▸ Claude Code CLI / Claude Cowork detected${RESET}"

  if [ -d "$SKILL_DIR" ]; then
    echo -e "  ${YELLOW}Already installed — pulling latest...${RESET}"
    git -C "$SKILL_DIR" pull --quiet
  else
    clone_repo
    cp -r "$TMPDIR_CLONE/sdd-with-ai" "$SKILL_DIR"
  fi

  echo -e "  ${GREEN}✓ Installed at $SKILL_DIR${RESET}"
  echo    "    Use /sdd-with-ai in Claude Code CLI or Claude Cowork."
  installed+=("Claude Code CLI / Claude Cowork")
else
  skipped+=("Claude Code CLI / Cowork (claude not found, ~/.claude not present)")
fi

echo ""

# ─── 2. Cursor ───────────────────────────────────────────────────────────────
if [ -d "$HOME/.cursor" ] || command -v cursor &>/dev/null; then
  echo -e "${CYAN}▸ Cursor detected${RESET}"
  mkdir -p "$HOME/.cursor/rules"
  clone_repo
  cp "$TMPDIR_CLONE/sdd-with-ai/formats/cursorrules" "$HOME/.cursor/rules/sdd-with-ai.mdc"
  echo -e "  ${GREEN}✓ Installed global rule at ~/.cursor/rules/sdd-with-ai.mdc${RESET}"
  echo    "    Per-project: cp ~/.cursor/rules/sdd-with-ai.mdc ./.cursorrules"
  installed+=("Cursor")
else
  skipped+=("Cursor (~/.cursor not found)")
fi

echo ""

# ─── 3. Windsurf ─────────────────────────────────────────────────────────────
if [ -d "$HOME/.windsurf" ] || command -v windsurf &>/dev/null; then
  echo -e "${CYAN}▸ Windsurf detected${RESET}"
  mkdir -p "$HOME/.windsurf/rules"
  clone_repo
  cp "$TMPDIR_CLONE/sdd-with-ai/formats/cursorrules" "$HOME/.windsurf/rules/sdd-with-ai.md"
  echo -e "  ${GREEN}✓ Installed global rule at ~/.windsurf/rules/sdd-with-ai.md${RESET}"
  installed+=("Windsurf")
else
  skipped+=("Windsurf (~/.windsurf not found)")
fi

echo ""

# ─── 4. GitHub Copilot (project-level) ───────────────────────────────────────
if [ -d ".git" ]; then
  echo -e "${CYAN}▸ Git repo detected — installing GitHub Copilot instructions${RESET}"
  mkdir -p ".github"
  clone_repo
  cp "$TMPDIR_CLONE/sdd-with-ai/formats/cursorrules" ".github/copilot-instructions.md"
  echo -e "  ${GREEN}✓ Created .github/copilot-instructions.md${RESET}"
  echo    "    Commit this file to share the SDD workflow with your team."
  installed+=("GitHub Copilot (project)")
else
  skipped+=("GitHub Copilot (no .git repo in current directory)")
fi

echo ""

# ─── 5. Codex CLI ────────────────────────────────────────────────────────────
if command -v codex &>/dev/null || [ -d "$HOME/.codex" ]; then
  echo -e "${CYAN}▸ Codex CLI detected${RESET}"
  mkdir -p "$HOME/.codex"
  clone_repo
  CODEX_INSTRUCTIONS="$HOME/.codex/instructions.md"
  if [ -f "$CODEX_INSTRUCTIONS" ]; then
    echo "" >> "$CODEX_INSTRUCTIONS"
    echo "---" >> "$CODEX_INSTRUCTIONS"
    cat "$TMPDIR_CLONE/sdd-with-ai/formats/system-prompt.md" >> "$CODEX_INSTRUCTIONS"
    echo -e "  ${GREEN}✓ Appended to $CODEX_INSTRUCTIONS${RESET}"
  else
    cp "$TMPDIR_CLONE/sdd-with-ai/formats/system-prompt.md" "$CODEX_INSTRUCTIONS"
    echo -e "  ${GREEN}✓ Created $CODEX_INSTRUCTIONS${RESET}"
  fi
  installed+=("Codex CLI")
else
  skipped+=("Codex CLI (~/.codex not found)")
fi

echo ""

# ─── 6. Antigravity ──────────────────────────────────────────────────────────
if command -v antigravity &>/dev/null || [ -d "$HOME/.antigravity" ]; then
  echo -e "${CYAN}▸ Antigravity detected${RESET}"
  mkdir -p "$HOME/.antigravity/skills"
  clone_repo
  cp -r "$TMPDIR_CLONE/sdd-with-ai" "$HOME/.antigravity/skills/sdd-with-ai"
  echo -e "  ${GREEN}✓ Installed at ~/.antigravity/skills/sdd-with-ai${RESET}"
  installed+=("Antigravity")
else
  skipped+=("Antigravity (~/.antigravity not found)")
fi

echo ""

# ─── Cleanup ──────────────────────────────────────────────────────────────────
rm -rf "$TMPDIR_CLONE"

# ─── Summary ──────────────────────────────────────────────────────────────────
echo -e "${BOLD}Summary${RESET}"
echo "───────"

if [ ${#installed[@]} -gt 0 ]; then
  echo -e "${GREEN}Installed:${RESET}"
  for tool in "${installed[@]}"; do
    echo "  ✓ $tool"
  done
fi

if [ ${#skipped[@]} -gt 0 ]; then
  echo ""
  echo -e "${YELLOW}Skipped (not detected):${RESET}"
  for tool in "${skipped[@]}"; do
    echo "  - $tool"
  done
fi

echo ""
echo -e "${BOLD}Manual install${RESET} — paste formats/system-prompt.md into:"
echo "  • ChatGPT  → Settings → Personalization → Custom Instructions"
echo "  • Gemini   → Gems → Create a Gem → paste as instructions"
echo "  • Any tool → system prompt / custom instructions field"
echo ""
echo -e "Docs: ${CYAN}${REPO}${RESET}"
echo ""
