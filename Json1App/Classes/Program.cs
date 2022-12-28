using System.Runtime.CompilerServices;

// ReSharper disable once CheckNamespace
namespace Json1App;
internal partial class Program
{
    [ModuleInitializer]
    public static void Init()
    {
        AnsiConsole.MarkupLine("[yellow]Person with addresses as json[/]");
        Console.Title = "Code sample: Json columns simple";
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

        Render(new Rule("[yellow]Press ENTER to exit the demo[/]")
            .RuleStyle(Style.Parse("silver"))
            .Centered());

        Console.ReadLine();
    }
}
