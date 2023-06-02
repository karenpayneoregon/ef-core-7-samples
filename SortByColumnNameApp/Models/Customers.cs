
namespace SortByColumnNameApp.Models;

public partial class Customers
{

    public int CustomerIdentifier { get; set; }
    public string CompanyName { get; set; }
    public int? ContactId { get; set; }
    public int? CountryIdentifier { get; set; }
    public int? ContactTypeIdentifier { get; set; }

    public virtual Contacts Contact { get; set; }
    public virtual ContactType ContactTypeNavigation { get; set; }
    public virtual Countries CountryNavigation { get; set; }
    public override string ToString() => CompanyName;


}