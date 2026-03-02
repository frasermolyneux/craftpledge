using Microsoft.AspNetCore.Mvc;
using MX.CraftPledge.Web.Models;

namespace MX.CraftPledge.Web.Controllers;

public class BlogController : Controller
{
    public IActionResult Index()
    {
        return View(BlogPost.All);
    }

    public IActionResult Post(string slug)
    {
        var post = BlogPost.All.FirstOrDefault(p => p.Slug == slug);
        if (post is null)
            return NotFound();

        ViewData["Title"] = post.Title;
        ViewData["BlogPost"] = post;

        return View(post.Slug);
    }
}
