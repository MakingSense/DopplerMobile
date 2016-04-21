using MvvmCross.Core.ViewModels;
using DopplerMobile.Domain.Services.Interfaces;
using Plugin.Settings.Abstractions;
using DopplerMobile.Application.Helpers;

namespace DopplerMobile.Application.ViewModels
{
    public class LoginViewModel : MvxViewModel
    {
        public LoginViewModel(ILoginService service, IPlaylistService playlistService, ISettings settingService)
        {
            _loginService = service;
            _playlistService = playlistService;
            _settingService = settingService;
            LoginCommand = new MvxCommand(LoginCommandExecute, LoginCommandCanExecute);
        }

        #region Instance Data

        private readonly ISettings _settingService;
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
                _settingService.AddOrUpdateValue(Settings.LoggedUserKey, Username);
                RetrieveUserInformation();
            }
        }

        private void RetrieveUserInformation()
        {
            _playlistService.GetPlaylist("17ecae4040e171a5cf25dd0f1ee47f7e", response =>
            {
                //response contains playlist
                //TODO: remove this call. Now we only navigate to MainViewModel when we get the PlayList.
                ShowViewModel<MainViewModel>();
            });
        }

        #endregion
    }
}