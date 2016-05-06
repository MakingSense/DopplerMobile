using System;
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
            NextPageCommand = new MvxCommand(NextPageCommandExecute);
            PreviousPageCommand = new MvxCommand(PreviousPageCommandExecute);
        }

        protected abstract void GoToNextPage();
        protected abstract void GoToPreviousPage();

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
        public MvxCommand NextPageCommand { get; }
        public MvxCommand PreviousPageCommand { get; }

        #endregion

        #region Private Methods

        private void SkipCommandExecute()
        {
            ShowViewModel<MainViewModel>();
        }

        private void PreviousPageCommandExecute()
        {
            GoToPreviousPage();
        }

        private void NextPageCommandExecute()
        {
            GoToNextPage();
        }

        #endregion
    }
}