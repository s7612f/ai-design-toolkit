# 🎥 Image & Video Generation Prompts

All prompts from the tutorial, cleaned up and ready to copy-paste into NanoBanana 2, Kling, or Figma AI.

---

## NanoBanana 2 Prompts

### Background Image (Clean Recreation)
Use when you have a reference image and want to recreate it cleanly:
```
Create me an image like this in 8K. Remove any text, buttons, any logos. 
Just want the exact same background, same positioning as well. 
No zoom in or zoom outs. Just want the exact image. 
For the background, I want it to be on a black background, on a plain black. 
Remove the text, buttons, any cards, rectangles, etc.
```
- **Aspect ratio**: 16:9
- **Quality**: 4K or 8K
- **Model**: NanoBanana 2

---

### Style Transfer (Apply look of Image A to Image B)
Use when you want Image B's composition but Image A's color/texture:

**Prompt variation 1:**
```
Create me a second image should be in the same style as the first image. 
The background should be the same, the texture should be the same, 
and basically it should look similarly, but still keep the same composition as the second image.
```

**Prompt variation 2:**
```
Create me an image, the second image, but in the same styles as the first image.
```

**Prompt variation 3 (most specific):**
```
Create me a second image, but the background should be as the first image 
and the color should be as the first image as well. 
Basically copy the styles of the first image and apply it to the second image 
but keep it close as the second image because I like it.
```

> 💡 **Tip**: Generate 3+ variations using these different prompts and pick the best result.

---

### Section Layout Image (for handing to Clo Design AI)
Use when you have a reference section layout but want to remove clutter before sending to AI:
```
Create me an image like this in 8K. Same layout of text. 
Remove the background. Just keep the text and any cards and icons on a plain black background.
```
- **Aspect ratio**: 5:4 or 16:9 depending on section shape

---

## Kling AI / Sideens — Animation Prompts

### Animate a Still Image (Looping Background)
```
Create animation. No camera movement.
```
- **Model**: Kling 3.0
- **Duration**: 12 seconds
- **Mode**: Image-to-video

---

### Animate Video Background (via Sideens/Cedance)
```
Create video animation like these but without any text elements, 
no camera movement, no extra zooms.
```

---

## Figma AI — Image Expansion

When you have a background image that's too small/narrow, use Figma to expand it:

1. Import image into Figma
2. Extend the canvas up and down beyond the image
3. Use **Fill** → AI fill to extend the image naturally
4. Export as JPEG
5. Use that expanded image as input to Kling for animation

> Figma uses NanoBanana 2 under the hood for its AI image features.

---

## Free Background Videos (No Generation Needed)

From the tutorial creator's site — free to use:
- [motionsites.ai/backgrounds](https://motionsites.ai) → click **Backgrounds**
- Copy the URL directly and paste into Clo Design or your HTML

---

## Workflow Summary

```
Reference Image (Dribbble/Pinterest)
    ↓
NanoBanana 2 → Clean/Restyle Image
    ↓
Figma → Expand Canvas (if needed)
    ↓
Kling 3.0 → Animate Image into Looping Video
    ↓
Mux.com → Host Video (get CDN URL)
    ↓
Clo Design → Use URL as video background
```
