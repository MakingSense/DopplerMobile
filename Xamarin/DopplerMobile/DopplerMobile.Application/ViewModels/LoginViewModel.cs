using MvvmCross.Core.ViewModels;
using DopplerMobile.Domain.Services.Interfaces;
using DopplerMobile.Domain;

namespace DopplerMobile.Application.ViewModels
{
    public class LoginViewModel : MvxViewModel
    {
        public LoginViewModel(ILoginService service, IPlaylistService playlistService, SettingService settingService)
        {
            _loginService = service;
            _playlistService = playlistService;
            _settingService = settingService;
            LoginCommand = new MvxCommand(LoginCommandExecute, LoginCommandCanExecute);

            //If the user is already logged, navigate directly to the main screen.
            if (!string.IsNullOrEmpty(_settingService.Get(SettingService.LoggedUserKey)))
            {
                GoToFirstViewModel();
            }
        }

        #region Instance Data

        private readonly SettingService _settingService;
        private readonly ILoginService _loginService;
        private readonly IPlaylistService _playlistService;

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
            {
                _settingService.Set(SettingService.LoggedUserKey, Username);
                RetrieveUserInformation();
            }
               
            //TODO: else - show some error message
        }

        private void RetrieveUserInformation()
        {
            _playlistService.GetPlaylist("17ecae4040e171a5cf25dd0f1ee47f7e", response =>
            {
                //response contains playlist
                GoToFirstViewModel();
            });
        }

        private void GoToFirstViewModel()
        {
                ShowViewModel<FirstViewModel>();
        }

        #endregion
    }
}