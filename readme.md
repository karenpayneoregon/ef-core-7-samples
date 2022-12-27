# EF Core 7 code samples

For various code samples for new features in EF Core 7. Many have been done simplifed as most code samples found on the web are a) incomlete b) too complex for the average developer to learn from.

## Popular
- [ExecuteDeleteAsync](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-7.0/whatsnew#executeupdate-and-executedelete-bulk-updates)
- [ExecuteUpdateAsync](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-7.0/whatsnew#executeupdate-and-executedelete-bulk-updates)
    - `ExecuteUpdate` and `ExecuteDelete` can only act on a single table.
- [Json columns](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-7.0/whatsnew#json-columns)
    - Two projects: Hybrid.Core and Json1App using OwnsOne and OwnsMany
    - Mapping spatial types directly to JSON is not yet supported. 
    - Mapping of owned types to JSON is not yet supported in conjunction with TPT or TPC inheritance.
    - [Queries into JSON columns](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-7.0/whatsnew#queries-into-json-columns)
- [IMaterializationInterceptor](https://github.com/dotnet/efcore/blob/main/src/EFCore/Diagnostics/IMaterializationInterceptor.cs)
- [OwnedEntities](https://learn.microsoft.com/en-us/ef/core/modeling/owned-entities)

Documentation for the above is [found here](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-7.0/whatsnew) at Microsoft.

There are several code samples taken from Microsoft and ported here as otherwise it would be difficult for a novice developer to get these code samples without cloning the entire EF Core GitHub repository.

# Requires

- Microsoft Visual Studio version 17.4.0 or higher
- Microsoft SQL-Server setup for SQLEXPRESS

# See also

- [What's New in EF Core 7.0](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-7.0/whatsnew)
- [Breaking changes in EF Core 7.0](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-7.0/breaking-changes)
- [Microsoft code samples](https://github.com/dotnet/EntityFramework.Docs/tree/main/samples/core/Miscellaneous/NewInEFCore7)
- Arthur Vickers: Engineering Manager for .NET Data and Entity Framework at Microsoft
    - [ajcvickers/BlogManagementApi](https://github.com/ajcvickers/BlogManagementApi)
    - [ajcvickers/BlogManagementClient](https://github.com/ajcvickers/BlogManagementClient)
