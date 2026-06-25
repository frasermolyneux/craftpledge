using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace MX.CraftPledge.Web.Controllers;

[ApiController]
[Route("api/health")]
public class HealthController(HealthCheckService healthCheckService) : ControllerBase
{
    [HttpGet("ready")]
    public async Task<IActionResult> GetReady()
    {
        var result = await healthCheckService.CheckHealthAsync();

        var statusCode = result.Status == HealthStatus.Healthy
            ? StatusCodes.Status200OK
            : StatusCodes.Status503ServiceUnavailable;

        return StatusCode(statusCode, new
        {
            status = result.Status.ToString(),
            checks = result.Entries.Select(e => new
            {
                name = e.Key,
                status = e.Value.Status.ToString(),
                description = e.Value.Description,
            }),
        });
    }

    [HttpGet("live")]
    public IActionResult GetLive()
    {
        return Ok(new
        {
            status = HealthStatus.Healthy.ToString(),
        });
    }
}
