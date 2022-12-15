using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntityFrameworkCoreHelpers;
using TestingStuff.Data;

namespace TestingStuff.Classes;
internal class Operations
{
    public static List<string> GetDatabaseModels()
    {
        using var context = new Context();

        return context.GetModelNames().Where(x => !x.Name.Contains("`")).Select(type => type.Name).ToList();
    }
    public static void GetProperties(List<string> modelNames)
    {
        using var context = new Context();

        foreach (var name in modelNames)
        {
            var table = CreateTable(name);

            var properties = context.GetModelProperties(name);

            foreach (var property in properties)
            {
                table.AddRow(
                    property.Name,
                    property.IsPrimaryKey.ToString());
            }

            AnsiConsole.Write(table);
        }
    }

    public static void GetProperties(string name)
    {
        var table = CreateTable(name);

        using var context = new Context();
        var properties = context.GetModelProperties(name);

        foreach (var property in properties)
        {
            table.AddRow(
                property.Name,
                property.IsPrimaryKey.ToString());
        }

        AnsiConsole.Write(table);
    }

    public static void NavigationDetails()
    {
        using var context = new Context();
        var details = context.GetNavigationDetails();

        foreach (var detail in details)
        {
            Console.WriteLine(detail.Name);
            foreach (var info in detail.NavigationProperties)
            {
                Console.WriteLine($"   {info.Name}");
            }
        }
    }

    private static Table CreateTable(string modelName)
    {
        return new Table()
            .Title($"[cyan]{modelName}[/]")
            .RoundedBorder()
            .BorderColor(Color.LightSlateGrey)
            .AddColumn("[b]Column[/]")
            .AddColumn("[b]Primary[/]")
            .Alignment(Justify.Center);
    }
}
