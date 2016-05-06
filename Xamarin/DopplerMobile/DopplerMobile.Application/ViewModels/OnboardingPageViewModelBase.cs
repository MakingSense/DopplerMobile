using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public enum OnboardingPage
    {
        First,
        Second,
        Third
    }

    public abstract class OnboardingPageViewModelBase : MvxViewModel
    {
        protected OnboardingPageViewModelBase(string pageTitle, OnboardingPage pageId)
        {
            PageTitle = pageTitle;
            PageId = pageId;
            SkipCommand = new MvxCommand(SkipCommandExecute);
        }

        #region Public Properties

        /// <summary>
        /// Page's title
        /// </summary>
        public string PageTitle { get; }

        /// <summary>
        /// Page's Id
        /// </summary>
        public OnboardingPage PageId { get; }
        
        public IMvxCommand SkipCommand { get; }

        #endregion

        #region Private Methods

        private void SkipCommandExecute()
        {
            ShowViewModel<MainViewModel>();
        }

        #endregion
    }
}