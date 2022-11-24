using System.Text.Json;
using SortByColumnNameApp.Models;
using SortByColumnNameApp.Data;

namespace SortByColumnNameApp.Classes;

internal class Setup
{
    public static void CleanDatabase()
    {
        using var context = new NorthWindContext();
        context.Database.EnsureDeleted();
        context.Database.EnsureCreated();
    }

    public static void Populate()
    {
        var countryFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Json", "Countries.json");
        var contactFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Json", "Contacts.json");
        var customersFile = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Json", "Customers.json");

        using var context = new Data.NorthWindContext();
        List<Countries> countries =
            JsonSerializer.Deserialize<List<Countries>>(File.ReadAllText(countryFile));

        foreach (var country in countries!)
        {
            context.Countries.Add(new Countries() { Name = country.Name });
        }

        List<string> contactTypes = new()
        {
            "Accounting Manager",
            "Assistant Sales Agent",
            "Assistant Sales Representative",
            "Marketing Assistant",
            "Marketing Manager",
            "Order Administrator",
            "Owner",
            "Owner/Marketing Assistant",
            "Sales Agent",
            "Sales Associate",
            "Sales Manager",
            "Sales Representative",
            "Vice President, Sales\r\n"
        };

        foreach (var type in contactTypes)
        {
            context.ContactType.Add(new ContactType() { ContactTitle = type });
        }


        List<Contacts> contacts =
            JsonSerializer.Deserialize<List<Contacts>>(File.ReadAllText(contactFile));

        foreach (var contact in contacts!)
        {
            context.Contacts.Add(new Contacts()
            {
                FirstName = contact.FirstName, 
                LastName = contact.LastName, 
                ContactTypeIdentifier = contact.ContactTypeIdentifier
            });
        }
            
        context.SaveChanges();

        List<Customers> customers =
            JsonSerializer.Deserialize<List<Customers>>(File.ReadAllText(customersFile));

        foreach (var customer in customers!)
        {
            context.Customers.Add(new Customers()
            {
                ContactId = customer.ContactId,
                ContactTypeIdentifier = customer.ContactTypeIdentifier, 
                CountryIdentifier = customer.CountryIdentifier, 
                CompanyName = customer.CompanyName
            });
        }

        context.SaveChanges();

    }
}