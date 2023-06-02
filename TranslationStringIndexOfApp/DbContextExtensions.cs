using Microsoft.EntityFrameworkCore;

namespace TranslationStringIndexOfApp;

public static class DbContextExtensions
{
    public static string Provider(this DbContext context)
    {
        return context.Database.ProviderName;
    }
}