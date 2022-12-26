using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using System.Reflection;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace EntityFrameworkCoreHelpers;

/// <summary>
/// DO NOT USE - working on EF6 to EF Core 7
/// </summary>
public static class ModelExtensions
{
    /// <summary>
    /// Extension method used to get from the entity all navigation properties by multiplicity
    /// </summary>
    /// <typeparam name="TEntity">Entity from where the navigation properties are taken</typeparam>
    /// <param name="model">Context Model</param>
    /// <param name="multiplicity">Type of multiplicity to use</param>
    /// <returns>List of PropertyInfo of Navigation Properties</returns>
    [Obsolete]
    public static IEnumerable<PropertyInfo> GetNavigationProperties<TEntity>(this IModel model, RelationshipMultiplicity multiplicity)
    {
        var navigations = model.GetEntityTypes().FirstOrDefault(et => et.ClrType == typeof(TEntity))?.GetNavigations();
        //var properties = new List<PropertyInfo>();
        
        switch (multiplicity)
        {
            //case RelationshipMultiplicity.Many || RelationshipMultiplicity.ZeroOrOne:
            //    return navigations?
            //        .Select(nav => nav.PropertyInfo);
            case RelationshipMultiplicity.Many:
                return navigations?
                    .Where(nav => nav.IsCollection())
                    .Select(nav => nav.PropertyInfo);
            case RelationshipMultiplicity.One:
                return navigations?
                    .Where(nav => !nav.IsCollection() && nav.ForeignKey.IsRequired)
                    .Select(nav => nav.PropertyInfo);
            case RelationshipMultiplicity.ZeroOrOne:
                return navigations?
                    .Where(nav => !nav.IsCollection())
                    .Select(nav => nav.PropertyInfo);
            default:
                return null;
        }


    }

    public static void GetNavigationProperties<TEntity>(this IModel model)
    {
        var navigations = model.GetEntityTypes().FirstOrDefault(et => et.ClrType == typeof(TEntity))?.GetNavigations();
        var sss = model.GetEntityTypes().FirstOrDefault(et => et.ClrType == typeof(TEntity))!
            .GetPropertiesAndNavigations();

        if (navigations is null)
        {
            return;
        }


        foreach (var navigation in navigations!)
        {
            IForeignKey key = navigation.ForeignKey;

            if (key.PrincipalKey.DeclaringEntityType.ClrType.Name == typeof(TEntity).Name)
            {
                continue;
            }

            Console.WriteLine($"\t{typeof(TEntity).Name}\t{key.PrincipalKey.DeclaringEntityType.ClrType.Name}");
            Console.WriteLine($"{key.PrincipalKey.DeclaringEntityType.ClrType.Name} => {navigation.IsCollection}");
            Console.WriteLine();
        }


    }
}


public enum RelationshipMultiplicity
{
    Many = 2,
    One = 1,
    ZeroOrOne = 0
}