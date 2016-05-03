using Android.OS;
using Android.Runtime;
using Android.Views;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Binding.Droid.BindingContext;
using MvvmCross.Droid.Support.V7.Fragging.Fragments;

namespace DopplerMobile.Android.Views.Fragments
{
    [Register("dopplermobile.android.views.fragments.SecondFragment")]
    public class SecondFragment : MvxFragment<SecondViewModel>
    {
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            base.OnCreateView(inflater, container, savedInstanceState);
            return this.BindingInflate(Resource.Layout.SecondView, null);
        }
    }
}