using System;
using System.Linq;
using Android.App;
using Android.OS;
using Android.Support.V4.View;
using DopplerMobile.Android.Views.Fragments;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Droid.Support.V4;

namespace DopplerMobile.Android.Views
{
    [Activity(Label = "View for onboarding_container_view", NoHistory = true)]
    public class OnboardingActivity : MvxFragmentActivity<OnboardingViewModel>
    {
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.onboarding_container_view);

            var viewPager = FindViewById<ViewPager>(Resource.Id.viewPager);
            if (viewPager == null)
                throw new NullReferenceException($"OnboardingActivity expects a viewPager with id {Resource.Id.viewPager}");
            InitializeViewPager(viewPager);
        }

        private void InitializeViewPager(ViewPager viewPager)
        {
            var fragments = ViewModel.Pages.Select(section => new MvxFragmentPagerAdapter.FragmentInfo(section.Title, typeof (OnboardingPageFragment), typeof (OnboardingPageViewModel))).ToList();
            viewPager.Adapter = new MvvmFriendlyPageAdapter(this, SupportFragmentManager, fragments, ViewModel.Pages);
        }
    }
}