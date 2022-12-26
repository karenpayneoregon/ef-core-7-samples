
namespace Hybrid.Core.Models;

public partial class MailSettings
{
    public required string FromAddress { get; set; }
    public required string Host { get; set; }
    public required int? Port { get; set; }
    public required int? TimeOut { get; set; }
    public required string PickupFolder { get; set; }
}