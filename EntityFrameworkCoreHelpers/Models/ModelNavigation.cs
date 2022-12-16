using System.Reflection;

namespace EntityFrameworkCoreHelpers.Models;

public class ModelNavigation
{
    public string Name { get; }
    public IEnumerable<PropertyInfo> NavigationProperties { get; }

    public ModelNavigation(string name, IEnumerable<PropertyInfo> navigationProperties)
    {
        Name = name;
        NavigationProperties = navigationProperties;
    }

    public override string ToString() => Name;

}