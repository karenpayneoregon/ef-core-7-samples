using Microsoft.VisualStudio.TestTools.UnitTesting;


// ReSharper disable once CheckNamespace - do not change
namespace HybridTestProject;

public partial class MainTest
{
    [ClassInitialize()]
    public static void MyClassInitialize(TestContext testContext)
    {
        TestResults = new List<TestContext>();
    }
}