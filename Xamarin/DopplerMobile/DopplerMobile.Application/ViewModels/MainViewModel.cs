using DopplerMobile.Resources;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class MainViewModel : DopplerMvxViewModel
    {
        private string _hello = Strings.MvvmCrossText;
        public string Hello
        { 
            get { return _hello;}
            set { SetProperty (ref _hello, value); }
        }
    }
}
