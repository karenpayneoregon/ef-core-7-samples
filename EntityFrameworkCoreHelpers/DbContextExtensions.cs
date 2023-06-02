using Microsoft.EntityFrameworkCore;


namespace EntityFrameworkCoreHelpers;

public static class DbContextExtensions
{
    public static string Provider(this DbContext context) 
        => context.Database.ProviderName;
}