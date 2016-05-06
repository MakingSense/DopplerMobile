using Android.App;
using Android.Content.PM;
using MvvmCross.Droid.Views;

namespace DopplerMobile.Android
{
    [Activity(
        Label = "DopplerMobile.Android"
        , MainLauncher = true
        , Icon = "@drawable/icon"
        , Theme = "@style/Theme.Splash"
        , NoHistory = true
        , ScreenOrientation = ScreenOrientation.Portrait)]
    public class SplashScreen : MvxSplashScreenActivity
    {
        public SplashScreen()
            : base(Resource.Layout.splash_screen_view)
        {
        }
    }
}
