
using System;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingSecondPageViewModel : OnboardingPageViewModelBase
    {
        public OnboardingSecondPageViewModel()
           : base("OnboardingSecondPageViewModel", OnboardingPage.Second)
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
