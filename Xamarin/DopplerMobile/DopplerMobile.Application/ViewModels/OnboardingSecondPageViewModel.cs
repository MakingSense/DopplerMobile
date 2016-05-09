
using System;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingSecondPageViewModel : OnboardingPageViewModelBase
    {
        public OnboardingSecondPageViewModel(OnboardingViewModel onboardingViewModel)
           : base("OnboardingSecondPageViewModel", OnboardingPage.Second, onboardingViewModel)
        {
        }

        protected override void GoToNextPage()
        {
            ShowViewModel<OnboardingThirdPageViewModel>();
        }

        protected override void GoToPreviousPage()
        {
            ShowViewModel<OnboardingFirstPageViewModel>();
        }
    }
}
