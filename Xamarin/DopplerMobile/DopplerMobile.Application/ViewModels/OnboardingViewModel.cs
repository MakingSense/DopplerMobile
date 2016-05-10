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
                new OnboardingPageViewModel(this, "saraza"),
                new OnboardingPageViewModel(this, "saraza2"),
                new OnboardingPageViewModel(this, "saraza3"),
            };
            NextCommand = new MvxCommand(NextCommandExecute, NextCommandCanExecute);
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

        #endregion

        #region Private Methods

        private bool NextCommandCanExecute()
        {
            return CurrentPage < Pages.Count();
        }

        private void NextCommandExecute()
        {
            CurrentPage++;
        }

        #endregion
    }
}
