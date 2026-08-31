# Copilot Instructions

## Architecture

.NET 10 Aspire web application for CraftPledge — a certification brand for human-made work.

- `MX.CraftPledge.AppHost` - Aspire orchestration host; registers the web project as `"web"`.
- `MX.CraftPledge.ServiceDefaults` - `AddServiceDefaults()`/`MapDefaultEndpoints()` configure OpenTelemetry, health checks (`/health/live`, `/health/ready`), service discovery, HTTP resilience.
- `MX.CraftPledge.Web` - ASP.NET Core MVC brochure website with Bootstrap 5.

## Key Patterns

- **Brochure site**: static content only — no database, no authentication. All page actions return `View()` with no model binding or data access.
- **Single controller**: brochure pages live in `HomeController` (Index, Manifesto, Tiers, OurStory, ForCreators, ForConsumers, Faq, Privacy). `HealthController` exposes `GET /api/health/live` and `GET /api/health/ready`. `BlogController` handles blog index and post pages.
- **Blog**: static `.cshtml` views in `Views/Blog/` with metadata in `Models/BlogPost.cs`. Follow `.github/instructions/blog-authoring.instructions.md` when creating or editing posts.
- **Vendored assets**: `wwwroot/lib` is third-party/vendored — don't hand-edit; update via the vendoring source instead.
- All projects target .NET 10, file-scoped namespaces, nullable reference types, implicit usings. No external NuGet packages in the Web project beyond the ServiceDefaults project reference.

## Build and Test

- Build: `dotnet build src/MX.CraftPledge.sln`
- Run: `dotnet run --project src/MX.CraftPledge.AppHost/MX.CraftPledge.AppHost.csproj`
- No unit tests exist in this solution currently.

## Infrastructure

Terraform under `terraform/`, per-environment configs in `backends/` and `tfvars/`:
- Azure Linux Web App (.NET 10.0) on the shared `platform-hosting` App Service Plan, Application Insights, DNS records.
- Providers: AzureRM ~> 5.2, Terraform >= 1.15.6.
- Remote state dependencies: `platform-monitoring` (Log Analytics workspace), `platform-hosting` (App Service Plan).
- Health check endpoint: `/api/health/live`.

## CI/CD

Workflows in `.github/workflows/` use reusable actions from `frasermolyneux/actions/` with OIDC authentication:
- `build-and-test.yml` / `pr-verify.yml` - build + Terraform plan on branch push / pull request.
- `deploy-dev.yml` / `deploy-prd.yml` - manual dev deploy / full dev→prd pipeline on main push.
- `codequality.yml` - scheduled code quality analysis.
- Branch naming: `feature/*`, `bugfix/*`, `hotfix/*`.
