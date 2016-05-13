using Android.App;
using Android.OS;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Droid.Support.V4;

namespace DopplerMobile.Droid.Views.Activities
{
    [Activity(Label = "View for onboarding_container_view_new", NoHistory = true)]
    public class OnboardingActivityNew : MvxFragmentActivity<OnboardingNewViewModel>
    {
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.onboarding_container_view_new);
        }
    }
}
