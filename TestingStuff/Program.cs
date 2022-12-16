using ConfigurationLibrary.Classes;
using EntityFrameworkCoreHelpers;
using EntityFrameworkCoreHelpers.Models;
using Microsoft.EntityFrameworkCore;
using TestingStuff.Classes;
using TestingStuff.Data;
using TestingStuff.Models;


namespace TestingStuff;
/// <summary>
/// https://stackoverflow.com/a/54968688/5509738
/// </summary>
internal partial class Program
{
    static void Main(string[] args)
    {
        AnsiConsole.MarkupLine("[yellow]Hello[/]");

        //var test = EntityHelpers.NavigationsForModelSimple<Customers>();
        //Generic1();

        using var context = new Context();
        EntityHelpers.Get<Context>(context.Database.GetConnectionString());

        Console.ReadLine();
    }

    private static void Second()
    {
        using var context = new Context();
        //var customers = context.Customers.Include(x => x.Contact).ToList();
        var items = EntityHelpers.NavigationsForModel<Customers, Context>();
        if (items is not null)
        {
            foreach (var info in items.NavigationProperties)
            {
                Console.WriteLine($"{info.Name}");
            }
        }
    }

    private static void First()
    {
        using var context = new Context();
        var modelData = context.Model.GetEntityTypes()
            .Select(t => new
            {
                t.ClrType.Name,
                NavigationProperties = t.GetNavigations().Select(x => x.PropertyInfo)
            }).FirstOrDefault(x => x.Name == "Customers");

        foreach (var info in modelData.NavigationProperties)
        {
            Console.WriteLine($"{info.Name}");
        }
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
        var customers = context.Customers.Include(x => x.Contact).ToList();
        var items = EntityHelpers.NavigationInformationForModel<Customers, Context>();

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