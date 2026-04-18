#!/bin/bash

# ============================================================
# push-to-github.sh
# One-shot script to initialize and push this repo to GitHub
# 
# Usage:
#   chmod +x push-to-github.sh
#   ./push-to-github.sh
# ============================================================

set -e  # Exit on any error

# ── Colors ──────────────────────────────────────────────────
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}  AI Design Toolkit — GitHub Push Script  ${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# ── Step 1: Check git is installed ──────────────────────────
if ! command -v git &> /dev/null; then
    echo -e "${RED}✗ Git is not installed.${NC}"
    echo "  Install from https://git-scm.com or run: brew install git"
    exit 1
fi
echo -e "${GREEN}✓ Git found${NC}"

# ── Step 2: Get GitHub details ───────────────────────────────
echo ""
echo -e "${YELLOW}Enter your GitHub username:${NC}"
read -r GITHUB_USERNAME

echo -e "${YELLOW}Enter your new repo name (e.g. ai-design-toolkit):${NC}"
read -r REPO_NAME

echo -e "${YELLOW}Public or private repo? (public/private):${NC}"
read -r VISIBILITY

# ── Step 3: Check for GitHub token ───────────────────────────
if [ -z "$GITHUB_TOKEN" ]; then
    echo ""
    echo -e "${YELLOW}Enter your GitHub Personal Access Token:${NC}"
    echo -e "  (Get one at https://github.com/settings/tokens — needs 'repo' scope)"
    read -rs GITHUB_TOKEN
    echo ""
fi

# ── Step 4: Create repo on GitHub via API ────────────────────
echo ""
echo -e "${BLUE}Creating GitHub repo...${NC}"

PRIVATE="false"
if [ "$VISIBILITY" = "private" ]; then
    PRIVATE="true"
fi

RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" \
    -X POST \
    -H "Authorization: token $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github.v3+json" \
    https://api.github.com/user/repos \
    -d "{\"name\":\"$REPO_NAME\",\"private\":$PRIVATE,\"description\":\"AI Design Toolkit — animated website builder stack\"}")

if [ "$RESPONSE" = "201" ]; then
    echo -e "${GREEN}✓ Repo created: github.com/$GITHUB_USERNAME/$REPO_NAME${NC}"
elif [ "$RESPONSE" = "422" ]; then
    echo -e "${YELLOW}⚠ Repo may already exist — continuing with push...${NC}"
else
    echo -e "${RED}✗ Failed to create repo (HTTP $RESPONSE)${NC}"
    echo "  Check your token and try again."
    exit 1
fi

# ── Step 5: Initialize git ────────────────────────────────────
echo ""
echo -e "${BLUE}Initializing git...${NC}"

if [ ! -d ".git" ]; then
    git init
    echo -e "${GREEN}✓ Git initialized${NC}"
else
    echo -e "${GREEN}✓ Git already initialized${NC}"
fi

# ── Step 6: Create .gitignore ─────────────────────────────────
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
.npm/

# OS
.DS_Store
Thumbs.db

# Env files — NEVER commit API keys
.env
.env.local
.env.*

# Build outputs
dist/
build/
.next/

# Large media (host on Mux instead)
*.mp4
*.mov
*.avi
EOF

echo -e "${GREEN}✓ .gitignore created${NC}"

# ── Step 7: Add, commit, push ─────────────────────────────────
echo ""
echo -e "${BLUE}Staging and committing files...${NC}"

git add .
git commit -m "Initial commit — AI Design Toolkit" 2>/dev/null || \
    echo -e "${YELLOW}⚠ Nothing new to commit — files may already be committed${NC}"

echo ""
echo -e "${BLUE}Pushing to GitHub...${NC}"

REMOTE_URL="https://$GITHUB_TOKEN@github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Set or update remote
if git remote get-url origin &> /dev/null; then
    git remote set-url origin "$REMOTE_URL"
else
    git remote add origin "$REMOTE_URL"
fi

git branch -M main
git push -u origin main

# ── Done ──────────────────────────────────────────────────────
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}  ✓ Done! Repo live at:                   ${NC}"
echo -e "${GREEN}  https://github.com/$GITHUB_USERNAME/$REPO_NAME ${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "Next step → Deploy to Cloudflare Pages:"
echo -e "  See guides/CLOUDFLARE.md"
echo ""
