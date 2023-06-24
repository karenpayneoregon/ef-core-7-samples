using System.Linq.Expressions;
using SortByColumnNameApp.Models;

namespace SortByColumnNameApp.Classes;

/// <summary>
/// Various methods for dynamic ordering
/// Pick what you like and when doing so consider maintenance as when using Expression for instance
/// may break in future releases.
/// </summary>
public static class OrderingHelpers
{
    /// <summary>
    /// Provides sorting by string using a key specified in <see cref="key"/> and if the key is not found the default is <see cref="Customers.CompanyName"/>
    /// </summary>
    /// <param name="query"><see cref="Customers"/> query</param>
    /// <param name="key">key to sort by</param>
    /// <param name="direction">direction to sort by</param>
    /// <returns>query with order by</returns>
    /// <remarks>Fragile in that if a property name changes this will break</remarks>
    public static IQueryable<Customers> OrderByString(this IQueryable<Customers> query, string key, Direction direction = Direction.Ascending)
    {
        Expression<Func<Customers, object>> exp = key switch
        {
            "LastName" => customer => customer.Contact.LastName,
            "FirstName" => customer => customer.Contact.FirstName,
            "CountryName" => customer => customer.CountryNavigation.Name,
            "Title" => customer => customer.ContactTypeNavigation.ContactTitle,
            _ => customer => customer.CompanyName
        };

        return direction == Direction.Ascending ? query.OrderBy(exp) : query.OrderByDescending(exp);

    }

    /// <summary>
    /// Provides sorting by <see cref="PropertyName"/> using a key specified in <see cref="key"/> and if the key is not found the default is <see cref="Customers.CompanyName"/>
    /// <para>By default the sort order is <see cref="Direction.Ascending"/></para> 
    /// </summary>
    /// <param name="query"><see cref="Customers"/> query</param>
    /// <param name="key">key to sort by</param>
    /// <param name="direction">direction to sort by</param>
    /// <returns>query with order by</returns>
    /// <remarks>A little better than <see cref="OrderByString"/> but can still break if the model changes</remarks>
    public static IQueryable<Customers> OrderByEnum(this IQueryable<Customers> query, PropertyName key, Direction 
            direction = Direction.Ascending)
    {
        Expression<Func<Customers, object>> exp = key switch
        {
            PropertyName.LastName => customer => customer.Contact.LastName,
            PropertyName.FirstName => customer => customer.Contact.FirstName,
            PropertyName.CountryName => customer => customer.CountryNavigation.Name,
            PropertyName.Title => customer => customer.ContactTypeNavigation.ContactTitle,
            _ => customer => customer.CompanyName
        };

        return direction == Direction.Ascending ? query.OrderBy(exp) : query.OrderByDescending(exp);

    }

    /// <summary>
    /// Provides sorting by string using a key specified in <see cref="key"/> and if the key is not found the default is <see cref="Contacts.LastName"/>. 
    /// <para>By default the sort order is <see cref="Direction.Ascending"/></para> 
    /// </summary>
    /// <param name="query"><see cref="Contacts"/> query</param>
    /// <param name="key">key to sort by</param>
    /// <param name="direction">direction to sort by</param>
    /// <returns>query with order by</returns>
    public static IQueryable<Contacts> OrderByString(this IQueryable<Contacts> query, string key, Direction direction = Direction.Ascending)
    {
        Expression<Func<Contacts, object>> exp = key switch
        {
            "LastName" => contact => contact.LastName,
            "FirstName" => contact => contact.FirstName,
            "Title" => contact => contact.ContactTypeNavigation.ContactTitle,
            _ => contact => contact.LastName
        };

        return direction == Direction.Ascending ? query.OrderBy(exp) : query.OrderByDescending(exp);

    }

    /// <summary>
    /// Generic top level order by property name
    /// </summary>
    /// <typeparam name="T">Model</typeparam>
    /// <param name="list">List of <see cref="T"/></param>
    /// <param name="propertyName">Column/property to order or</param>
    /// <param name="sortDirection">Direction of ordering</param>
    /// <remarks>
    /// Intended to be used with methods in EntityExtensions class
    /// </remarks>
    public static List<T> OrderByPropertyName<T>(this List<T> list, string propertyName, Direction sortDirection)
    {

        ParameterExpression param = Expression.Parameter(typeof(T), "item");

        Expression<Func<T, object>> sortExpression = 
            Expression.Lambda<Func<T, object>>(
                Expression.Convert(Expression.Property(param, propertyName), typeof(object)), 
                param);

        list = sortDirection switch
        {
            Direction.Ascending => list.AsQueryable().OrderBy(sortExpression).ToList(),
            _ => list.AsQueryable().OrderByDescending(sortExpression).ToList()
        };

        return list;

    }
    /// <summary>
    /// Generic method to sort by one or more columns
    /// </summary>
    /// <typeparam name="T">Model</typeparam>
    /// <param name="query">query</param>
    /// <param name="propertyNames">property names best obtained from methods in EntityExtensions class</param>
    /// <param name="sortOrder">ascending or descending</param>
    public static IOrderedQueryable<T> SortColumn<T>(this IQueryable<T> query, string[] propertyNames, Direction sortOrder = Direction.Ascending)
    {

        if (propertyNames.Length == 0)
        {
            throw new InvalidOperationException();
        }

        var param = Expression.Parameter(typeof(T), string.Empty);
        var expressionPropField = Expression.PropertyOrField(param, propertyNames[0]);

        var sortExpression = Expression.Lambda(expressionPropField, param);

        MethodCallExpression orderByCall =
            Expression.Call(typeof(Queryable),
                "OrderBy" + (sortOrder == Direction.Descending ? "Descending" : string.Empty),
                new[] { typeof(T), expressionPropField.Type },
                query.Expression, Expression.Quote(sortExpression));

        if (propertyNames.Length > 1)
        {
            for (int index = 1; index < propertyNames.Length; index++)
            {
                var item = propertyNames[index];
                param = Expression.Parameter(typeof(T), string.Empty);
                expressionPropField = Expression.PropertyOrField(param, item);

                sortExpression = Expression.Lambda(expressionPropField, param);

                orderByCall = Expression.Call(typeof(Queryable),
                    "ThenBy" + (((sortOrder == Direction.Descending) ? "Descending" : string.Empty)),
                    new[] { typeof(T), expressionPropField.Type },
                    orderByCall, Expression.Quote(sortExpression));
            }
        }


        return (IOrderedQueryable<T>)query.Provider.CreateQuery<T>(orderByCall);

    }
    
}

public class OrderColumn
{
    /// <summary>
    /// Property name for ordering
    /// </summary>
    public PropertyName PropertyName { get; set; }
    /// <summary>
    /// Column name to use for ordering which can contain a dot for navigations
    /// </summary>
    public string Column { get; set; }
    public override string ToString() => PropertyName.ToString();

}

public class OrderColumns
{
    public static List<OrderColumn> List() =>
        new()
        {
            new OrderColumn() { PropertyName = PropertyName.FirstName, Column = "Contact.FirstName" },
            new OrderColumn() { PropertyName = PropertyName.LastName, Column = "Contact.LastName" },
            new OrderColumn() { PropertyName = PropertyName.Title, Column = "ContactTypeNavigation.ContactTitle" },
            new OrderColumn() { PropertyName = PropertyName.CountryName, Column = "CountryNavigation.Name" }
        };
}