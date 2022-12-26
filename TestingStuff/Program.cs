using System.Collections;
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
    static async Task Main(string[] args)
    {
        await Task.Delay(0);
        AnsiConsole.MarkupLine("[yellow]Hello[/]");

        //var test = EntityHelpers.NavigationsForModelSimple<Customers>();
        //Generic1();

        http://google.com

        //(var firstName, var lastName) = ("Karen", "Payne"); 
        //var fullName = (firstName, lastName).Concatenate(); 
        //Console.WriteLine(fullName);

        //Second();
        //Generic1();
        
        //await IsLoaded();
        Karen1();
        //using var context = new Context();

        //var contact = context.Contacts
        //    //.Include(c => c.ContactTypeNavigation)
        //    .Include(c => c.ContactDevices)
        //    .ThenInclude(x => x.PhoneTypeNavigation)
        //    .FirstOrDefault(c => c.FullName == "Sven Ottlieb");



        //Console.WriteLine($"{contact!.ContactId,-3}{contact.ContactDevices.First().PhoneNumber,-16}" + 
        //                  $"{contact.ContactDevices.First().PhoneTypeNavigation.PhoneTypeDescription}");
        
        //EntityHelpers.Get<Contacts,Context>(context.Database.GetConnectionString());
        //var oneToManyRelations = context.Model.GetNavigationProperties<Contacts>(RelationshipMultiplicity.Many);
        
        //context.Model.GetNavigationProperties<Customers>();
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

    private static async Task IsLoaded()
    {
        using var context = new Context();
        var subject = context.Customers.FirstOrDefault(s => s.CustomerIdentifier == 1);
        await context.Entry(subject)
            .Collection(s => s.Orders)
            .LoadAsync();

    }

    private static void Karen1()
    {
        using var context = new Context();
        //var test = context.Customers.Include(context, new string[] { "Orders" }).ToList();
        var customers = context.Customers.Include(o => o.Orders).FirstOrDefault();
        var items = EntityHelpers.NavigationInformationForModel<Customers, Context>();
        foreach (var navigationItem in items)
        {
            foreach (var property in navigationItem.NavigationProperties)
            {
                //try
                //{
                //    Console.WriteLine($"{property.Name} -> {context.Entry(customers).Collection(property.Name).IsLoaded} => {property.IsCollectible}");
                //}
                //catch (Exception exception)
                //{

                //    Console.WriteLine(exception.Message);
                //}
                if (property.IsCollectible)
                {
                    //Console.WriteLine(property.Name);
                }
                else
                {
                    //Console.WriteLine($"{property.Name}-> {context.Entry(customers).Reference(property.Name).IsLoaded}");
                    //Console.WriteLine($"\t{property.Name}");
                }

                Console.WriteLine($"{property.Name} - {property is ICollection}");

            }
        }
        var test = context.Entry(customers).Collection(x => x.Orders).IsLoaded;
        //var test1 = context.Entry(customers).Collection("Orders").IsLoaded;
    }
    private static void Generic1()
    {
        using var context = new Context();
        //var customers = context.Customers.Include(x => x.Contact).ToList();
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