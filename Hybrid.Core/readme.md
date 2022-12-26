# About

Shows how to store data as json in a SQL-Server database table.

Intial code samples for EF Core 7 Json columns are in the EF Core GitHub repository buried which makes it difficult to learn from which is the reason for this project and Json1App project to make learning easy.

Main table

```csharp
public partial class Applications
{
    public int ApplicationId { get; set; }
    /// <summary>
    /// Application identifier
    /// </summary>
    public string ApplicationName { get; set; }
    /// <summary>
    /// Contact name
    /// </summary>
    public string ContactName { get; set; }
    /// <summary>
    /// For sending email messages
    /// </summary>
    public MailSettings MailSettings { get; set; }
    public GeneralSettings GeneralSettings { get; set; }
}
```