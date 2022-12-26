namespace Json1App.Models;

public class Address
{
    public string Company { get; set; }
    public string Street { get; set; }
    public string City { get; set; }
    public override string ToString() => Company;
}