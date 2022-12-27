using TranslationStringIndexOfApp.Data;
using TranslationStringIndexOfApp.Models;

namespace TranslationStringIndexOfApp;

internal partial class Program
{


    static void Main(string[] args)
    {

        string findThis = "cat";

        using var context = new Context();

        context.Database.EnsureDeleted();
        context.Database.EnsureCreated();

        var cat = context.Items
            .AsEnumerable()
            .Select(item => new FoundedItem(
                item.Information.IndexOf(findThis, StringComparison.Ordinal), 
                item.Information, 
                item.Id))
            .FirstOrDefault(x => x.Position > 0);

        if (cat is not null)
        {
            AnsiConsole.MarkupLine($"Found [cyan]{findThis}[/] with Id of [cyan]{cat.Id}[/]");
        }
        Console.ReadLine();
    }
}