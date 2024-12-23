﻿# Json Columns OwnsMany

Intial code samples for EF Core 7 Json columns are in the EF Core GitHub repository buried which makes it difficult to learn from which is the reason for this project and HyBrid.Core project to make learning easy.

:heavy_check_mark: **12/2024 database schema has been adjusted**

**Important**

- The propery `Address` in the `Person` class needs to be nvarchar in the database sized to fix the intended data
- After reverse engineering, change Address property from string to `List<Address>`

```csharp
public partial class Person
{
    public int Id { get; set; }

    public string FirstName { get; set; }

    public string LastName { get; set; }

    public DateTime DateOfBirth { get; set; }
    public List<Address> Addresses { get; set; }
    public override string ToString() => $"{FirstName} {LastName}";
}
```

</br>

```csharp
public class Address
{
    public string Company { get; set; }
    public string Street { get; set; }
    public string City { get; set; }
    public override string ToString() => Company;
}
```

</br>

![On Model Create](assets/OnModelCreate.png)

Contents for Adddress property.

```json
[
  {
    "City": "Wyndmoor",
    "Company": "Company1",
    "Street": "123 Apple St"
  },
  {
    "City": "Portland",
    "Company": "Company2",
    "Street": "999 34th St"
  }
]
```

# Side note

The code in `DataProviderOperations` shows how to get at the json data using `Microsoft.Data.SqlClient` to a `DataTable`.

![Data Table](assets/DataTable.png)

# See also

- Microsoft docs [JSON Columns](https://devblogs.microsoft.com/dotnet/announcing-ef7-release-candidate-2/)
- [EF Core 7 code sample](https://github.com/karenpayneoregon/ef-core-7-samples) (Karen Payne)

