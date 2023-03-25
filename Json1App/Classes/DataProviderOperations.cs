using ConfigurationLibrary.Classes;
using Microsoft.Data.SqlClient;
using System.Data;

namespace Json1App.Classes;
/// <summary>
/// Shows how to get at the data via a data provider
/// </summary>
internal class DataProviderOperations
{
    public static void ReadPersonAddress(int index = 0)
    {
        AnsiConsole.MarkupLine($"[cyan]Read data for address {index +1}[/]");
        var statement =
            "SELECT Id, FirstName, LastName, DateOfBirth, " + 
            $"JSON_VALUE(Addresses, '$[{index}].Street') AS Street, JSON_VALUE(Addresses, '$[{index}].City') AS City, JSON_VALUE(Addresses, '$[{index}].Company') AS Company FROM dbo.Person;";

        using SqlConnection cn = new(ConfigurationHelper.ConnectionString());
        using SqlCommand cmd = new() { Connection = cn, CommandText = statement };

        cn.Open();

        DataTable dt = new DataTable();
        dt.Load(cmd.ExecuteReader());
      
        foreach (DataRow row in dt.Rows)
        {
            Console.WriteLine($"{string.Join(", ", row.ItemArray)}");
        }

        Console.WriteLine();
        AnsiConsole.MarkupLine("[cyan]DataTable columns[/]");
        foreach (DataColumn column in dt.Columns)
        {
            Console.WriteLine($"{column.ColumnName,-15}{column.DataType.Name}");
        }
    }
}
