using WebStandardsWithJson.Classes;
using static SqlServerLibrary.DataHelpers;

namespace WebStandardsWithJson;

internal partial class Program
{
    static void Main(string[] args)
    {
        DataOperations.AddRange(JsonOperations.Read());

        DataOperations.Read();
        AnsiConsole.MarkupLine("[yellow]Done[/]");
        Console.ReadLine();
    }
}