using DopplerMobile.Resources;
using MvvmCross.Core.ViewModels;
using MvvmCross.Platform.Platform;
using System.Collections.ObjectModel;
using System.Windows.Input;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingViewModel : DopplerBaseMvxViewModel
    {
        public OnboardingViewModel()
        {
            Items = new ObservableCollection<OnboardingPageViewModel>()
            {
                new OnboardingPageViewModel(this, Strings.OnboardingTitlePageOneText),
                new OnboardingPageViewModel(this, Strings.OnboardingTitlePageTwoText),
                new OnboardingPageViewModel(this, Strings.OnboardingTitlePageThreeText),
            };

            NextCommand = new MvxCommand(NextCommandExecute);
            SkipCommand = new MvxCommand(SkipCommandExecute);
            _switchToPage = 0;
        }

        #region Public Properties

        public ObservableCollection<OnboardingPageViewModel> Items
        {
            get { return _items; }
            set { _items = value; RaisePropertyChanged(); }
        }
        private ObservableCollection<OnboardingPageViewModel> _items;

        public int CurrentPage
        {
            get { return _currentPage; }
            set { _currentPage = value; RaisePropertyChanged(); }
        }
        private int _currentPage;

        //Commands
        public ICommand NextCommand { get; }
        public ICommand SkipCommand { get; }
        public ICommand ItemPageChangedCommand
        {
            get { return new MvxCommand<OnboardingPageViewModel>(ShowItemPageChanged); }
        }
        public ICommand PageChangedCommand
        {
            get { return new MvxCommand<int>(ShowPageChanged); }
        }

        #endregion

        #region Private Methods
        private static int _switchToPage;

        //TODO: Chech if this method is necessary
        private static void ShowItemPageChanged(OnboardingPageViewModel toPage)
        {
            MvxTrace.TaggedTrace("SimpleListViewModel", "Page changed to {0}", toPage.Title);
        }

        private static void ShowPageChanged(int toPage)
        {
            MvxTrace.TaggedTrace("SimpleListViewModel", "Page changed to {0}", toPage);
            _switchToPage = toPage;
        }

        private void NextCommandExecute()
        {
            if (_switchToPage + 1 < Items.Count)
                CurrentPage = _switchToPage + 1;
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

