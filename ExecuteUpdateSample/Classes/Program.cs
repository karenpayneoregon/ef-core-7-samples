using System.Runtime.CompilerServices;

// ReSharper disable once CheckNamespace
namespace ExecuteUpdateSample
{
    internal partial class Program
    {
        [ModuleInitializer]
        public static void Init()
        {
            AnsiConsole.MarkupLine("");
            Console.Title = "Code sample: Execute update";
            WindowUtility.SetConsoleWindowPosition(WindowUtility.AnchorWindow.Center);
        }
    }
}
