# Building Client Websites — The Two-Tier Approach

There are two ways to use this toolkit depending on the client and what they need. Start with Tier 1 on every project. Move to Tier 2 when the client wants animated visuals or you want the work to stand out on social media.

---

## Tier 1 — Claude Code (The Foundation)

**Use for:** Most client work. Service businesses, professionals, anyone who needs a clean credible site fast.

**Why it's the right default:** You write no code. You describe what you want in plain English, Claude writes the HTML/CSS/JS, and you iterate by conversation. The result is a custom-coded static site — faster to load and easier to maintain than WordPress.

> "Non-developers can build websites without coding knowledge through natural language interaction — Claude generates code across HTML, JavaScript, CSS, and PHP."  
> — [html.to.design, *How to build a website with Claude Code*](https://html.to.design/blog/from-claude-code-to-figma/)

### How to build a non-slop site with Claude Code

The difference between a site that looks professional and one that looks AI-generated comes down to a handful of real design decisions. These aren't opinions — they're documented in decades of usability research.

#### 1. Hierarchy first, style second

Before you write a single prompt, answer: what's the one thing a visitor should do on this page? That becomes the hero CTA. Everything else supports it. If you can't answer this, the client hasn't thought it through — help them.

> Jakob Nielsen's foundational usability research established that "recognition over recall" and clear visual hierarchy are the most reliable predictors of user success on a page. Users don't read pages, they scan — your hierarchy needs to work in 3 seconds.  
> — [NN/g, *10 Usability Heuristics for User Interface Design*](https://www.nngroup.com/articles/ten-usability-heuristics/)

Tell Claude this upfront in your first prompt:

```
Build a homepage for [business]. The single goal of this page is [CTA — book a call / order online / get a quote].
Every section should support this goal. Do not add sections that don't serve it.
```

#### 2. Typography that isn't embarrassing

Line height 1.5–1.6 for body text. Font size minimum 16px. One font family for headings, one for body — both from Google Fonts. Dark grey text on white (`#1a1a1a` on `#ffffff`), not pure black on pure white (lower contrast is easier to read for long copy).

> "Well-crafted typography enhances clear communication. Line spacing of 1.4 to 1.6 is the safe range. Serif typefaces for long text blocks, sans-serif for UI elements."  
> — [Toptal, *Designing for Readability: A Guide to Web Typography*](https://www.toptal.com/designers/typography/web-typography-infographic/)

Prompt Claude:
```
Use Inter for headings and body text. Body size 16px, line height 1.6, colour #1a1a1a.
Heading hierarchy: h1 at 48px, h2 at 32px, h3 at 22px.
```

#### 3. Whitespace — the thing most cheap sites get wrong

> "Intentional whitespace is a critical component of professional design. Dense content with elements too close together makes copy difficult to read. Use less whitespace to group elements, more whitespace to distinguish them."  
> — [Smashing Magazine, *How To Use Spaces In Web Design With Gestalt Principles*](https://www.smashingmagazine.com/2019/04/spaces-web-design-gestalt-principles/)

When a site feels busy or stressful, it's almost always a whitespace problem. Tell Claude:
```
Add generous padding between every section — minimum 80px top and bottom.
Cards should have at least 24px internal padding. Nothing should feel cramped.
```

#### 4. What makes a site look cheap — the real list

These come from documented analysis, not vibes:

| Cheap | Professional |
|---|---|
| Changes colour palette every section | Consistent 2–3 colour palette throughout |
| Stock photos used without editing | Custom photography or edited/branded stock |
| No mobile layout consideration | Mobile-first, thumb-friendly navigation |
| No trust signals | SSL, testimonials, case studies, clear contact |
| Slow load time | Optimised images, minimal JS, clean HTML |
| Generic template feel | Clear brand voice, specific copy |
| Broken links or outdated content | Everything works, content is current |

> "Professional sites show: HTTPS security, working contact forms, updated policies, testimonials, case studies. Cheap sites skip these details — broken links, missing policies, form errors create doubt."  
> — [ThoughtMedia, *Cheap Web Design vs Professional: The Real Difference*](https://www.thoughtmedia.com/cheap-web-design-vs-professional-the-real-difference/)

Prompt:
```
Add a testimonials section with 3 placeholder testimonials (I'll replace with real ones).
Make sure all links work and there's a visible contact method in the footer.
Add meta description and page title. Make sure images have alt text.
```

#### 5. Mobile is not optional

> "Responsive web design... serves one version of HTML that responds to the device. This is the expected standard — not a bonus feature."  
> — [A List Apart, *Responsive Web Design* by Ethan Marcotte](https://alistapart.com/article/responsive-web-design/)

Always test on mobile. Tell Claude from the start:
```
Build this mobile-first. The site should work perfectly on a 375px wide screen.
Menu should be a hamburger on mobile. Touch targets minimum 44px.
```

### Claude Code workflow — step by step

1. **Brief Claude properly** — paste the business name, what they do, who their customers are, and the one goal of the site
2. **Build section by section** — don't prompt the whole site at once; one section per conversation block
3. **Iterate by description** — "make the hero headline bigger and the background darker" — Claude edits the code
4. **Preview in browser** — open `index.html` directly in Chrome while building
5. **Ask Claude to audit it** — "Review this page for: mobile responsiveness, missing alt text, slow-loading elements, and anything that makes it look cheap"
6. **Export** — the file is already done; just push to GitHub/Cloudflare

> "Claude's code is not always perfect; minor fixes may be needed. Achieving fully polished final products typically requires manual fine-tuning."  
> — [html.to.design, *How to build a website with Claude Code*](https://html.to.design/blog/from-claude-code-to-figma/)

That's fine and expected. The fix loop is still faster than building from scratch.

---

## Tier 2 — Clo Design (The Advanced Version)

**Use for:** Clients who want animated backgrounds, liquid glass UI, video sections — sites that look like they cost significantly more than they do. Good for gyms, agencies, event companies, anything visual.

**Also use for:** Your own portfolio/showcase sites that you post on Twitter/X to attract clients.

Clo Design is an AI-powered animated website builder. You export the result as static HTML/CSS/JS files, then deploy the same way as a Claude Code site.

### How it differs from Claude Code

| | Claude Code | Clo Design |
|---|---|---|
| How you work | Conversational — describe in words | Visual — see changes live |
| Output | Clean hand-coded HTML | Animated, production-ready HTML |
| Best for | Speed, simplicity, any client type | High-visual-impact work |
| Learning curve | Minutes | A few hours |
| Animations | Manual (you ask Claude for CSS) | Built-in, polished |

### The key aesthetic: liquid glass

Every element uses `backdrop-filter: blur()` with semi-transparent backgrounds — the technique used by Apple in iOS and increasingly by high-end web design. Consistent use of this across navbar, cards, and buttons creates the cohesive look.

Tell Clo Design:
```
Make sure the fonts, colors, and liquid glass card styles match the rest of the site.
Use the same design language as the hero section.
```

### The image-to-animated-background workflow

This is what makes Tier 2 sites look expensive. The full pipeline:

```
Reference image (Dribbble/Pinterest)
  ↓
NanoBanana 2 — clean and restyle to 8K, remove text/logos
  ↓
Figma — expand canvas with AI fill if image is too narrow
  ↓
Kling 3.0 — animate still image to 12s looping video
  ↓
Mux — host video, get CDN URL
  ↓
Clo Design — paste URL as section video background
```

Kling prompt (copy-paste):
```
Create animation. No camera movement.
```

NanoBanana prompt (copy-paste):
```
Create me an image like this in 8K. Remove any text, buttons, any logos.
Just want the exact same background, same positioning as well. No zoom in or zoom outs.
For the background, I want it to be on a plain black background. Remove all text, buttons, cards, rectangles.
```

### When to use which tier

- Dentist who needs to rank on Google and take bookings → **Tier 1**
- Gym wanting a site that makes people want to join → **Tier 2**
- Accountant needing a credibility page → **Tier 1**
- Creative agency wanting a showpiece site → **Tier 2**
- Any client with a £500 budget → **Tier 1**
- Client you want to post on Twitter for inbound → **Tier 2**

---

## Deployment (same for both tiers)

Both approaches produce static HTML files. Hosting is free.

**Option A — GitHub Pages** (simplest):
1. Push folder to a GitHub repo (Claude Code does this for you if you ask)
2. Go to Settings → Pages → select `main` branch → Save
3. Live at `yourusername.github.io/repo-name` within 1 minute

**Option B — Cloudflare Pages** (better for client work — custom domain, faster):
1. Push to GitHub
2. Go to Cloudflare → Workers & Pages → Connect to Git → select repo
3. Deploy. Set custom domain in Cloudflare DNS settings.

See `guides/CLOUDFLARE.md` for detailed Cloudflare steps.
