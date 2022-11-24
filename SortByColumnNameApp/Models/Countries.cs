using System.ComponentModel.DataAnnotations;

namespace SortByColumnNameApp.Models;

public partial class Countries
{
    public Countries()
    {
        Customers = new HashSet<Customers>();
    }
    [Key]
    public int CountryIdentifier { get; set; }
    public string Name { get; set; }

    public virtual ICollection<Customers> Customers { get; set; }

}