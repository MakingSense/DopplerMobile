using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public enum HomeSection
    {
        First,
        Second,
        Third
    }

    public abstract class HomeSectionViewModelBase : MvxViewModel
    {
        protected HomeSectionViewModelBase(string title, HomeSection sectionId)
        {
            Title = title;
            SectionId = sectionId;
        }

        /// <summary>
        /// Section's title
        /// </summary>
        public string Title { get; }

        /// <summary>
        /// Section's Id
        /// </summary>
        public HomeSection SectionId { get; }
    }
}