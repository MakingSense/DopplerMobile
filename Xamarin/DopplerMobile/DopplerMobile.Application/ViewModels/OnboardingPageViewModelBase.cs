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
        }

        /// <summary>
        /// Page's title
        /// </summary>
        public string PageTitle { get; }

        /// <summary>
        /// Page's Id
        /// </summary>
        public OnboardingPage PageId { get; }
    }
}