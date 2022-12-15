using EntityFrameworkCoreHelpers.Interfaces;
using EntityFrameworkCoreHelpers.Models;
using Microsoft.EntityFrameworkCore;

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
        var context = (DbContext)Activator.CreateInstance(typeof(TContext), builder.Options);
        builder!.UseSqlServer(context!.Database.GetConnectionString()!);
        return context!.Model.GetEntityTypes().Where(x => x.ClrType == typeof(TEntity))
            .Select(entityType => new NavigationItem(
                entityType.ClrType.Name,
                entityType.GetNavigations().Select(x => x.PropertyInfo)))
            .Where(x => !x.Name.Contains("`"))
            .ToList();
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
            .Where(x => !x.Name.Contains("`"))
            .ToList();
    }
}