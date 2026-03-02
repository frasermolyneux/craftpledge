---
description: Guidelines for creating CraftPledge blog posts, especially AI-transparency posts with console replay sections
globs: src/MX.CraftPledge.Web/Views/Blog/**/*.cshtml
---

# Blog Post Authoring Instructions

## When to create a blog post

After completing a **user-facing or significant feature**, prompt the user:

> "Would you like me to create a 'What's New' blog post about this feature? I can write it in the CraftPledge style — professional, transparent about AI usage, with a console replay of our conversation."

Only create a post if the user agrees.

## Post types

### AI-Transparency Posts (most common)
Posts about features built with AI assistance. These are the signature CraftPledge blog format.

### General Updates
Announcements, milestones, or news that don't require a console replay section.

## Structure of an AI-Transparency Post

Every AI-transparency blog post follows this structure:

1. **Page header** — A punchy, self-aware title acknowledging the irony
2. **Introduction** — What was built and why, written professionally but with wry self-awareness
3. **What changed** — Concrete description of the feature for users
4. **Why it matters** — Connect back to CraftPledge's mission of transparency
5. **Console Replay section** — A terminal-themed recreation of the development conversation (see below)
6. **Sign-off** — A closing thought that ties the irony together

## Tone and voice

- **Professional but self-aware**: Write like a thoughtful blog post, not a changelog
- **Ironic without being jokey**: The humour comes from the situation itself — an AI building a human-craft certification website. Don't force jokes; let the irony speak
- **Transparent**: This is the whole point. Be honest about what the AI did and what the human decided
- **Consistent with the "Our Story" page**: Match the warmth and directness of the existing site voice

### Examples of good tone:
- "Yes, we used AI to build this. Again. We're nothing if not consistent."
- "A human asked for this feature. An AI built it. A human approved it. That's our workflow, and we're not hiding it."
- "The irony isn't lost on us. It never is."

### Avoid:
- Corporate-speak or marketing fluff
- Being apologetic about using AI — own it with confidence
- Being so ironic it undermines the mission
- Technical jargon that non-developers wouldn't understand

## Console Replay section

This is the signature element of AI-transparency posts. It recreates the development conversation in a **terminal/console window** style, visually distinct from the chat-bubble format on the "Our Story" page.

### Why terminal style?
The "Our Story" page uses chat bubbles because it represents a casual conversation that started an idea. Blog console replays use terminal styling because they represent **code-driven development work** — commands, outputs, and technical decisions.

### HTML structure:

```html
<section class="section section-alt">
    <div class="container" style="max-width:800px;">
        <div class="text-center mb-4">
            <h2>Replay the Conversation</h2>
            <hr class="section-divider" />
            <p class="text-warm-gray">
                A recreation of the conversation that built this feature.
                Because transparency isn't just our product — it's our process.
            </p>
        </div>

        <div class="console-window">
            <div class="console-titlebar">
                <span class="console-dot red"></span>
                <span class="console-dot yellow"></span>
                <span class="console-dot green"></span>
                <span class="console-title">copilot-cli — craftpledge</span>
            </div>
            <div class="console-body">
                <div class="console-line">
                    <span class="console-prompt">$</span> Human's request or instruction
                </div>
                <div class="console-line">
                    <span class="console-prompt ai">&gt;</span> AI's response or action
                </div>
                <div class="console-line console-comment">
                    # Editorial comment or observation
                </div>
                <div class="console-line console-output">
                    → Output or result description
                </div>
                <div class="console-line console-muted">
                    [Meta-commentary about what just happened]
                </div>
            </div>
        </div>
    </div>
</section>
```

### Console replay guidelines:

- **`$` prompt (green)** — Human's words. Keep the natural, slightly messy feel. Include typos or casual phrasing if it happened
- **`>` prompt (blue)** — AI's words/actions. Summarise rather than quote verbatim
- **`#` comments (green italic)** — Editorial observations about the irony or process
- **`→` output (orange)** — Results, file counts, build outputs
- **`[brackets]` muted** — Meta-commentary in grey italic
- Keep it to **8-15 exchanges** — enough to tell the story, not so much it drags
- **Capture the interesting moments**: the request, the key decisions, any funny/ironic exchanges, the result
- End with a moment of self-awareness or irony

## Adding a new blog post

### 1. Create the view file

Create `src/MX.CraftPledge.Web/Views/Blog/{slug}.cshtml` where the slug is a kebab-case identifier.

### 2. Register the post

Add an entry to the `BlogPost.All` list in `src/MX.CraftPledge.Web/Models/BlogPost.cs`. **Add new posts to the top** (newest first):

```csharp
public static IReadOnlyList<BlogPost> All { get; } =
[
    new("your-new-slug",
        "Your Post Title",
        new DateOnly(2026, 3, 15),
        "A brief summary of the post for the index page.",
        ["tag1", "tag2"]),
    // ... existing posts below
];
```

### 3. Add the controller action

No action needed — the `BlogController.Post(string slug)` action dynamically resolves posts by slug.

### 4. Update the home page banner date (if desired)

The home page banner automatically shows for 7 days after the newest post's publish date. No manual change needed — it reads from `BlogPost.All`.

## File naming convention

- View files: `{slug}.cshtml` in `Views/Blog/`
- Slugs: kebab-case, descriptive, e.g. `building-a-blog-with-ai`, `tier-verification-launch`
- Dates in `BlogPost.All`: use the actual publish date

## Checklist before finishing

- [ ] Post view file created in `Views/Blog/`
- [ ] Post registered in `BlogPost.All` (newest first)
- [ ] Console replay section included (for AI-transparency posts)
- [ ] Tone matches CraftPledge voice — professional, ironic, transparent
- [ ] Build succeeds: `dotnet build src/MX.CraftPledge.sln`
