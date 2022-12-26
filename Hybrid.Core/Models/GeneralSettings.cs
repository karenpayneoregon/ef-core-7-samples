#nullable disable
namespace Hybrid.Core.Models;

public partial class GeneralSettings
{
    public required string ServicePath { get; set; }
    public required string MainDatabaseConnection { get; set; }
}