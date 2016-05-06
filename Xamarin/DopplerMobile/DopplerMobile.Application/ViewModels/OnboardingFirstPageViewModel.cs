
using System;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingFirstPageViewModel : OnboardingPageViewModelBase
    {
        public OnboardingFirstPageViewModel()
            : base("OnboardingFirstPageViewModel", OnboardingPage.First)
        {
        }
    }
}
