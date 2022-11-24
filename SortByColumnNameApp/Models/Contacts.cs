#nullable disable
using System.ComponentModel.DataAnnotations;

namespace SortByColumnNameApp.Models;

public partial class Contacts
{
    public Contacts()
    {
        Customers = new HashSet<Customers>();
    }
    [Key]
    public int ContactId { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public int? ContactTypeIdentifier { get; set; }
    public virtual ContactType ContactTypeNavigation { get; set; }
    public virtual ICollection<Customers> Customers { get; set; }
}