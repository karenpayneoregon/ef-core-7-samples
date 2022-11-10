using ConfigurationLibrary.Classes;
using IMaterializationInterceptorSample.Data;
using Microsoft.EntityFrameworkCore;
using SqlServerLibrary;

namespace IMaterializationInterceptorSample
{
    internal partial class Program
    {
        static async Task Main(string[] args)
        {
            await using var context = new ProductsContext();

            await context.Database.EnsureDeletedAsync();
            await context.Database.EnsureCreatedAsync();
            var product = await context.Products.OrderBy(r => Guid.NewGuid()).Take(1).FirstOrDefaultAsync();
            AnsiConsole.MarkupLine($"[white]Customer[/] [cyan]{product!.Name}[/] [white]was retrieved at[/] [cyan]{product.Retrieved.ToLocalTime()}[/]");
  

            Console.ReadLine();
        }
    }
}