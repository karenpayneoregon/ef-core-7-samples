# Json Columns OwnsMany


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

```csharp
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    modelBuilder.Entity<Person>(entity =>
    {
        entity.Property(e => e.DateOfBirth).HasColumnType("datetime");
        entity.Property(e => e.FirstName).IsRequired();
        entity.Property(e => e.LastName).IsRequired();
    });

    modelBuilder.Entity<Person>().OwnsMany(
        post => post.Addresses, ownedNavigationBuilder =>
        {
            ownedNavigationBuilder.ToJson();
        });

    OnModelCreatingPartial(modelBuilder);
}
```