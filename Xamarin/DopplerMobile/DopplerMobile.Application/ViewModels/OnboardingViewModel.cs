using System.Collections.Generic;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingViewModel : MvxViewModel
    {
        //private static OnboardingViewModel _instance = new OnboardingViewModel();

        //public static OnboardingViewModel Instance
        //{
        //    get { return _instance; }
        //}

        public OnboardingViewModel()
        {
            Pages = new List<OnboardingPageViewModelBase>
            {
                new OnboardingFirstPageViewModel(this),
                new OnboardingSecondPageViewModel(this),
                new OnboardingThirdPageViewModel(this),
            };
        }

        public IEnumerable<OnboardingPageViewModelBase> Pages { get; }

        public OnboardingPage CurrentPage
        {
            get { return _currentPage; }
            set { _currentPage = value; RaisePropertyChanged(); }
        }
        private OnboardingPage _currentPage;
    }
}
