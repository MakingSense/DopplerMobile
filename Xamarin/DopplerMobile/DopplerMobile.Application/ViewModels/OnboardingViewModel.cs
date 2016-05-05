using System.Collections.Generic;
using System.Windows.Input;
using MvvmCross.Binding.ExtensionMethods;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingViewModel : MvxViewModel
    {
        public OnboardingViewModel()
        {
            Pages = new List<OnboardingPageViewModel>
            {
                //TODO: Use shared string resources.
                new OnboardingPageViewModel(this, "saraza"),
                new OnboardingPageViewModel(this, "saraza2"),
                new OnboardingPageViewModel(this, "saraza3"),
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
        private int _currentPage = 1;

        public ICommand NextCommand { get; }
        public ICommand SkipCommand { get; }

        #endregion

        #region Private Methods

        //TODO: Fix swipe bug. The CurrentPage does not refresh with the swipe action.
        private void NextCommandExecute()
        {
            if (CurrentPage < Pages.Count())
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
