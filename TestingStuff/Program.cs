using ConfigurationLibrary.Classes;
using EntityFrameworkCoreHelpers;
using EntityFrameworkCoreHelpers.Models;
using Microsoft.EntityFrameworkCore;
using TestingStuff.Classes;
using TestingStuff.Data;
using TestingStuff.Models;


namespace TestingStuff;

internal partial class Program
{
    static void Main(string[] args)
    {
        AnsiConsole.MarkupLine("[yellow]Hello[/]");

        Generic1();
        Console.ReadLine();
    }



    private static void NonGeneric1()
    {
        var models = Operations.GetDatabaseModels();
        foreach (var model in models)
        {
            Operations.GetProperties(model);
        }
    }

    private static void Generic1()
    {
        using var context = new Context();
        var items = EntityHelpers
            .GetNavigationInformation<Customers, Context>(context.Database.GetConnectionString());

        //Console.WriteLine("Customers");
        //var props = context.GetModelProperties(items.FirstOrDefault(x => x.Name == "Customers")!.Name);
        //foreach (var column in props)
        //{
        //    Console.WriteLine($"\t\t{column.Name}");
        //}

        //Console.WriteLine("Contacts");
        //props = context.GetModelProperties("Contacts");
        //foreach (var column in props)
        //{
        //    Console.WriteLine($"\t\t{column.Name}");
        //}


        foreach (var item in items)
        {
            Console.WriteLine(item.Name);
            try
            {
                var nav = item.NavigationProperties.ToList();
                if (nav.Count > 0)
                {
                    foreach (var info in nav)
                    {
                        Console.WriteLine($"\t{info.Name}");
                        List<SqlColumn> props = context.GetModelProperties(info.Name);
                        if (props.Any())
                        {
                            foreach (var column in props)
                            {
                                Console.WriteLine($"\t\t{column.Name}");
                            }
                        }
                        else
                        {
                            AnsiConsole.MarkupLine($"\t\t[white on red]NONE {info.Name}[/]");
                        }

                    }
                }
            }
            catch (Exception)
            {
                AnsiConsole.MarkupLine($"[white on red]{item.Name}[/]");

            }
        }
    }
}