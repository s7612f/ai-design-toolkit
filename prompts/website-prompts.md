# 🖥 Clo Design — Website Building Prompts

Prompts to use directly inside [clo.ai/design](https://clo.ai/design) for building each section of your animated site.

---

## Starting a New Project

1. Go to [clo.ai/design](https://clo.ai/design)
2. Click **Other** → type `website` → **Create**
3. Describe your site OR paste a motionsite.ai template reference

### Option: Start from Motionsite Template
1. Go to [motionsite.ai](https://motionsite.ai)
2. Browse typography/layout sets
3. Copy a layout you like (screenshot or URL)
4. Paste into Clo Design and use this prompt:
```
Build this out, but do not add any of the video elements. I'll replace those later.
```

---

## Hero Section — Add Video Background

After generating the initial hero:
```
Replace the video background to be this one: [PASTE YOUR VIDEO URL HERE]
```

---

## Hero Section — Add Liquid Glass UI Cards

1. Go to [dribbble.com](https://dribbble.com) → search `UI elements` or `website design`
2. Screenshot 1–2 UI card elements you like
3. Upload the screenshots to Clo Design with this prompt:

```
Add these two UI elements under the text in our hero section. 
They should be positioned somewhat nicely around our content. 
They should NOT be in these colors — use the same liquid glass style 
we already use for the navbar and buttons. 
The text should be white.
```

---

## Second Section — Content + Video Background

1. Find a section layout on Dribbble or Pinterest
2. Screenshot it → clean it up with NanoBanana (see image-prompts.md)
3. Upload the cleaned image + your background video URL, then:

```
Build out this section exactly as it is, under our hero section. 
Also, import Google Material Icons. 
Where you see those green icons, place Google Material icons (random relevant icons) but make them white. 
I don't want any green colors. 
For the card backgrounds, use the same liquid glass we already use in the navbar and buttons. 
Use the same fonts we've already established.
For the second section, use this video as the background: [PASTE VIDEO URL]
```

---

## Style Consistency Prompts

Use these any time a new section doesn't match your established style:

```
Make sure the fonts, colors, and liquid glass card styles match the rest of the site. 
Use the same design language as the hero section.
```

```
The navbar style is liquid glass with white text. 
Apply this same card treatment to these new elements.
```

---

## Mobile Check

After building a section, preview mobile:
1. Click **Inspect** in Clo Design
2. Switch to mobile viewport

Or ask:
```
How does the mobile version of this look? 
If it's broken, fix the layout to be responsive and clean on mobile.
```

---

## Exporting Your Site

When done building:
1. Click **Export** in Clo Design
2. Export as **Code** (ZIP file)
3. Unzip → you get a static HTML/CSS/JS folder
4. Push to GitHub → Deploy on Cloudflare Pages (see guides/)

---

## Pro Tips

- **Always give AI reference images** — screenshots from Dribbble/Pinterest dramatically improve output quality vs. text-only prompts
- **Clean images before sending** — use NanoBanana to strip text and backgrounds from reference screenshots so AI focuses on layout
- **Build one section at a time** — prompt per section keeps quality higher than prompting the whole site at once
- **Liquid glass is the key aesthetic** — consistent use of `backdrop-filter: blur()` with semi-transparent backgrounds creates the cohesive look
