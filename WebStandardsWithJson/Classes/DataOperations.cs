using WebStandardsWithJson.Models;

namespace WebStandardsWithJson.Classes;
internal class DataOperations
{

    /// <summary>
    /// Populate table from reading a json file
    /// </summary>
    /// <param name="list">Data from json</param>
    public static void AddRange(List<WebStandards> list)
    {
        using var context = new Context();
        context.Database.EnsureDeleted();
        context.Database.EnsureCreated();
        context.AddRange(list);
        Console.WriteLine(context.SaveChanges());
    }

    /// <summary>
    /// * Read data from database
    /// * Get all AA complaint items
    /// </summary>
    public static void Read()
    {
        using var context = new Context();
        var standards = context.WebStandards.ToList();

        foreach (var standard in standards)
        {
            Console.WriteLine($"{standard.Identifier,-5}{standard.Title}");
            // not all items have related items so assert for null list
            if (standard.RelatedList is not null)
            {
                foreach (var related in standard.RelatedList)
                {
                    Console.WriteLine($"\t{related.Section,-10}{related.ConformanceLevel}");
                }
            }
        }

        var aaStandards = standards.Where(x => x.ConformanceLevel == "AA");

        AnsiConsole.MarkupLine("[cyan]ConformanceLevel AA[/]");
        Console.WriteLine(aaStandards.Count());

        AnsiConsole.MarkupLine("[cyan]Keyboard traps[/]");
        var keyboardTraps = standards.FirstOrDefault(x => x.Title == "No Keyboard Trap");
        Console.WriteLine(keyboardTraps.Description);
        Console.WriteLine(keyboardTraps.Uri);

        foreach (var related in keyboardTraps.RelatedList)
        {
            Console.WriteLine($"\t{related.Section,-10}{related.ConformanceLevel}");
        }

        Console.WriteLine();
    }
}
