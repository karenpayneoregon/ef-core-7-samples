
namespace TranslationStringIndexOfApp.Models;
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
