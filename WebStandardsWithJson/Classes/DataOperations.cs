using WebStandardsWithJson.Models;

namespace WebStandardsWithJson.Classes;
internal class DataOperations
{

    public static void AddRange(List<WebStandards> list)
    {
        using var context = new Context();
        context.AddRange(list);
        Console.WriteLine(context.SaveChanges());
    }

    public static void Read()
    {
        using var context = new Context();
        var standards = context.WebStandards.ToList();

        foreach (var standard in standards)
        {
            Console.WriteLine($"{standard.Identifier,-5}{standard.Title}");
            if (standard.RelatedList is not null)
            {
                foreach (var related in standard.RelatedList)
                {
                    Console.WriteLine($"\t{related.Section,-10}{related.ConformanceLevel}");
                }
            }
        }

        var aaStandards = standards.Where(x => x.ConformanceLevel == "AA");
        Console.WriteLine(aaStandards.Count());
    }
}
