# Translation of string.IndexOf

See Microsoft [docs](https://learn.microsoft.com/en-us/ef/core/what-is-new/ef-core-7.0/whatsnew#translation-of-stringindexof)


```csharp
var cat = context.Items
    .AsEnumerable()
    .Select(item => new FoundedItem(item.Information.IndexOf(findThis, StringComparison.Ordinal), item.Information, item.Id))
    .FirstOrDefault(x => x.Position > 0);
if (cat is not null)
{
    AnsiConsole.MarkupLine($"Found [cyan]{findThis}[/] with Id of [cyan]{cat.Id}[/]");
}
```

- `item.Information.IndexOf(findThis, StringComparison.Ordinal)` returns the position`findThis` which equals `cat`
- `.FirstOrDefault(x => x.Position > 0)` x.Position is a property of type int.
- `.AsEnumerable()` is needed for `StringComparison.Ordinal` which can not be translated via EF Core so we go client side.

```csharp
public class FoundedItem
{
    public int Position { get; }
    public string Information { get; }
    public int Id { get; }

    public FoundedItem(int position, string information, int id)
    {
        Position = position;
        Information = information;
        Id = id;
    }
}
```

**Note** we use a strong type but anonymous works also.
