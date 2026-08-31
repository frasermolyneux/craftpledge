---
description: Repository conventions for adding CraftPledge blog posts, including the terminal-styled "Replay the Conversation" component used in AI-transparency posts.
applyTo: "src/MX.CraftPledge.Web/Views/Blog/**/*.cshtml,src/MX.CraftPledge.Web/Models/BlogPost.cs"
---

# Blog Post Authoring Instructions

## Post types

- **AI-transparency posts** — the signature format; include a "Replay the Conversation" console section (see below).
- **General updates** — announcements/milestones; no console section required.

## Adding a new post

1. Create `src/MX.CraftPledge.Web/Views/Blog/{slug}.cshtml` — slug is kebab-case (e.g. `building-a-blog-with-ai`).
2. Register the post at the **top** of `BlogPost.All` in `src/MX.CraftPledge.Web/Models/BlogPost.cs` (newest first):

   ```csharp
   new("your-new-slug",
       "Your Post Title",
       new DateOnly(2026, 3, 15),
       "A brief summary of the post for the index page.",
       ["tag1", "tag2"]),
   ```

3. No controller change needed — `BlogController.Post(string slug)` resolves posts by slug dynamically.
4. The home page banner reads from `BlogPost.All` and shows automatically for 7 days after the newest post's date — no manual change needed.

## Console Replay section (AI-transparency posts)

Distinct from the chat-bubble style used on the "Our Story" page — this uses terminal styling to represent code-driven development work.

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

- `console-prompt` (`$`) = human, `console-prompt ai` (`&gt;`) = AI, `console-comment` (`#`) = editorial aside, `console-output` (`→`) = result, `console-muted` (`[...]`) = meta-commentary — these CSS classes are the only supported console-line variants.
- Keep to 8-15 exchanges.

## File naming

- View files: `{slug}.cshtml` in `Views/Blog/`.
- Dates in `BlogPost.All`: use the actual publish date.
