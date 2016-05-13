using System.Collections.Generic;
using System.Windows.Input;
using MvvmCross.Binding.ExtensionMethods;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingViewModel : DopplerMvxViewModel
    {
        public OnboardingViewModel()
        {
            Pages = new List<OnboardingPageViewModel>
            {
                //TODO: Temporal comments. Choice the best viewPager approach.
                //new OnboardingPageViewModel(this, Strings.OnboardingTitlePageOneText),
                //new OnboardingPageViewModel(this, Strings.OnboardingTitlePageTwoText),
                //new OnboardingPageViewModel(this, Strings.OnboardingTitlePageThreeText),
            };
            NextCommand = new MvxCommand(NextCommandExecute);
            SkipCommand = new MvxCommand(SkipCommandExecute);
        }

        #region Public Properties

        public IEnumerable<OnboardingPageViewModel> Pages { get; }

        public int CurrentPage
        {
            get { return _currentPage; }
            set { _currentPage = value; RaisePropertyChanged(); }
        }
        private int _currentPage;

        public ICommand NextCommand { get; }
        public ICommand SkipCommand { get; }

        #endregion

        #region Private Methods

        //TODO: Fix swipe bug. The CurrentPage does not refresh with the swipe action.
        private void NextCommandExecute()
        {
            if (CurrentPage < Pages.Count() - 1)
                CurrentPage++;
            else
                SkipCommandExecute();
        }

        private void SkipCommandExecute()
        {
            ShowViewModel<MainViewModel>();
        }

        #endregion
    }
}
