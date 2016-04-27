using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class MainViewModel 
        : MvxViewModel
    {
        private string _hello = "Hello MvvmCross";
        public string Hello
        { 
            get { return _hello;}
            set { SetProperty (ref _hello, value); }
        }

        public void ShowMenu()
        {
            ShowViewModel<MenuViewModel>();
        }
    }
}
