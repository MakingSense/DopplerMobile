using System.Reflection;
using Android.App;
using Android.OS;
using Xamarin.Android.NUnitLite;

namespace DopplerMobile.Android.UnitTest
{
    [Activity(Label = "DopplerMobile.Android.UnitTest", MainLauncher = true, Icon = "@drawable/icon")]
    public class MainActivity : TestSuiteActivity
    {
        protected override void OnCreate(Bundle bundle)
        {
            AddTest(Assembly.GetExecutingAssembly());
            base.OnCreate(bundle);
        }
    }
}

