using System;
using DopplerMobile.Domain;
using MvvmCross.Core.ViewModels;
using DopplerMobile.Infrastructure;
using MvvmCross.Platform;
using System.Threading.Tasks;
using System.Net.Http;
using ModernHttpClient;

namespace DopplerMobile.Application.ViewModels
{
    public class LoginViewModel : MvxViewModel
    {
        public LoginViewModel()
        {
            this.Username = "TestUser";
            this.Password = "YouCantSeeMe";
            this.IsLoading = false;
        }

        private string _username;

        public string Username
        {
            get { return _username; }
            set
            {
                SetProperty(ref _username, value);
            }
        }

        private string _password;

        public string Password
        {
            get { return _password; }
            set
            {
                SetProperty(ref _password, value);
            }
        }

        private bool _isLoading = false;

        public bool IsLoading
        {
            get { return _isLoading; }
            set
            {
                SetProperty(ref _isLoading, value);
            }
        }

        public virtual IMvxCommand LoginCommand
        {
            get
            {
                return new MvxCommand(() => ShowViewModel<FirstViewModel>());
            }
        }

        public async Task<string> CallRestApiWithModernHttpClient()
        {
            //Example getting information from a webService using the CrossPlatform Rest Client.
           var response = await RestClient.Instance.GetPlayList("17ecae4040e171a5cf25dd0f1ee47f7e");
           return response;
        }
    }
}