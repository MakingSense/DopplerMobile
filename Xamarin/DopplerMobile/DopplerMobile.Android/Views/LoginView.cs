using Android.App;
using Android.OS;
using DopplerMobile.Android.Infrastructure;
using DopplerMobile.Domain;
using MvvmCross.Droid.Views;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Droid.Support.V7.AppCompat;

namespace DopplerMobile.Android.Views
{
    [Activity(
        Label = "View for LoginViewModel",
        Theme = "@style/AppTheme.Login"
    )]
    public class LoginView : MvxActivity
    {
        protected override void OnCreate (Bundle bundle)
        {
            base.OnCreate (bundle);
            SetContentView ( Resource.Layout.LoginView );
        }
    }
}

