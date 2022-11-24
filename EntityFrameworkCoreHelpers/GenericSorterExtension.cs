using System.Collections;
using System.Linq.Expressions;
using System.Reflection;

namespace EntityFrameworkCoreHelpers
{

	public static class GenericSorterExtension
	{
		/// <summary>
		/// Specifies the sort direction against a property
		/// </summary>
		public enum SortDirection
		{
			/// <summary>
			/// Sort ascending.
			/// </summary>
			Ascending,
			/// <summary>
			/// Sort descending.
			/// </summary>
			Descending
		}


		public static List<T> OrderByPropertyName<T>(this List<T> list, string propertyName, SortDirection sortDirection)
		{

			ParameterExpression param = Expression.Parameter(typeof(T), "item");

			Expression<Func<T, object>> sortExpression = Expression.Lambda<Func<T, object>>(Expression.Convert(Expression.Property(param, propertyName), typeof(object)), param);

            list = sortDirection switch
            {
                SortDirection.Ascending => list.AsQueryable().OrderBy(sortExpression).ToList(),
                _ => list.AsQueryable().OrderByDescending(sortExpression).ToList()
            };

            return list;

		}
		public static IOrderedQueryable<T> SortColumn<T>(this IQueryable<T> source, string[] propertyNames, SortDirection sortOrder)
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
                    "OrderBy" + (((sortOrder == SortDirection.Descending) ? "Descending" : string.Empty)), 
                    new[] { typeof(T), expressionPropField.Type }, 
                    source.Expression, Expression.Quote(sortExpression));

			if (propertyNames.Length > 1)
			{
				for (int index = 1; index < propertyNames.Length; index++)
				{
					var item = propertyNames[index];
					param = Expression.Parameter(typeof(T), string.Empty);
					expressionPropField = Expression.PropertyOrField(param, item);

					sortExpression = Expression.Lambda(expressionPropField, param);

					orderByCall = Expression.Call(typeof(Queryable), 
                        "ThenBy" + (((sortOrder == SortDirection.Descending) ? "Descending" : string.Empty)),
                        new[] { typeof(T), expressionPropField.Type }, 
                        orderByCall, Expression.Quote(sortExpression));
				}
			}


			return (IOrderedQueryable<T>)source.Provider.CreateQuery<T>(orderByCall);

		}
        public static IOrderedQueryable<T> SortColumn<T>(this IQueryable<T> source, string propertyName, SortDirection sortOrder = SortDirection.Ascending)
        {
            var param = Expression.Parameter(typeof(T), string.Empty);
            var expressionPropField = Expression.PropertyOrField(param, propertyName);

            var sortExpression = Expression.Lambda(expressionPropField, param);

            MethodCallExpression orderByCall =
                Expression.Call(typeof(Queryable),
                    "OrderBy" + (((sortOrder == SortDirection.Descending) ? "Descending" : string.Empty)),
                    new[] { typeof(T), expressionPropField.Type },
                    source.Expression, Expression.Quote(sortExpression));

            return (IOrderedQueryable<T>)source.Provider.CreateQuery<T>(orderByCall);

        }

    }
}
