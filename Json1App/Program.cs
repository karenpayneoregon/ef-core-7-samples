using Json1App.Classes;
using Json1App.Data;
using Json1App.Models;

namespace Json1App;

internal partial class Program
{
    static void Main(string[] args)
    {
        
        AddOnePerson();
        ReadOnePerson();
        Console.WriteLine();
        DataProviderOperations.ReadPersonAddress(1);

        ExitPrompt();
    }

    private static void ReadOnePerson()
    {
        using var context = new Context();
        var person = context.Person.FirstOrDefault();
        AnsiConsole.MarkupLine($"[white]{person.Id,-4}{person.FirstName, -10}{person.LastName, -10}{person.DateOfBirth:d}[/]");
        foreach (var address in person.Addresses)
        {
            AnsiConsole.MarkupLine($"\t[green]{address.Company,-10}{address.Street,-15}{address.City}[/]");
        }
    }

    private static void AddOnePerson()
    {
        using var context = new Context();
        context.Database.EnsureDeleted();
        context.Database.EnsureCreated();
        Person person = new Person()
        {
            Addresses = new List<Address>()
            {
                new Address() { Company = "Company1", City = "Wyndmoor", Street = "123 Apple St" },
                new Address() { Company = "Company2", City = "Portland", Street = "999 34th St" },
            },
            FirstName = "Karen",
            LastName = "Payne",
            DateOfBirth = new DateTime(1956, 9, 24)
        };

        context.Add(person);
        context.SaveChanges();
    }
}