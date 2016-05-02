using Android.OS;
using Android.Runtime;
using Android.Views;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Binding.Droid.BindingContext;
using MvvmCross.Droid.Support.V7.Fragging.Fragments;

namespace DopplerMobile.Android.Views.Fragments
{
    [Register("dopplermobile.android.views.fragments.FirstFragment")]
    public class FirstFragment : MvxFragment<FirstViewModel>
    {
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            base.OnCreateView(inflater, container, savedInstanceState);
            return this.BindingInflate(Resource.Layout.FirstView, null);
        }
    }
}