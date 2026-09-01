# AGENTS.md — craftpledge

.NET 10 Aspire brochure site for CraftPledge: ASP.NET Core MVC front end plus Aspire AppHost/ServiceDefaults, Terraform-managed Azure hosting, and a static blog under `Views/Blog`.

This is the portable execution brief for agents running without the local VS Code multi-root workspace context. `.github/copilot-instructions.md` is the authoritative source for project orientation, patterns, and CI/CD — read it first. Use `.github/instructions/blog-authoring.instructions.md` when creating or editing blog posts.

## Build, test, format

```pwsh
dotnet build src/MX.CraftPledge.slnx
dotnet test src/MX.CraftPledge.slnx
dotnet format src/MX.CraftPledge.slnx --verify-no-changes
dotnet run --project src/MX.CraftPledge.AppHost/MX.CraftPledge.AppHost.csproj

terraform -chdir=terraform fmt -check -recursive
terraform -chdir=terraform init -backend-config=backends/dev.backend.hcl
terraform -chdir=terraform validate
terraform -chdir=terraform plan -var-file=tfvars/dev.tfvars
```

## Boundaries

- Brochure site: no database, no authentication, no dynamic backend persistence — don't introduce these without an explicit task.
- Web project takes no external NuGet packages beyond the ServiceDefaults project reference.
- Don't hand-edit vendored assets under `wwwroot/lib`.
- No client secrets, connection strings, or hard-coded subscription IDs/GUIDs — Azure auth is OIDC + managed identity only.
- Don't change Azure resource naming/tagging conventions.
- Don't modify `.github/workflows/`, `.github/dependabot.yml`, `version.json`, or `Directory.Build.props` unless that is the explicit task.

## Do NOT

- Assume tools/SDKs are installed beyond what `.github/workflows/copilot-setup-steps.yml` provisions.
