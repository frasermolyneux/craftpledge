# Copilot Instructions

> Shared conventions: see [`.github-copilot/.github/instructions/terraform.instructions.md`](../../.github-copilot/.github/instructions/terraform.instructions.md) for the standard Terraform layout, providers, remote-state pattern, validation commands, and CI/CD workflows.

## Architecture

This is a .NET Aspire web application for CraftPledge — a certification brand for human-made work. The solution contains:

- `MX.CraftPledge.AppHost` - .NET Aspire orchestration host
- `MX.CraftPledge.ServiceDefaults` - Aspire service defaults (health checks, telemetry, resilience)
- `MX.CraftPledge.Web` - ASP.NET Core MVC brochure website with Bootstrap 5

## Key Patterns

- **Brochure site**: Static content pages (no database, no authentication). All page actions return `View()` with no model binding or data access.
- **Aspire orchestration**: `AppHost.cs` registers the web project as `"web"` via `builder.AddProject<Projects.MX_CraftPledge_Web>("web")`. The Aspire dashboard provides telemetry during local development.
- **Single controller**: All brochure pages live in `HomeController` (Index, Manifesto, Tiers, OurStory, ForCreators, ForConsumers, Faq, Privacy). A separate `HealthController` exposes `GET /api/health`. `BlogController` handles blog index and individual post pages.
- **Blog posts**: Static `.cshtml` views in `Views/Blog/` with metadata in `Models/BlogPost.cs`. See `.github/instructions/blog-authoring.instructions.md` for authoring guidance.
- **ServiceDefaults pattern**: `Extensions.cs` provides `AddServiceDefaults()` and `MapDefaultEndpoints()` extension methods that configure OpenTelemetry, health checks (`/health`, `/alive`), service discovery, and HTTP resilience.

## Build and Test

- Build: `dotnet build src/MX.CraftPledge.sln`
- Run: `dotnet run --project src/MX.CraftPledge.AppHost/MX.CraftPledge.AppHost.csproj`
- There are no unit tests in this solution currently.

## Blog / What's New

- The site includes a blog feature at `/Blog` for sharing updates and transparent dispatches
- `BlogController` handles the index (list) and individual post pages
- Posts are static `.cshtml` views in `Views/Blog/` with metadata registered in `BlogPost.All` (see `Models/BlogPost.cs`)
- AI-transparency posts include a "Replay the Conversation" section styled as a terminal window
- See `.github/instructions/blog-authoring.instructions.md` for detailed guidance on creating blog posts
- **After completing a user-facing or significant feature**, prompt the user about creating a blog post

## C# Conventions

- All projects target .NET 10
- File-scoped namespaces
- Nullable reference types enabled
- Implicit usings enabled
- No external NuGet packages in the Web project — only project reference to ServiceDefaults

## Infrastructure

Terraform under `terraform/` with per-environment configs:
- Backends: `backends/dev.backend.hcl`, `backends/prd.backend.hcl`
- Variables: `tfvars/dev.tfvars`, `tfvars/prd.tfvars`
- Key resources: Azure Linux Web App (`.NET 10.0`, shared `platform-hosting` App Service Plan), Application Insights, DNS records
- Providers: AzureRM ~> 4.62, Terraform >= 1.14.3
- Remote state dependencies: `platform-monitoring` (Log Analytics workspace), `platform-hosting` (App Service Plan)
- Health check configured at `/api/health` in the App Service

## CI/CD

GitHub Actions workflows in `.github/workflows/`:
- `build-and-test.yml` - Runs on feature/bugfix/hotfix branch pushes (detects src/ vs terraform/ changes)
- `pr-verify.yml` - Build + Terraform plan on pull requests (skips draft PRs)
- `deploy-prd.yml` - Full pipeline on main push: build → deploy dev → deploy prd
- `deploy-dev.yml` - Manual dev deployment
- `codequality.yml` - Scheduled code quality analysis
- Uses reusable actions from `frasermolyneux/actions/` with OIDC authentication
- Branch naming: `feature/*`, `bugfix/*`, `hotfix/*`
