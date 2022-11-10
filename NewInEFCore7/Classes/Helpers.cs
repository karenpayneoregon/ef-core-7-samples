using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace NewInEFCore7.Classes
{
    internal class Helpers
    {
        public static void PrintSampleName([CallerMemberName] string? methodName = null)
        {
            AnsiConsole.MarkupLine($"[cyan]>>>> Sample:[/] [white]{methodName}[/]");
            Console.WriteLine();
        }
    }
}
