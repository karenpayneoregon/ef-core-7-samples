using System.Runtime.CompilerServices;

// ReSharper disable once CheckNamespace
namespace WebStandardsWithJson;
internal partial class Program
{
    [ModuleInitializer]
    public static void Init()
    {
        AnsiConsole.MarkupLine("");
        Console.Title = "EF Core Json columns WCAG";
        WindowUtility.SetConsoleWindowPosition(WindowUtility.AnchorWindow.Center);
    }
}
