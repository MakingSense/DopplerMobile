using System;
using DopplerMobile.Android.Views;
using DopplerMobile.Android.Views.Fragments;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Android.Converters
{
    /// <summary>
    /// Returns fragment type according to <see cref="OnboardingPageViewModelBase"/> properties
    /// </summary>
    public class OnboardingPagesToFragmentConverter : SimpleConverter<OnboardingPageViewModelBase, Type>
    {
        public override Type Convert(OnboardingPageViewModelBase onboardingPage)
        {
            switch (onboardingPage.PageId)
            {
                case OnboardingPage.First:
                    return typeof(OnboardingFirstPageFragment);
                case OnboardingPage.Second:
                    return typeof(OnboardingSecondPageFragment);
                case OnboardingPage.Third:
                    return typeof(OnboardingThirdPageFragment);
                default:
                    throw new ArgumentOutOfRangeException(nameof(onboardingPage.PageId), onboardingPage.PageId, null);
            }
        }
    }
};