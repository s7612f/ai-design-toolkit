# ☁️ Deploy to Cloudflare Pages (Free)

This guide walks you through deploying your exported Clo Design website to Cloudflare Pages — completely free, with a global CDN.

---

## Prerequisites
- A [Cloudflare account](https://dash.cloudflare.com/sign-up) (free)
- A [GitHub account](https://github.com) (free)
- Your exported site code (ZIP from Clo Design)

---

## Option A: Deploy via GitHub (Recommended)

This is the best method — every time you push to GitHub, Cloudflare auto-redeploys.

### Step 1 — Push your site to GitHub
Follow [`GIT_SETUP.md`](./GIT_SETUP.md) or use the script in `scripts/push-to-github.sh`.

### Step 2 — Connect to Cloudflare Pages
1. Go to [dash.cloudflare.com](https://dash.cloudflare.com)
2. Click **Workers & Pages** in the left sidebar
3. Click **Create application** → **Pages** → **Connect to Git**
4. Authorize GitHub and select your repo
5. Configure build settings:
   - **Build command**: *(leave blank for static HTML sites)*
   - **Build output directory**: `/` or `/dist` *(wherever your `index.html` lives)*
6. Click **Save and Deploy**

### Step 3 — Your site is live!
Cloudflare gives you a free URL like:
```
https://your-site-name.pages.dev
```
You can add a custom domain later in the Pages settings.

---

## Option B: Direct Upload (No Git required)

If you just want to test quickly:

1. Go to [dash.cloudflare.com](https://dash.cloudflare.com)
2. **Workers & Pages** → **Create application** → **Pages** → **Upload assets**
3. Drag and drop your unzipped site folder
4. Click **Deploy site**

Done. Live in ~30 seconds.

---

## Adding a Custom Domain

1. In Cloudflare Pages → your project → **Custom domains**
2. Click **Set up a custom domain**
3. Enter your domain (must be managed by Cloudflare DNS)
4. Cloudflare auto-configures SSL — no extra steps

---

## Hosting Your Background Videos on Mux

Clo Design sites use video backgrounds. Don't host large `.mp4` files in your repo — use [Mux](https://mux.com) for free video hosting:

1. Sign up at [mux.com](https://mux.com) (free tier: 10GB storage)
2. Upload your video → Mux gives you a streaming URL like:
   ```
   https://stream.mux.com/XXXXXX.m3u8
   ```
3. Or get a direct `.mp4` playback URL:
   ```
   https://stream.mux.com/XXXXXX/high.mp4
   ```
4. Paste that URL into your Clo Design video background field

---

## Performance Tips

- ✅ Cloudflare's CDN caches your site globally — fast everywhere
- ✅ Enable **Speed > Optimization > Auto Minify** in Cloudflare dashboard
- ✅ Keep video files on Mux, not in your repo (keeps deploy size small)
- ✅ Clo Design exported code is already lightweight — no bundler needed

---

## Troubleshooting

| Problem | Fix |
|---|---|
| Blank page after deploy | Check that `index.html` is in the root of your output directory |
| Video not loading | Make sure video URL is publicly accessible (test in incognito) |
| CSS/JS not loading | Check relative paths in your HTML — they should be `./style.css` not `/style.css` |
| Build fails | Set build command to blank (static HTML doesn't need a build step) |
