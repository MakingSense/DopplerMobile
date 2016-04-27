using Android.Runtime;
using MvvmCross.Droid.Shared.Attributes;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Android.Views
{
    [MvxFragment(typeof(MainViewModel), Resource.Id.content_frame, true)]
    [Register("dopplermobile.android.views.HomeFragment")]
    public class HomeFragment : BaseFragment<HomeViewModel>
    {
        protected override int FragmentId => Resource.Layout.fragment_home;
    }
}

