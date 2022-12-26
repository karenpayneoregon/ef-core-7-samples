using System.Diagnostics;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Infrastructure;
using EntityFrameworkCoreHelpers.Models;

namespace EntityFrameworkCoreHelpers;

public static class EntityExtensions
{
    /// <summary>
    /// Test connection with exception handling
    /// </summary>
    /// <param name="context">active DbContext</param>
    /// <returns></returns>
    [DebuggerStepThrough]
    public static async Task<(bool success, Exception exception)> CanConnectAsync(this DbContext context)
    {
        try
        {
            var result = await Task.Run(async () => await context.Database.CanConnectAsync());
            return (result, null);
        }
        catch (Exception e)
        {
            return (false, e);
        }
    }

    /// <summary>
    /// Get each type of model in a <see cref="DbContext"/>
    /// </summary>
    /// <param name="context">active DbContext</param>
    /// <returns></returns>
    /// <exception cref="ArgumentNullException"></exception>
    public static List<Type> GetModelNames(this DbContext context)
    {
        if (context == null) throw new ArgumentNullException(nameof(context));
        return context.Model.GetEntityTypes().Select(et => et.ClrType).ToList();
    }

    public static T GetAttributeFrom<T>(this object instance, string propertyName) where T : Attribute
    {
        var attrType = typeof(T);
        var property = instance.GetType().GetProperty(propertyName);
        return (T)property!.GetCustomAttributes(attrType, false).FirstOrDefault();
    }

    private static Type GetEntityType(DbContext context, string modelName) =>
        context.Model.GetEntityTypes()
            .Select(eType => eType.ClrType)
            .FirstOrDefault(type => type.Name == modelName);


    /// <summary>
    /// Get details for a model
    /// </summary>
    /// <param name="context">Active dbContext</param>
    /// <param name="modelName">Model name in context</param>
    /// <returns>List&lt;SqlColumn&gt;</returns>
    /// <remarks>
    /// More information can be added as needed
    /// </remarks>
    public static List<SqlColumn> GetModelProperties(this DbContext context, string modelName)
    {
        if (context is null) throw new ArgumentNullException(nameof(context));

        var entityType = GetEntityType(context, modelName);

        if (entityType is null)
        {
            return Enumerable.Empty<SqlColumn>().ToList();
        }

        var list = new List<SqlColumn>();

        IEnumerable<IProperty> properties = context.Model
            .FindEntityType(entityType)!
            .GetProperties();

        foreach (IProperty itemProperty in properties)
        {
            SqlColumn sqlColumn = new SqlColumn
            {
                Name = itemProperty.Name,
                IsPrimaryKey = itemProperty.IsKey(),
                IsForeignKey = itemProperty.IsForeignKey(),
                IsNullable = itemProperty.IsColumnNullable()
            };


            list.Add(sqlColumn);

        }

        return list;

    }



    /// <summary>
    /// Get properties for a model
    /// </summary>
    /// <param name="context">active DbContext</param>
    /// <param name="modelName"></param>
    /// <returns></returns>
    /// <exception cref="ArgumentNullException"></exception>
    /// <exception cref="InvalidOperationException"></exception>
    public static List<string> GetModelPropertyNames(this DbContext context, string modelName)
    {

        if (context == null) throw new ArgumentNullException(nameof(context));

        var entityType = GetEntityType(context, modelName);

        var list = new List<string>();

        IEnumerable<IProperty> properties = 
            context.Model.FindEntityType(entityType ?? throw new InvalidOperationException())!.GetProperties();


        foreach (IProperty itemProperty in properties)
        {
            list.Add(itemProperty.Name);
        }

        return list;

    }

    /// <summary>
    /// Get comments for properties of a model
    /// </summary>
    /// <param name="context">active DbContext</param>
    /// <param name="modelName">Model name in context</param>
    /// <remarks>
    /// Example where the model name is Book
    /// var comments = context.Comments(nameof(Book));
    /// Or use <see cref="GetModelNames"/>
    /// </remarks>
    public static IEnumerable<ModelComment> Comments(this DbContext context, string modelName)
    {

        if (context == null) throw new ArgumentNullException(nameof(context));

        var commentList = new List<ModelComment>();

        IEnumerable<IEntityType> entityTypes = context.GetService<IDesignTimeModel>()
            .Model.GetEntityTypes()
            .Where(x => x.ClrType.Name == modelName);


        foreach (IEntityType entityType in entityTypes)
        {
            IEnumerable<IProperty> properties = entityType.GetProperties();
            commentList.AddRange(from property in properties
                let comment = property.GetAnnotations().FirstOrDefault(x => x.Name == RelationalAnnotationNames.Comment)
                select comment is not null
                    ? new ModelComment() { Name = property.Name, Comment = comment.Value!.ToString() }
                    : new ModelComment() { Name = property.Name, Comment = null });
        }

        return commentList;

    }

    /// <summary>
    /// Get Model navigations
    /// </summary>
    public static List<Details> GetNavigationDetails(this DbContext context) =>
        context.Model.GetEntityTypes()
            .Select(entityType => new Details(
                entityType.ClrType.Name,
                entityType.GetNavigations()
                    .Select(navigation => navigation.PropertyInfo)))
            .ToList();


}