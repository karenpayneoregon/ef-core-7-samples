using System.Reflection;

namespace SortByColumnNameApp.Models;

public class Details
{
    public string Name { get; }
    public IEnumerable<PropertyInfo> NavigationProperties { get; }

    public Details(string name, IEnumerable<PropertyInfo> navigationProperties)
    {
        Name = name;
        NavigationProperties = navigationProperties;
    }
}