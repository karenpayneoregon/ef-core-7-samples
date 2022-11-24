namespace EntityFrameworkCoreHelpers.Models;

public class ModelComment
{
    /// <summary>
    /// Property name
    /// </summary>
    public string Name { get; set; }
    /// <summary>
    /// Comment value
    /// </summary>
    public string Comment { get; set; }
    public string Full => $"{Name}, {Comment}";
    public override string ToString() => Name;

}