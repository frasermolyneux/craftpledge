using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using MX.CraftPledge.Web.Models;

namespace MX.CraftPledge.Web.Controllers;

public class HomeController : Controller
{
    public IActionResult Index() => View();

    public IActionResult Manifesto() => View();

    public IActionResult Tiers() => View();

    public IActionResult OurStory() => View();

    public IActionResult ForCreators() => View();

    public IActionResult ForConsumers() => View();

    public IActionResult Faq() => View();

    public IActionResult Privacy() => View();

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
