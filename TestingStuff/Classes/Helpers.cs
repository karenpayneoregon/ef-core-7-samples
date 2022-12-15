namespace TestingStuff.Classes;
public class Helpers
{
    public static (bool isFolder, bool success) IsFileOrFolder(string path)
    {
        try
        {
            var attr = File.GetAttributes(path);
            return attr.HasFlag(FileAttributes.Directory) ? (true, true)! : (false, true)!;
        }
        catch (FileNotFoundException) // acceptable
        {
            return (false, false);
        }
    }
}
