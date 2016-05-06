using Android.OS;
using Android.Runtime;
using Android.Views;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Binding.Droid.BindingContext;
using MvvmCross.Droid.Support.V4;

namespace DopplerMobile.Android.Views.Fragments
{
    [Register("dopplermobile.android.views.fragments.OnboardingFirstPageFragment")]
    public class OnboardingFirstPageFragment : MvxFragment<OnboardingFirstPageViewModel>
    {
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            base.OnCreateView(inflater, container, savedInstanceState);
            return this.BindingInflate(Resource.Layout.onboarding_first_page_view, null);
        }
    }
}