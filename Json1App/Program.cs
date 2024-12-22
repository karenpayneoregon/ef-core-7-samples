using System.Diagnostics.CodeAnalysis;
using Json1App.Classes;
using Json1App.Data;
using Json1App.Models;

namespace Json1App;

[SuppressMessage("ReSharper", "ConvertTypeCheckToNullCheck")]
internal partial class Program
{
    static void Main(string[] args)
    {
        
        //AddOnePerson();
        //ReadOnePerson();
        Grouped();
        Console.WriteLine();

        ExitPrompt();
    }

    private static void ReadOnePerson()
    {
        using var context = new Context();
        var person = context.Person.FirstOrDefault();
        if (person is Person)
        {
            AnsiConsole.MarkupLine($"[white]{person.Id,-4}{person.FirstName,-10}{person.LastName,-10}{person.DateOfBirth:d}[/]");
            foreach (var address in person.Addresses)
            {
                AnsiConsole.MarkupLine($"\t[green]{address.AddressType,-10}{address.Street,-15}{address.City}[/]");
            }
        }

        var firstPerson = context.Person.FirstOrDefault(x => x.Id == 1);
        var portlandAddress = firstPerson!.Addresses.FirstOrDefault(x => x.City == "Portland");
        AnsiConsole.MarkupLine($"[white]{firstPerson.LastName,-8}{portlandAddress!.AddressType}[/]");
        
    }

    /// <summary>
    /// Groups a collection of people by their last names, orders the groups alphabetically,
    /// and displays each group along with the associated people and their addresses.
    /// </summary>
    /// <remarks>
    /// This method retrieves all people from the database, groups them by their last names,
    /// and iterates through each group to display the group key (last name) and the details
    /// of each person in the group, including their addresses.
    /// </remarks>
    public static void Grouped()
    {
        using var context = new Context();
        var people = context.Person.ToList();

        var groupedByLastName = people
            .GroupBy(person => person.LastName)
            .OrderBy(group => group.Key);

        foreach (var group in groupedByLastName)
        {
            AnsiConsole.MarkupLine($"[cyan]{group.Key}[/]");
            foreach (var person in group)
            {
                Console.WriteLine($"  - {person}");
                foreach (var address in person.Addresses)
                {
                    AnsiConsole.MarkupLine(address.AddressType == "Home"
                        ? $"    * AddressType: [yellow]{address.AddressType}[/], Street: {address.Street}, City: {address.City}"
                        : $"    * AddressType: [magenta2]{address.AddressType}[/], Street: {address.Street}, City: {address.City}");
                }
            }
        }
    }

    /// <summary>
    /// Adds a single person with associated addresses to the database, modifies one of the addresses,
    /// and saves the changes.
    /// </summary>
    /// <remarks>
    /// This method ensures the database is recreated, adds a new person with multiple addresses,
    /// updates the city of the first address, and saves the changes back to the database.
    /// </remarks>
    private static void AddOnePerson()
    {
        using var context = new Context();
        
        context.Database.EnsureDeleted();
        context.Database.EnsureCreated();

        Person person = new Person()
        {
            Addresses = new List<Address>()
            {
                new()
                {
                    AddressType = "Company1", 
                    City = "Wyndmoor", 
                    Street = "123 Apple St"
                },
                new()
                {
                    AddressType = "Company2", 
                    City = "Portland", 
                    Street = "999 34th St"
                },
            },
            FirstName = "Karen",
            LastName = "Payne",
            DateOfBirth = new DateTime(1956, 9, 24)
        };

        context.Add(person);
        context.SaveChanges();

        context.Person.FirstOrDefault()!
            .Addresses
            .FirstOrDefault()
            !.City = "Ambler";

        context.SaveChanges();

    }
}