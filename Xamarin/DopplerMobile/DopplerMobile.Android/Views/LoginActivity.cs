using Android.App;
using MvvmCross.Droid.Views;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Android.Views
{
    [Activity(
        Label = "View for LoginViewModel",
        Theme = "@style/AppTheme.Login",
        NoHistory = true
    )]
    public class LoginActivity : MvxActivity<LoginViewModel>
    {
        protected override void OnViewModelSet()
        {
            base.OnViewModelSet();
            SetContentView(Resource.Layout.login_view);
        }
    }
}

