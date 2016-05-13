using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingPageViewModel : DopplerMvxViewModel
    {
        public OnboardingPageViewModel(OnboardingNewViewModel parentViewModel, string title)
        {
            ParentViewModel = parentViewModel;
            Title = title;
        }

        #region Public Properties

        /// <summary>
        /// Page's title
        /// </summary>
        public string Title { get; }

        public OnboardingNewViewModel ParentViewModel { get; }

        #endregion
    }
}