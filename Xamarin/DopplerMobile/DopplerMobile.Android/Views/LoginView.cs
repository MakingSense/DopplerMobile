using Android.App;
using Android.OS;
using DopplerMobile.Android.Infrastructure;//CR-mvazquez: remove unused namespace
using DopplerMobile.Domain;//CR-mvazquez: remove unused namespace
using MvvmCross.Droid.Views;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Droid.Support.V7.AppCompat;//CR-mvazquez: remove unused namespace

//TODO: LoginViewModel should be injected through IoC

namespace DopplerMobile.Android.Views
{
    [Activity(
        Label = "View for LoginViewModel",
        Theme = "@style/AppTheme.Login"
    )]
    public class LoginView : MvxActivity//CR-mvazquez: Proper naming would be LoginActivity, the view is the XML/XAML file
    {
        //CR-mvazquez: Always specify accesibility modifiers, in this case 'private'
        //CR-mvazquez: C# standard for private vars is to be prefixed with underscore (_vm)
        //CR-mvazquez: Use var instead of explicit type when declaration and assignment are in the same line ( var _vm = new LoginViewModel() )
        LoginViewModel vm = new LoginViewModel();
        protected override async void OnCreate (Bundle bundle)
        {
            //CR-mvazquez: Avoid spaces before parenthesis, use Ctrl+K,D short-cut to auto-format code
            base.OnCreate (bundle);
            SetContentView ( Resource.Layout.LoginView );
            var mauro = await vm.CallRestApiWithModernHttpClient();
        }
    }
}

