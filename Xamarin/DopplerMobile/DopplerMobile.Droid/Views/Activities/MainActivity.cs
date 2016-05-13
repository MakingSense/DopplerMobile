using Android.App;
using Android.OS;
using MvvmCross.Droid.Views;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Droid.Views.Activities
{
    [Activity(Label = "View for MainViewModel")]
    public class MainActivity : MvxActivity<MainViewModel>
    {
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.main_view);
        }
    }
}