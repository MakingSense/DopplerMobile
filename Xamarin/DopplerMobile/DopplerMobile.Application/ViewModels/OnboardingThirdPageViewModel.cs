namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingThirdPageViewModel : OnboardingPageViewModelBase
    {
        public OnboardingThirdPageViewModel(OnboardingViewModel onboardingViewModel)
            : base("OnboardingThirdPageViewModel", OnboardingPage.Third, onboardingViewModel)
        {
        }

        protected override void GoToNextPage()
        {
            ShowViewModel<MainViewModel>();
        }

        protected override void GoToPreviousPage()
        {
            ShowViewModel<OnboardingSecondPageViewModel>();
        }
    }
}
