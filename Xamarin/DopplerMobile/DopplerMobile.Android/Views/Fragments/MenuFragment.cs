using System;
using System.Threading.Tasks;
using Android.OS;
using Android.Runtime;
using Android.Support.Design.Widget;
using Android.Views;
using MvvmCross.Binding.Droid.BindingContext;
using MvvmCross.Droid.Shared.Attributes;
using MvvmCross.Droid.Support.V4;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Android.Views
{
    [MvxFragment(typeof(MainViewModel), Resource.Id.navigation_frame)]
    [Register("dopplermobile.android.views.MenuFragment")]
    public class MenuFragment : MvxFragment<MenuViewModel>, NavigationView.IOnNavigationItemSelectedListener
    {
        private NavigationView navigationView;
        private IMenuItem previousMenuItem;

        public override View OnCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState)
        {
            var ignore = base.OnCreateView(inflater, container, savedInstanceState);

            var view = this.BindingInflate(Resource.Layout.fragment_navigation, null);

            navigationView = view.FindViewById<NavigationView>(Resource.Id.navigation_view);
            navigationView.SetNavigationItemSelectedListener(this);
            navigationView.Menu.FindItem(Resource.Id.nav_home).SetChecked(true);

            return view;
        }

        public bool OnNavigationItemSelected(IMenuItem item)
        {
            item.SetCheckable(true);
            item.SetChecked(true);
            previousMenuItem?.SetChecked(false);
            previousMenuItem = item;

            Navigate (item.ItemId);

            return true;
        }

        private async Task Navigate(int itemId)
        {
            ((MainActivity)Activity).DrawerLayout.CloseDrawers ();
            await Task.Delay (TimeSpan.FromMilliseconds (250));

            switch (itemId) {
            case Resource.Id.nav_home:
                ViewModel.ShowViewModel(typeof(HomeViewModel));
                break;
			case Resource.Id.nav_second:
				ViewModel.ShowViewModel(typeof(SecondViewModel));
				break;
            case Resource.Id.nav_viewpager:
                //ViewModel.ShowViewModel(typeof(LoginViewModel));
                break;
            case Resource.Id.nav_settings:
                //ViewModel.ShowViewModel(typeof(LoginViewModel));
                break;
            }
        }
    }
}