﻿# About

Shows how to store data as json in a SQL-Server database table. The idea came from a client who wanted to store all application settings in a single record.

**Main table**

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

Configuration from Hybrid.Core class project's DbContext

![On Model Create](assets/OnModelCreate.png)