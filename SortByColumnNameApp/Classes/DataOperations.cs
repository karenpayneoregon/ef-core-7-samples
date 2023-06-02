using Microsoft.EntityFrameworkCore;
using SortByColumnNameApp.Data;
using SortByColumnNameApp.Models;

namespace SortByColumnNameApp.Classes;

/// <summary>
/// Dynamic ordering
/// Some methods are for the write up and not used but have been tested.
/// </summary>
internal class DataOperations
{
    private const int Count = 50;

    /// <summary>
    /// Hard coded order by
    /// </summary>
    public static void ConventionalOrderByOnNavigation()
    {
        using var context = new NorthWindContext();

        var customers = context.Customers
            
            .Include(c => c.Contact)
            .Include(c => c.ContactTypeNavigation)
            .OrderBy(c => c.ContactTypeNavigation.ContactTitle)
            .ToList();
    }
    public static async Task<List<Customers>> OrderByOnNavigation(OrderColumn ordering, Direction direction)
    {
        await using var context = new NorthWindContext();

        if (direction == Direction.Ascending)
        {
            return await context.Customers
                .Include(c => c.CountryNavigation)
                .Include(c => c.Contact)
                .Include(c => c.ContactTypeNavigation)
                .OrderByColumn(ordering.Column)
                .ToListAsync();
        }
        else
        {
            return await context.Customers
                .Include(c => c.CountryNavigation)
                .Include(c => c.Contact)
                .Include(c => c.ContactTypeNavigation)
                .OrderByColumnDescending(ordering.Column)
                .ToListAsync();
        }

    }

    /// <summary>
    /// Order by using an enum
    /// </summary>
    public static async Task SortCustomerOnContactTitle()
    {
        await using var context = new NorthWindContext();

        List<Customers> customers = await context.Customers
            .Include(c => c.Contact)
            .Include(c => c.ContactTypeNavigation)
            .OrderByEnum(PropertyName.Title, Direction.Descending)
            .ToListAsync();

        var table = CreateTableForContactTitle();

        for (int index = 0; index < Count; index++)
        {
            table.AddRow(
                customers[index].CompanyName, 
                customers[index].ContactTypeNavigation.ContactTitle, 
                customers[index].Contact.LastName);
        }

        AnsiConsole.Write(table);

    }

    /// <summary>
    /// Order by using an if statement on contact first or last name
    /// </summary>
    /// <param name="propertyName"></param>
    /// <returns></returns>
    public static async Task<List<Customers>> SortByPropertyFirstAttempt(string propertyName)
    {
        await using var context = new NorthWindContext();

        var customers = context.Customers
            .Include(c => c.Contact);

        return await (propertyName == "FirstName" ? 
            customers.OrderBy(c => c.Contact.FirstName).ToListAsync() : 
            customers.OrderBy(c => c.Contact.LastName).ToListAsync());
    }

    public static async Task<List<Customers>> SortByPropertySecondAttempt(string propertyName)
    {
        await using var context = new NorthWindContext();

        return await context.Customers
            .Include(c => c.CountryNavigation)
            .OrderByString(propertyName, Direction.Ascending)
            .ToListAsync();
    }

    /// <summary>
    /// Order by using an enum
    /// See also <see cref="SortCustomerOnCountryName1"/>
    /// </summary>
    public static async Task SortCustomerOnCountryName()
    {
        await using var context = new NorthWindContext();

        List<Customers> customers = await context.Customers
            .Include(c => c.CountryNavigation)
            .OrderByEnum(PropertyName.CountryName, Direction.Ascending)
            .ToListAsync();


        var table = CreateTableForCountries();

        for (int index = 0; index < Count; index++)
        {
            table.AddRow(customers[index].CompanyName, customers[index].CountryNavigation.Name);
        }

        AnsiConsole.Write(table);

    }

    public static async Task SortCustomerOnCountryName1()
    {
        await using var context = new NorthWindContext();

        List<Customers> customers = await context.Customers
            .Include(c => c.CountryNavigation)
            .SortColumn(new []{"CompanyName"}, Direction.Ascending)
            .ToListAsync();


        var table = CreateTableForCountries();

        for (int index = 0; index < Count; index++)
        {
            table.AddRow(customers[index].CompanyName, customers[index].CountryNavigation.Name);
        }

        AnsiConsole.Write(table);

    }
    /// <summary>
    /// Order by using an enum
    /// </summary>
    public static async Task SortCustomerOnContactLastName()
    {
        await using var context = new NorthWindContext();

        List<Customers> customers = await context.Customers
            .Include(c => c.Contact)
            .OrderByEnum(PropertyName.LastName, Direction.Descending)
            .ToListAsync();

        var table = CreateTableForContacts();

        for (int index = 0; index < Count; index++)
        {
            table.AddRow(customers[index].CompanyName, customers[index].Contact.LastName);
        }

        AnsiConsole.Write(table);

    }

    #region Screen helpers

    private static Table CreateTableForCountries()
    {
        return new Table()
            .RoundedBorder()
            .BorderColor(Color.LightSlateGrey)
            .AddColumn("[b]Customer[/]")
            .AddColumn("[b]Country[/]")
            .Title("[cyan]By country[/]")
            .Alignment(Justify.Center);
    }

    private static Table CreateTableForContacts()
    {
        return new Table()
            .RoundedBorder()
            .BorderColor(Color.LightSlateGrey)
            .AddColumn("[b]Customer[/]")
            .AddColumn("[b]Contact last name[/]")
            .Title("[cyan]By last name[/]")
            .Alignment(Justify.Center);
    }
    private static Table CreateTableForContactTitle()
    {
        return new Table()
            .RoundedBorder()
            .BorderColor(Color.LightSlateGrey)
            .AddColumn("[b]Customer[/]")
            .AddColumn("[b]Title[/]")
            .AddColumn("[b]Contact last name[/]")
            .Title("[cyan]By title[/]")
            .Alignment(Justify.Center);
    } 
    #endregion
}