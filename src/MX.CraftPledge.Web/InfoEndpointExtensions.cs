using System.Reflection;

namespace MX.CraftPledge.Web;

public static class InfoEndpointExtensions
{
    public static WebApplication MapInfoEndpoint(this WebApplication app)
    {
        app.MapGet("/info", () =>
        {
            var assembly = Assembly.GetExecutingAssembly();
            var informationalVersion = assembly
                .GetCustomAttribute<AssemblyInformationalVersionAttribute>()?
                .InformationalVersion ?? "unknown";
            var assemblyVersion = assembly.GetName().Version?.ToString() ?? "unknown";

            return Results.Ok(new
            {
                Version = informationalVersion,
                BuildVersion = informationalVersion.Split('+')[0],
                AssemblyVersion = assemblyVersion
            });
        }).AllowAnonymous();

        return app;
    }
}
