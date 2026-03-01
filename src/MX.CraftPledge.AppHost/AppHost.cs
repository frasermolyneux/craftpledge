var builder = DistributedApplication.CreateBuilder(args);

builder.AddProject<Projects.MX_CraftPledge_Web>("web");

builder.Build().Run();
