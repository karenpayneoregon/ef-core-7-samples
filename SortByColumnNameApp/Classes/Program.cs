using System.Runtime.CompilerServices;

// ReSharper disable once CheckNamespace
namespace SortByColumnNameApp;

internal partial class Program
{
    [ModuleInitializer]
    public static void Init()
    {
        Console.Title = "Code sample: NorthWind sort by string";
        Console.WindowHeight = 55;
        Console.WriteLine();
        WindowUtility.SetConsoleWindowPosition(WindowUtility.AnchorWindow.Center);
    }

    private static void Render(Rule rule)
    {
        AnsiConsole.Write(rule);
        AnsiConsole.WriteLine();
    }

    private static void ExitPrompt()
    {
        Console.WriteLine();
        Render(new Rule($"[white on blue]Press a key to exit the demo or scroll up to see results[/]")
            .RuleStyle(Style.Parse("cyan"))
            .Centered());
        Console.ReadLine();
    }
}