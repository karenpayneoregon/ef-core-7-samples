using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

// ReSharper disable once CheckNamespace
namespace ExecuteDeleteSample;

internal partial class Program
{
    [ModuleInitializer]
    public static void Init()
    {
        AnsiConsole.MarkupLine("");
        Console.Title = "Code sample: EF Core ExecuteDelete";
        WindowUtility.SetConsoleWindowPosition(WindowUtility.AnchorWindow.Center);
    }
    #region Screen helpers
    public static Table CreateTableEntityFramework() => TableExtensions.Title(HasBorderExtensions.BorderColor(AlignableExtensions.Alignment(TableExtensions.AddColumn(TableExtensions.AddColumn(HasTableBorderExtensions.RoundedBorder(new Table()), "[cyan]Event[/]"), "[cyan]Count[/]"), Justify.Center), Color.LightSlateGrey), "[LightGreen]Results[/]");

    private static void Render(Rule rule)
    {
        AnsiConsole.Write(rule);
        AnsiConsole.WriteLine();
    }

    private static void ExitPrompt()
    {
        Console.WriteLine();
        Render(AlignableExtensions.Centered(RuleExtensions.RuleStyle(new Rule($"[yellow]Press a key to exit the demo[/]"), Style.Parse("silver"))));
        Console.ReadLine();
    }
    #endregion
}