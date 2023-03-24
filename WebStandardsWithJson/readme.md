# About

Provides an example for Json columns for EF Core 7 where the data source are `Web Content Accessibility Guidelines`. 

> **Note**
> All the guidelines are not present as the original json file is a tad old so some of the 2.1 guidelines are not present. No matter, the focus is on Json columns.



## Add records

Data is read from `wcagNew.json` in `JsonOperations.Read()` and added to the database in `DataOperations.AddRange(List<WebStandards> list)`.

## Read records

Data is read using `DataOperations.Read()`


## Configuration

We setup `RelatedList` using `OwnsMany` as each item can have multiple related Sections.

```csharp
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    modelBuilder.Entity<WebStandards>(entity =>
    {
        entity.HasKey(e => e.Identifier);
    });



    modelBuilder.Entity<WebStandards>().OwnsMany(
        ws => ws.RelatedList, ownedNavigationBuilder =>
        {
            ownedNavigationBuilder.ToJson();
        });

    OnModelCreatingPartial(modelBuilder);
}
```
