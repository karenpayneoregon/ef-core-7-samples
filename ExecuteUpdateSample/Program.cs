using ExecuteUpdateSample.Data;
using Microsoft.EntityFrameworkCore;

namespace ExecuteUpdateSample;

internal partial class Program
{
    static async Task Main(string[] args)
    {
        await using var context = new ProductsContext();

        await context.Database.EnsureDeletedAsync();
        await context.Database.EnsureCreatedAsync();

        await context.Products.AsNoTracking()
            .Where(p => p.Price > 10)
            .ExecuteUpdateAsync(s => s
                .SetProperty(p => p.Name, p =>
                    p.Name.EndsWith(" *") ? p.Name.Replace(" *", "") : p.Name + " *")
                .SetProperty(p => p.Price, p => p.Price - 12));
    }


}