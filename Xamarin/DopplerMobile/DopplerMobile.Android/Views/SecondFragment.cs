
using Android.OS;
using Android.Runtime;
using Android.Views;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Binding.Droid.BindingContext;
using MvvmCross.Droid.Support.V4;

namespace DopplerMobile.Android.Views
{
    [Register("dopplerMobile.android.views.SecondFragment")]
    public class SecondFragment : MvxFragment<SecondViewModel>
    {
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            var ignore = base.OnCreateView(inflater, container, savedInstanceState);
            return this.BindingInflate(Resource.Layout.SecondView, null);
        }
    }
}