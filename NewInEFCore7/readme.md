# About

## Working with Json
From EF Core [samples](https://github.com/dotnet/EntityFramework.Docs/blob/main/samples/core/Miscellaneous/NewInEFCore7/JsonColumnsSample.cs) demoing json columns. Had to modify it a bit to work on my machine.

# Interceptors
From EF Core QueryStatisticsLoggerSample [sample](https://github.com/dotnet/EntityFramework.Docs/blob/main/samples/core/Miscellaneous/NewInEFCore7/QueryStatisticsLoggerSample.cs) which shows usage for a DbCommandInterceptor which turns on [SET STATISTICS IO ON](https://learn.microsoft.com/en-us/sql/t-sql/statements/set-statistics-io-transact-sql?view=sql-server-ver16) for read operations

> **Note**
> When STATISTICS IO is ON, statistical information is displayed, and when OFF, the information isn't displayed. After this option is set ON, all Transact-SQL statements return the statistical information until the option is set to OFF.


**Copyright**: Microsoft

## See also

https://devblogs.microsoft.com/dotnet/announcing-ef7-release-candidate-2/
