using System.ComponentModel.DataAnnotations;

namespace SortByColumnNameApp.Models;

public partial class ContactType
{
    public ContactType()
    {
        Contacts = new HashSet<Contacts>();
        Customers = new HashSet<Customers>();
    }
    [Key]
    public int ContactTypeIdentifier { get; set; }
    public string ContactTitle { get; set; }

    public virtual ICollection<Contacts> Contacts { get; set; }
    public virtual ICollection<Customers> Customers { get; set; }

    public override string ToString() => ContactTitle;


}