using CreateAndPopulateSqlServerApp.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CreateAndPopulateSqlServerApp.Models;
using EntityFrameworkCoreHelpers;
using Microsoft.EntityFrameworkCore;

namespace CreateAndPopulateSqlServerApp.Classes
{
    internal class DataOperations
    {
        public static void CreateInitialData()
        {
            using var context = new Context();
            context.Database.EnsureDeleted();
            context.Database.EnsureCreated();

            List<ContactType> contactTypes = new List<ContactType>
            {
                new () { ContactTitle = "Accounting Manager" },
                new () { ContactTitle = "Owner" },
                new () { ContactTitle = "Sales Agent" },
                new () { ContactTitle = "Sales Manager" }
            };

            context.AddRange(contactTypes);
            context.SaveChanges();

            List<Contacts> contacts = new List<Contacts>
            {
                new () { ContactTypeIdentifier = 2, FirstName = "Karen", LastName = "Payne" },
                new () { ContactTypeIdentifier = 1, FirstName = "Mary", LastName = "Jones" },
                new () { ContactTypeIdentifier = 4, FirstName = "John", LastName = "Gallagher" },
                new () { ContactTypeIdentifier = 2, FirstName = "Kim", LastName = "Jones" },
            };

            context.AddRange(contacts);
            context.SaveChanges();
        }

        public static void Read()
        {
            using var context = new Context();
            var test = context.Provider();
            var owners = context.Contacts
                .Include(c => c.ContactTypeNavigation)
                .Where(x => x.ContactTypeIdentifier.Value == 2)
                .ToList();


            var allContacts = context.Contacts.Include(c => c.ContactTypeNavigation).ToList();

            AnsiConsole.MarkupLine("[yellow]All contacts[/]");
            foreach (var contact in allContacts)
            {
                Console.WriteLine($"{contact.ContactId, -3}{contact.ContactTypeNavigation.ContactTitle, -22}{contact.FirstName, -10}{contact.LastName}");
            }

            Console.WriteLine();
            AnsiConsole.MarkupLine("[yellow]Contacts who are owners[/]");

            foreach (var owner in owners)
            {
                Console.WriteLine($"{owner.ContactId, -3}{owner.FirstName,-10}{owner.LastName}");
            }
        }
    }
}
