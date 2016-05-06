namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingFirstPageViewModel : OnboardingPageViewModelBase
    {
        public OnboardingFirstPageViewModel()
            : base("OnboardingFirstPageViewModel", OnboardingPage.First)
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
