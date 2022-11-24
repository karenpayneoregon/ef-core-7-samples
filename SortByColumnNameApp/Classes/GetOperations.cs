using SortByColumnNameApp.Data;

namespace SortByColumnNameApp.Classes;

internal class GetOperations
{
    public static List<string> GetDatabaseModels()
    {
        using var context = new NorthWindContext();

        return context.GetModelNames().Select(type => type.Name).ToList();
    }

    public static void GetProperties(List<string> modelNames)
    {
        using var context = new NorthWindContext();
            
        foreach (var name in modelNames)
        {
            var table = CreateTable(name);
                
            var properties = context.GetModelProperties(name);

            foreach (var property in properties)
            {
                table.AddRow(
                    property.Name, 
                    property.IsPrimaryKey.ToYesNo());
            }

            AnsiConsole.Write(table);
        }
    }

    public static void NavigationDetails()
    {
        using var context = new NorthWindContext();
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