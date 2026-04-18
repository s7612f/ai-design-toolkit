# 🤖 Claude Code Setup — Let AI Do the Work

Claude Code is a terminal-based AI agent that can write code, manage files, run git commands, deploy sites, and more — all from your command line. This guide covers exactly what API keys to provide and what prompts to give it to automate the full workflow from this tutorial.

---

## Installation

### Requirements
- Node.js 18+ ([nodejs.org](https://nodejs.org))
- A terminal (Terminal on Mac, PowerShell/WSL on Windows)
- An Anthropic API key

### Install Claude Code
```bash
npm install -g @anthropic/claude-code
```

Verify:
```bash
claude --version
```

---

## API Keys You Need

### 1. Anthropic API Key (Required)
This powers Claude Code itself.

1. Go to [console.anthropic.com](https://console.anthropic.com)
2. Click **API Keys** → **Create Key**
3. Copy the key (starts with `sk-ant-...`)
4. Set it in your terminal:
   ```bash
   export ANTHROPIC_API_KEY="sk-ant-your-key-here"
   ```
   Or add to your shell profile (`~/.zshrc` or `~/.bashrc`) to persist:
   ```bash
   echo 'export ANTHROPIC_API_KEY="sk-ant-your-key-here"' >> ~/.zshrc
   source ~/.zshrc
   ```

### 2. GitHub Personal Access Token (For git operations)
1. Go to [github.com/settings/tokens](https://github.com/settings/tokens)
2. **Generate new token (classic)**
3. Name: `claude-code-access`
4. Scopes: check ✅ **repo** (full control of repos)
5. Copy the token
6. Set it:
   ```bash
   export GITHUB_TOKEN="ghp_your-token-here"
   ```

### 3. Cloudflare API Token (For deployment)
1. Go to [dash.cloudflare.com/profile/api-tokens](https://dash.cloudflare.com/profile/api-tokens)
2. Click **Create Token** → Use **Edit Cloudflare Workers** template
3. Or create a Custom Token with these permissions:
   - `Account > Cloudflare Pages > Edit`
   - `Zone > Zone > Read` *(if using custom domain)*
4. Copy the token
5. Set it:
   ```bash
   export CLOUDFLARE_API_TOKEN="your-cf-token-here"
   export CLOUDFLARE_ACCOUNT_ID="your-account-id-here"  # found in CF dashboard right sidebar
   ```

---

## Running Claude Code

### Start a session
```bash
cd ~/Downloads/my-exported-site
claude
```

Claude Code opens an interactive session in your terminal. It can read all files in the current directory.

---

## Prompts to Give Claude Code

Copy-paste these prompts directly into Claude Code to automate everything:

---

### 🚀 Prompt 1 — Initialize repo and push to GitHub
```
Initialize a git repo in this folder, create a .gitignore that excludes node_modules and .DS_Store, 
make an initial commit with all files, then create a new GitHub repo called "my-ai-website" 
and push everything to it. Use my GITHUB_TOKEN from the environment for auth.
```

---

### ☁️ Prompt 2 — Deploy to Cloudflare Pages
```
Deploy this static site to Cloudflare Pages. The project name should be "my-ai-website". 
Use my CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID from the environment. 
The build output directory is the root folder (index.html is at the top level). 
After deploying, give me the live URL.
```

---

### 🔗 Prompt 3 — Connect Cloudflare to GitHub (auto-deploy on push)
```
Connect my Cloudflare Pages project "my-ai-website" to my GitHub repo "yourusername/my-ai-website" 
so it auto-deploys on every push to main. Use my CLOUDFLARE_API_TOKEN and GITHUB_TOKEN.
```

---

### 🎥 Prompt 4 — Upload video to Mux and update HTML
```
I have a video file at ./assets/background.mp4. 
Upload it to Mux using my MUX_TOKEN_ID and MUX_TOKEN_SECRET from the environment.
Once uploaded, get the playback URL and replace the video src in index.html with the new Mux URL.
Then commit and push the change.
```
*(Get Mux API keys at [dashboard.mux.com/settings/access-tokens](https://dashboard.mux.com/settings/access-tokens))*

---

### 🔄 Prompt 5 — Update site and redeploy
```
I've made changes to the site. Add all changes, commit with message "Update site design", 
push to GitHub. Cloudflare will auto-redeploy. Confirm the push succeeded.
```

---

### 🌐 Prompt 6 — Add a custom domain
```
Add the custom domain "mysite.com" to my Cloudflare Pages project "my-ai-website". 
Use my CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID. 
Also update the DNS records in Cloudflare to point to Pages.
```

---

## Full Environment Variables Cheatsheet

Add all of these to your `~/.zshrc` or `~/.bashrc`:

```bash
# Anthropic (Claude Code)
export ANTHROPIC_API_KEY="sk-ant-..."

# GitHub
export GITHUB_TOKEN="ghp_..."

# Cloudflare
export CLOUDFLARE_API_TOKEN="..."
export CLOUDFLARE_ACCOUNT_ID="..."

# Mux (optional — for video hosting)
export MUX_TOKEN_ID="..."
export MUX_TOKEN_SECRET="..."
```

Then reload: `source ~/.zshrc`

---

## Tips

- Claude Code can see all files in the current directory — always `cd` into your project first
- You can ask Claude Code to **read your README** and figure out what to do: `"Read the README and set up this project for deployment"`
- If a command fails, just tell Claude Code what the error was — it will fix and retry
- Claude Code can also **edit your HTML/CSS** directly: `"Change the hero text to 'Welcome to the Future' and make the font size larger"`
