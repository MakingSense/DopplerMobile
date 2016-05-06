namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingThirdPageViewModel : OnboardingPageViewModelBase
    {
        public OnboardingThirdPageViewModel()
            : base("OnboardingThirdPageViewModel", OnboardingPage.Third)
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
