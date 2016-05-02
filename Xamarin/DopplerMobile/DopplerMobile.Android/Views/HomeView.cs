using System;
using System.Collections.Generic;
using System.Linq;
using Android.App;
using Android.OS;
using Android.Support.V4.View;
using DopplerMobile.Android.Converters;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Droid.Support.V4;
using MvvmCross.Droid.Support.V7.Fragging;

namespace DopplerMobile.Android.Views
{
    [Activity(Label = "View for HomeView")]
    public class HomeView : MvvmCross.Droid.Support.V4.MvxFragmentActivity<HomeViewModel>
    {
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.HomeView);

            var viewPager = FindViewById<ViewPager>(Resource.Id.viewPager);
            if (viewPager == null)
                throw new NullReferenceException($"HomeView expects a viewPager with id {Resource.Id.viewPager}");
            InitializeViewPager(viewPager);
        }

        private void InitializeViewPager(ViewPager viewPager)
        {
            var converter = new SectionToFragmentConverter();
            var fragments = new List<MvxFragmentPagerAdapter.FragmentInfo>();
            foreach (var section in ViewModel.Sections)
            {
                var fragmentType = converter.Convert(section);
                var viewModelAttachedToFragment = fragmentType.BaseType?.GenericTypeArguments.FirstOrDefault();
                
                //TODO 
                //This reflection/generic magic is just to allow for ViewModel-aware views
                //The idea is to implement pure MVVM so there should be no need for views to know which ViewModel they are attached too
                //Just leaving this code here as an example on how to solve this if needed, but binding/converters/commands should be enough to avoid code-behind

                if (viewModelAttachedToFragment == null)
                    throw new InvalidOperationException(@"ViewPager fragments should have an attached ViewModel");
                fragments.Add(new MvxFragmentPagerAdapter.FragmentInfo(section.Title, fragmentType, viewModelAttachedToFragment));
            }
            viewPager.Adapter = new MvxFragmentPagerAdapter(this, SupportFragmentManager, fragments);
        }
    }
}