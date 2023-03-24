using WebStandardsWithJson.Classes;
using WebStandardsWithJson.Models;

namespace WebStandardsWithJson;

internal partial class Program
{
    static void Main(string[] args)
    {

        //DataOperations.AddRange(JsonOperations.Read());
        DataOperations.Read();
        AnsiConsole.MarkupLine("[yellow]Hello[/]");
        Console.ReadLine();
    }
}