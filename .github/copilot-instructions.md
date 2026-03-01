# Copilot Instructions

## Architecture

This is a .NET Aspire web application for CraftPledge — a certification brand for human-made work. The solution contains:

- `MX.CraftPledge.AppHost` - .NET Aspire orchestration host
- `MX.CraftPledge.ServiceDefaults` - Aspire service defaults (health checks, telemetry, resilience)
- `MX.CraftPledge.Web` - ASP.NET Core MVC brochure website with Bootstrap 5

## Key Patterns

- **Brochure site**: Static content pages (no database, no authentication)
- **Aspire orchestration**: AppHost registers the web project for local development with dashboard
- **MVC controllers**: Each page section has its own controller and views

## Build and Test

- Build: `dotnet build src/MX.CraftPledge.sln`
- Run: `dotnet run --project src/MX.CraftPledge.AppHost/MX.CraftPledge.AppHost.csproj`
- The Aspire dashboard is available during local development for telemetry

## Infrastructure

Terraform under `terraform/` with per-environment configs:
- Backends: `backends/dev.backend.hcl`, `backends/prd.backend.hcl`
- Variables: `tfvars/dev.tfvars`, `tfvars/prd.tfvars`
- Key resources: App Service (Linux .NET 10.0 on shared `platform-hosting` plan), Application Insights, DNS records
- Providers: AzureRM ~> 4.62

## C# Conventions

- All projects target .NET 10
- File-scoped namespaces
- Nullable reference types enabled
- Implicit usings enabled

## CI/CD

GitHub Actions workflows in `.github/workflows/`:
- `build-and-test.yml` - Runs on feature/bugfix/hotfix branch pushes
- `pr-verify.yml` - Build + Terraform plan on pull requests
- `deploy-prd.yml` - Full pipeline on main push (dev → prd)
- `deploy-dev.yml` - Manual dev deployment
- `codequality.yml` - Scheduled code quality analysis
- Uses reusable actions from `frasermolyneux/actions/` with OIDC authentication
