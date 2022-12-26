using Hybrid.Core.Data;
using Hybrid.Core.Models;
using HybridTestProject.Base;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace HybridTestProject
{
    /// <summary>
    /// Fast and dirty, not true test
    /// </summary>
    [TestClass]
    public partial class MainTest : TestBase
    {
        [TestMethod]
        [Ignore]
        [TestTraits(Trait.PlaceHolder)]
        public void AddRecordsTest()
        {
            using var context = new Context();
            Applications application1 = new()
            {
                ApplicationName = "ACED",
                ContactName = "Kim Jenkins",
                MailSettings = new MailSettings()
                {
                    FromAddress = "FromAddressAced", 
                    Host = "AcedHost", 
                    PickupFolder = "C:\\MailDrop", 
                    Port = 15, 
                    TimeOut = 2000
                },
                GeneralSettings = new GeneralSettings()
                {
                    ServicePath = "http://localhost:11111/api/",
                    MainDatabaseConnection = "Data Source=.\\sqlexpress;Initial Catalog=WorkingWithDate;Integrated Security=True;Encrypt=False"
                }
            };

            Applications application2 = new()
            {
                ApplicationName = "SIDES",
                ContactName = "Mike Adams",
                MailSettings = new MailSettings()
                {
                    FromAddress = "FromAddressSides",
                    Host = "SidesHost",
                    PickupFolder = "C:\\MailDrop",
                    Port = 15,
                    TimeOut = 2000
                },
                GeneralSettings = new GeneralSettings()
                {
                    ServicePath = "http://localhost:22222/api/",
                    MainDatabaseConnection = "Data Source=.\\sqlexpress;Initial Catalog=WorkingWithTime;Integrated Security=True;Encrypt=False"
                }
            };

            context.Add(application1);
            context.Add(application2);

            context.SaveChanges();

        }
        [TestMethod]
        [TestTraits(Trait.PlaceHolder)]
        public void SimpleReadTest()
        {
            using var context = new Context();
            var apps = context.Applications.ToList();

            foreach (var app in apps)
            {
                Console.WriteLine($"{app.ApplicationId,-4}{app.ApplicationName,-8}{app.MailSettings.Host}");
                Console.WriteLine($"    {app.GeneralSettings.MainDatabaseConnection}");
            }
        }

        [TestMethod]
        [TestTraits(Trait.PlaceHolder)]
        public void ReadOneTest()
        {
            using var context = new Context();
            var app = context.Applications.FirstOrDefault(x => x.MailSettings.FromAddress == "FromAddressSides");
            Assert.IsNotNull(app);

        }
    }
}
