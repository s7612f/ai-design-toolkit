# 🗂 Git Setup Guide

How to take your downloaded site (or this repo) and push it to GitHub from scratch.

---

## If You're Using Claude Code (Recommended)

See [`CLAUDE_CODE_SETUP.md`](./CLAUDE_CODE_SETUP.md) — Claude Code can do all of this for you automatically with a single prompt.

---

## Manual Setup (Step by Step)

### Step 1 — Install Git
- **Mac**: `brew install git` or download from [git-scm.com](https://git-scm.com)
- **Windows**: Download from [git-scm.com](https://git-scm.com)
- **Linux**: `sudo apt install git`

Verify: `git --version`

---

### Step 2 — Create a GitHub Repo
1. Go to [github.com/new](https://github.com/new)
2. Name your repo (e.g. `my-ai-website`)
3. Set to **Public** or **Private**
4. **Do NOT** check "Add a README" (you already have files)
5. Click **Create repository**
6. Copy the repo URL — looks like:
   ```
   https://github.com/yourusername/my-ai-website.git
   ```

---

### Step 3 — Initialize and Push

Open your terminal, navigate to your project folder, then run:

```bash
# Navigate to your project
cd ~/Downloads/my-ai-website   # or wherever your site is

# Initialize git
git init

# Add all files
git add .

# First commit
git commit -m "Initial commit — AI animated website"

# Connect to your GitHub repo
git remote add origin https://github.com/yourusername/my-ai-website.git

# Push to GitHub
git branch -M main
git push -u origin main
```

---

### Step 4 — Authenticate with GitHub

If prompted for credentials, use a **Personal Access Token** (GitHub no longer accepts passwords):

1. Go to [github.com/settings/tokens](https://github.com/settings/tokens)
2. Click **Generate new token (classic)**
3. Name it, set expiry, check **repo** scope
4. Copy the token — use it as your password when Git asks

Or use SSH keys — see [GitHub SSH docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

---

### Future Updates

After making changes to your site:

```bash
git add .
git commit -m "Update hero section video"
git push
```

Cloudflare Pages will auto-redeploy within ~30 seconds.

---

## Quick Reference

| Command | What it does |
|---|---|
| `git init` | Start tracking a folder with git |
| `git add .` | Stage all changed files |
| `git commit -m "message"` | Save a snapshot |
| `git push` | Upload to GitHub |
| `git pull` | Download latest from GitHub |
| `git status` | See what's changed |
| `git log --oneline` | See commit history |
