using System.Collections;
using EntityFrameworkCoreHelpers.Interfaces;
using EntityFrameworkCoreHelpers.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Metadata;

namespace EntityFrameworkCoreHelpers;
public class EntityHelpers
{
    public static List<NavigationItem> NavigationInformationForModel<TEntity, TContext>()
        where TContext : DbContext
        where TEntity : class,
        IBaseEntity
    {
        
        var type = typeof(DbContextOptionsBuilder<>).MakeGenericType(typeof(TContext));
        DbContextOptionsBuilder builder = (DbContextOptionsBuilder)Activator.CreateInstance(type);
        var context = (DbContext)Activator.CreateInstance(typeof(TContext), builder!.Options);
        builder!.UseSqlServer(context!.Database.GetConnectionString()!);
        return context!.Model.GetEntityTypes().Where(x => x.ClrType == typeof(TEntity))
            .Select(entityType => new NavigationItem(
                entityType.ClrType.Name,
                entityType.GetNavigations().Select(nav => nav.PropertyInfo)))
            .Where(navigationItem => !navigationItem.Name.Contains("`"))
            .ToList();
    }

    public static string[] NavigationsForModelSimple<TEntity>()
    {
        return typeof(TEntity).GetProperties()
            .Where(propInfo => (
                typeof(IEnumerable).IsAssignableFrom(propInfo.PropertyType) && 
                propInfo.PropertyType != typeof(string)) || 
                               propInfo.PropertyType.Namespace == typeof(TEntity).Namespace)
            .Select(p => p.Name)
            .ToArray();
    }
    public static ModelNavigation NavigationsForModel<TEntity, TContext>()
        where TContext : DbContext
        where TEntity : class,
        IBaseEntity
    {

        
        DbContextOptionsBuilder builder = (DbContextOptionsBuilder)Activator.CreateInstance(
            typeof(DbContextOptionsBuilder<>).MakeGenericType(typeof(TContext)));

        var context = (DbContext)Activator.CreateInstance(typeof(TContext), builder!.Options);
        builder!.UseSqlServer(context!.Database.GetConnectionString()!);

        return context.Model.GetEntityTypes()
            .Select(entityType => new ModelNavigation(entityType.ClrType.Name, entityType.GetNavigations()
                .Select(navigation => navigation.PropertyInfo)))
            .FirstOrDefault(x => x.Name == typeof(TEntity).Name);
    }

    public static List<NavigationItem> GetNavigationInformation<TContext>(string connectionString) 
        where TContext : DbContext, 
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
            .Where(navigationItem => !navigationItem.Name.Contains("`"))
            .ToList();
    }

    /// <summary>
    /// WIP
    /// </summary>
    /// <typeparam name="TContext"></typeparam>
    /// <param name="connectionString"></param>
    public static void Get<TContext>(string connectionString)
        where TContext : DbContext
    {

        var type = typeof(DbContextOptionsBuilder<>).MakeGenericType(typeof(TContext));
        DbContextOptionsBuilder builder = (DbContextOptionsBuilder)Activator.CreateInstance(type);
        builder!.UseSqlServer(connectionString);
        var context = (DbContext)Activator.CreateInstance(typeof(TContext), builder.Options);

        //context.ChangeTracker.Entries().ToList().Navigations.Where(x => !((IReadOnlyNavigation)x.Metadata).IsOnDependent);

        
        

    }

}