namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingFirstPageViewModel : OnboardingPageViewModelBase
    {
        private OnboardingViewModel onboardingViewModel;

        public OnboardingFirstPageViewModel(OnboardingViewModel onboardingViewModel)
            : base("OnboardingFirstPageViewModel", OnboardingPage.First, onboardingViewModel)
        {
        }

        protected override void GoToNextPage()
        {
            ShowViewModel<OnboardingSecondPageViewModel>();
        }

        protected override void GoToPreviousPage()
        {

        }
    }
}
