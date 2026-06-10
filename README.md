# CraftPledge

[![Build and Test](https://github.com/frasermolyneux/craftpledge/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/frasermolyneux/craftpledge/actions/workflows/build-and-test.yml)
[![Code Quality](https://github.com/frasermolyneux/craftpledge/actions/workflows/codequality.yml/badge.svg)](https://github.com/frasermolyneux/craftpledge/actions/workflows/codequality.yml)
[![PR Verify](https://github.com/frasermolyneux/craftpledge/actions/workflows/pr-verify.yml/badge.svg)](https://github.com/frasermolyneux/craftpledge/actions/workflows/pr-verify.yml)
[![Deploy Dev](https://github.com/frasermolyneux/craftpledge/actions/workflows/deploy-dev.yml/badge.svg)](https://github.com/frasermolyneux/craftpledge/actions/workflows/deploy-dev.yml)
[![Deploy Prd](https://github.com/frasermolyneux/craftpledge/actions/workflows/deploy-prd.yml/badge.svg)](https://github.com/frasermolyneux/craftpledge/actions/workflows/deploy-prd.yml)

## Documentation

* [Development Workflows](docs/development-workflows.md)

## Overview

CraftPledge is a certification brand for human-made work in the age of AI. The website at [craftpledge.org](https://www.craftpledge.org) serves as the public-facing brochure site for the initiative — presenting the manifesto, pledge tiers, and information for creators and consumers.

Built with .NET Aspire and ASP.NET Core MVC, deployed to Azure App Service on a shared hosting plan. Infrastructure is managed with Terraform and deployed via GitHub Actions.

## Contributing

Please read the [contributing](CONTRIBUTING.md) guidance; this is a learning and development project.

## Security

Please read the [security](SECURITY.md) guidance; I am always open to security feedback through email or opening an issue.

## Local dev: MCP wire-up

This repo is wired to the `frasermolyneux-copilot` MCP server (org conventions catalog) via `.github/copilot/mcp_config.json` for the GitHub Copilot coding agent, and via `.github/workflows/copilot-setup-steps.yml` for the agent runner (pinned to tag `v0.1.0` of `frasermolyneux/.github-copilot`). For full setup details (VS Code, Copilot CLI, Claude Desktop), see the upstream [mcp-server README](https://github.com/frasermolyneux/.github-copilot/blob/main/mcp-server/README.md).
