using Android.App;
using Android.OS;
using MvvmCross.Droid.Views;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Android.Views
{
    [Activity(Label = "View for SecondViewModel")]
    class SecondActivity : MvxActivity<SecondViewModel>
    {
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.activity_second);
        }
    }
}