using System.Reflection;

namespace EntityFrameworkCoreHelpers.Models;

public class NavigationItem
{
    public string Name { get; }
    public IEnumerable<PropertyInfo> NavigationProperties { get; }

    public NavigationItem(string name, IEnumerable<PropertyInfo> navigationProperties)
    {
        Name = name;
        NavigationProperties = navigationProperties;
    }

    public override string ToString() => Name;

}