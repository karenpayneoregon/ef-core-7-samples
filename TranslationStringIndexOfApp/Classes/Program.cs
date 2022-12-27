using System.Runtime.CompilerServices;

// ReSharper disable once CheckNamespace
namespace TranslationStringIndexOfApp;
internal partial class Program
{
    [ModuleInitializer]
    public static void Init()
    {
        AnsiConsole.MarkupLine("");
        Console.Title = "Code sample: Translation of string.IndexOf";
        WindowUtility.SetConsoleWindowPosition(WindowUtility.AnchorWindow.Center);
    }
}
