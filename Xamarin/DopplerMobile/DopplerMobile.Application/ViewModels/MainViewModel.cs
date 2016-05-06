using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class MainViewModel 
        : MvxViewModel
    {
        private string _hello = "Hello Doppler Mobile";
        public string Hello
        { 
            get { return _hello;}
            set { SetProperty (ref _hello, value); }
        }
    }
}
