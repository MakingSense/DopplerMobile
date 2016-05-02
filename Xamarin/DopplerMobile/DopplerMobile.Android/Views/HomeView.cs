using System.Collections.Generic;
using MvvmCross.Droid.Support.V4;
using Android.App;
using Android.OS;
using Android.Support.V4.View;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Android.Views
{
    [Activity(Label = "View for HomeView")]
    public class HomeView : MvxFragmentActivity<HomeViewModel>
    {
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            this.SetContentView(Resource.Layout.HomeView);

            var viewPager = FindViewById<ViewPager>(Resource.Id.viewPager);
            if (viewPager != null)
            {
                var fragments = new List<MvxFragmentPagerAdapter.FragmentInfo>
                {
                    new MvxFragmentPagerAdapter.FragmentInfo("Primer Fragment", typeof (FirstFragment),
                        typeof (FirstViewModel)),
                    new MvxFragmentPagerAdapter.FragmentInfo("Segundo Fragment", typeof (SecondFragment),
                        typeof (SecondViewModel)),
                    new MvxFragmentPagerAdapter.FragmentInfo("Tercer Fragment", typeof (ThirdFragment),
                        typeof (ThirdViewModel))
                };
                viewPager.Adapter = new MvxFragmentPagerAdapter(this, SupportFragmentManager, fragments);
            }
        }
    }
}