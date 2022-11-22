using NewInEFCore7.Classes;

namespace NewInEFCore7
{
    internal partial class Program
    {
        static async Task Main(string[] args)
        {
            AnsiConsole.MarkupLine("[yellow]Hello[/]");
            //await QueryStatisticsLoggerSample.ExecutingCommandsAfterConsumingAResultSet();
            await JsonColumnsSample.Json_columns_with_TPH_on_SQLite();
            Console.ReadLine();
        }
    }
}