using Android.OS;
using Android.Views;
using MvvmCross.Binding.Droid.BindingContext;
using Android.Runtime;
using MvvmCross.Droid.Support.V4;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Android.Views
{
    [Register("dopplerMobile.android.views.ThirdFragment")]
    public class ThirdFragment : MvxFragment<ThirdViewModel>
    {
        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            base.OnCreateView(inflater, container, savedInstanceState);
            return this.BindingInflate(Resource.Layout.ThirdView, null);
        }
    }
}