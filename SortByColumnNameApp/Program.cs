using SortByColumnNameApp.Classes;
using SortByColumnNameApp.Models;
using SqlServerLibrary;


namespace SortByColumnNameApp;

internal partial class Program
{
    private const int Count = 50;

    static async Task Main(string[] args)
    {
        // Run these once
        //Setup.CleanDatabase();
        //Setup.Populate();

        if (!DataHelpers.LocalDbDatabaseExists("NorthWind2022Short"))
        {
            AnsiConsole.MarkupLine("[white on red]Database does not exists[/]");
            Console.ReadLine();
            return;
        }


        await DataOperations.SortCustomerOnCountryName();
        await DataOperations.SortCustomerOnContactLastName();
        await DataOperations.SortCustomerOnContactTitle();
        DataOperations.ConventionalOrderByOnNavigation();

        var ordering = OrderColumns.List().FirstOrDefault(o => o.PropertyName == PropertyName.Title);
        var data = await DataOperations.OrderByOnNavigation(ordering, Direction.Descending);
 
        //GetOperations.NavigationDetails();
        ExitPrompt();
    }

    private static void ModelInformation()
    {
        var modelNames = GetOperations.GetDatabaseModels();
        GetOperations.GetProperties(modelNames);
        GetOperations.NavigationDetails();
    }
}