using NewInEFCore7.Classes;

namespace NewInEFCore7
{
    internal partial class Program
    {
        static void Main(string[] args)
        {
            AnsiConsole.MarkupLine("[yellow]Hello[/]");
            QueryStatisticsLoggerSample.ExecutingCommandsAfterConsumingAResultSet();
            Console.ReadLine();
        }
    }
}