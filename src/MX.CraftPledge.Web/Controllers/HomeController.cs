using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MX.CraftPledge.Web.Models;

namespace MX.CraftPledge.Web.Controllers;

public class HomeController : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Manifesto()
    {
        return View();
    }

    public IActionResult Tiers()
    {
        return View();
    }

    public IActionResult OurStory()
    {
        return View();
    }

    public IActionResult ForCreators()
    {
        return View();
    }

    public IActionResult ForConsumers()
    {
        return View();
    }

    public IActionResult Faq()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
