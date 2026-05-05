#!/usr/bin/env bash
# install.sh — spec-first installer
# Detects your installed tools and installs the skill/prompt to the right place.
#
# Usage:
#   bash install.sh
#   curl -sL https://raw.githubusercontent.com/yeluru/spec-first/main/install.sh | bash

set -e

REPO="https://github.com/yeluru/spec-first"
SKILL_DIR="$HOME/.claude/skills/spec-first"
TMPDIR_CLONE=$(mktemp -d)

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}spec-first installer${RESET}"
echo -e "Spec-Driven Development with AI — ${CYAN}${REPO}${RESET}"
echo ""

installed=()
skipped=()

clone_repo() {
  if [ ! -d "$TMPDIR_CLONE/spec-first" ]; then
    echo "  Fetching repo..."
    git clone --quiet "$REPO" "$TMPDIR_CLONE/spec-first"
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
    cp -r "$TMPDIR_CLONE/spec-first" "$SKILL_DIR"
  fi

  echo -e "  ${GREEN}✓ Installed at $SKILL_DIR${RESET}"
  echo    "    Use /spec-first in Claude Code CLI or Claude Cowork."
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
  cp "$TMPDIR_CLONE/spec-first/formats/cursorrules" "$HOME/.cursor/rules/spec-first.mdc"
  echo -e "  ${GREEN}✓ Installed global rule at ~/.cursor/rules/spec-first.mdc${RESET}"
  echo    "    Per-project: cp ~/.cursor/rules/spec-first.mdc ./.cursorrules"
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
  cp "$TMPDIR_CLONE/spec-first/formats/cursorrules" "$HOME/.windsurf/rules/spec-first.md"
  echo -e "  ${GREEN}✓ Installed global rule at ~/.windsurf/rules/spec-first.md${RESET}"
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
  cp "$TMPDIR_CLONE/spec-first/formats/cursorrules" ".github/copilot-instructions.md"
  echo -e "  ${GREEN}✓ Created .github/copilot-instructions.md${RESET}"
  echo    "    Commit this file to share the SDD workflow with your team."
  installed+=("GitHub Copilot (project)")
else
  skipped+=("GitHub Copilot (no .git repo in current directory)")
fi

echo ""

# ─── 5. Codex (native Mac app) ───────────────────────────────────────────────
CODEX_SKILL_DIR="$HOME/.codex/skills/spec-first"
if command -v codex &>/dev/null || [ -d "$HOME/.codex" ]; then
  echo -e "${CYAN}▸ Codex detected${RESET}"
  mkdir -p "$HOME/.codex/skills"
  clone_repo

  if [ -d "$CODEX_SKILL_DIR" ]; then
    echo -e "  ${YELLOW}Already installed — pulling latest...${RESET}"
    git -C "$CODEX_SKILL_DIR" pull --quiet
  else
    cp -r "$TMPDIR_CLONE/spec-first" "$CODEX_SKILL_DIR"
  fi

  echo -e "  ${GREEN}✓ Installed at $CODEX_SKILL_DIR${RESET}"
  echo    "    Restart Codex, then use /spec-first to invoke the skill."
  installed+=("Codex")
else
  skipped+=("Codex (~/.codex not found)")
fi

echo ""

# ─── 6. Antigravity ──────────────────────────────────────────────────────────
if command -v antigravity &>/dev/null || [ -d "$HOME/.antigravity" ]; then
  echo -e "${CYAN}▸ Antigravity detected${RESET}"
  mkdir -p "$HOME/.antigravity/skills"
  clone_repo
  cp -r "$TMPDIR_CLONE/spec-first" "$HOME/.antigravity/skills/spec-first"
  echo -e "  ${GREEN}✓ Installed at ~/.antigravity/skills/spec-first${RESET}"
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
