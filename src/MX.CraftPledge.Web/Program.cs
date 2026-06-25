using MX.CraftPledge.Web;

var builder = WebApplication.CreateBuilder(args);

_ = builder.AddServiceDefaults();

// Add services to the container.
_ = builder.Services.AddControllersWithViews();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    _ = app.UseExceptionHandler("/Home/Error");
}

_ = app.UseRouting();

_ = app.UseAuthorization();

_ = app.MapStaticAssets();

app.MapControllerRoute(
    name: "blog-post",
    pattern: "Blog/{slug}",
    defaults: new { controller = "Blog", action = "Post" })
    .WithStaticAssets();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}")
    .WithStaticAssets();

_ = app.MapDefaultEndpoints();

_ = app.MapInfoEndpoint();

app.Run();
