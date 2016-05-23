using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingPageViewModel : DopplerBaseMvxViewModel
    {
        public OnboardingPageViewModel(OnboardingViewModel parentViewModel, string title)
        {
            ParentViewModel = parentViewModel;
            Title = title;
        }

        #region Public Properties

        /// <summary>
        /// Page's title
        /// </summary>
        public string Title { get; }

        public OnboardingViewModel ParentViewModel { get; }

        #endregion
    }
}