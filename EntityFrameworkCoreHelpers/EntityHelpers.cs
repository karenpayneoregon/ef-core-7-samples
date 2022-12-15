using System.Reflection;
using EntityFrameworkCoreHelpers.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace EntityFrameworkCoreHelpers;
public class EntityHelpers
{
    public static List<NavigationItem> GetNavigationInformation<TEntity, TContext>(string connectionString)
        where TContext : DbContext
        where TEntity : class,
        IBaseEntity
    {
        var type = typeof(DbContextOptionsBuilder<>).MakeGenericType(typeof(TContext));
        DbContextOptionsBuilder builder = (DbContextOptionsBuilder)Activator.CreateInstance(type);
        builder!.UseSqlServer(connectionString);
        var context = (DbContext)Activator.CreateInstance(typeof(TContext), builder.Options);
        return context!.Model.GetEntityTypes()
            .Select(entityType => new NavigationItem(
                entityType.ClrType.Name,
                entityType.GetNavigations().Select(x => x.PropertyInfo)))
            .Where(x => !x.Name.Contains("`"))
            .ToList();
    }
}

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
