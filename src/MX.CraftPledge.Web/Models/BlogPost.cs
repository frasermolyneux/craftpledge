namespace MX.CraftPledge.Web.Models;

public record BlogPost(
    string Slug,
    string Title,
    DateOnly Published,
    string Summary,
    string[] Tags)
{
    /// <summary>
    /// Registry of all blog posts, newest first. Add new posts to the top.
    /// </summary>
    public static IReadOnlyList<BlogPost> All { get; } =
    [
        new("building-a-blog-with-ai",
            "We Built a Blog Feature. With AI. For a Human-Craft Website.",
            new DateOnly(2026, 3, 2),
            "CraftPledge now has a \"What's New\" section — and yes, an AI built it. We walk through the irony, the transparency, and the actual conversation that made it happen.",
            ["transparency", "ai", "meta"]),
    ];
}
