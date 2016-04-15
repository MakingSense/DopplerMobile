using MvvmCross.Core.ViewModels;
using DopplerMobile.Infrastructure;
using System.Threading.Tasks;
using DopplerMobile.Domain.Services.Interfaces;

namespace DopplerMobile.Application.ViewModels
{
    public class LoginViewModel : MvxViewModel
    {
        public LoginViewModel(ILoginService service)
        {
            _loginService = service;
            LoginCommand = new MvxCommand(LoginCommandExecute, LoginCommandCanExecute);
        }

        #region Instance Data

        private readonly ILoginService _loginService;

        #endregion

        #region Public Properties

        public string Username
        {
            get { return _username; }
            set { SetProperty(ref _username, value); LoginCommand.RaiseCanExecuteChanged(); }
        }
        private string _username;

        public string Password
        {
            get { return _password; }
            set { SetProperty(ref _password, value); LoginCommand.RaiseCanExecuteChanged(); }
        }
        private string _password;

        public bool IsLoading
        {
            get { return _isLoading; }
            set { SetProperty(ref _isLoading, value); }
        }
        private bool _isLoading;

        public IMvxCommand LoginCommand { get; }

        #endregion

        #region Private Methods

        private bool LoginCommandCanExecute()
        {
            //Username or Password must be completed before executing LoginCommand
            return !string.IsNullOrEmpty(Username) && !string.IsNullOrEmpty(Password);
        }

        private void LoginCommandExecute()
        {
            if (_loginService.Login(Username, Password))
                ShowViewModel<FirstViewModel>();
            //else - show some error message
        }

        #endregion

        public Task<string> CallRestApiWithModernHttpClient()
        {
            //TODO: Review async/await handling
            //Example getting information from a webService using the CrossPlatform Rest Client.
            var response = RestClient.Instance.GetPlayList("17ecae4040e171a5cf25dd0f1ee47f7e");
            return response;
        }
    }
}