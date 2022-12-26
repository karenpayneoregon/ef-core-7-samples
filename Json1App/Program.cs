using Json1App.Data;
using Json1App.Models;

namespace Json1App;

internal partial class Program
{
    static void Main(string[] args)
    {

        using var context = new Context();
        var person = context.Person.FirstOrDefault();
        AnsiConsole.MarkupLine("[yellow]Hello[/]");
        Console.ReadLine();
    }

    private static void AddOnePerson()
    {
        using var context = new Context();
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