using System.Text.Json;
using WebStandardsWithJson.Models;

namespace WebStandardsWithJson.Classes;
internal class JsonOperations
{
    private static string FileName => "wcagNew.json";
    public static List<WebStandards> Read()
    {
        var jsonString = File.ReadAllText(FileName);
        return JsonSerializer.Deserialize<List<WebStandards>>(jsonString);
    }
}
