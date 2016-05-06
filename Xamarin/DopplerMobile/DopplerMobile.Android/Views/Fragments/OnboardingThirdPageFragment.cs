using Android.OS;
using Android.Runtime;
using Android.Views;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Binding.Droid.BindingContext;
using MvvmCross.Droid.Support.V4;

namespace DopplerMobile.Android.Views.Fragments
{
    [Register("dopplermobile.android.views.fragments.OnboardingThirdPageFragment")]
    public class OnboardingThirdPageFragment : MvxFragment<OnboardingThirdPageViewModel>
    {
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            base.OnCreateView(inflater, container, savedInstanceState);
            return this.BindingInflate(Resource.Layout.onboarding_third_page_view, null);
        }
    }
}