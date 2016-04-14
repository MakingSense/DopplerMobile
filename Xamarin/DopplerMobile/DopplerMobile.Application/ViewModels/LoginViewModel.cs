using System;//CR-mvazquez: remove unused namespace
using DopplerMobile.Domain;//CR-mvazquez: remove unused namespace
using MvvmCross.Core.ViewModels;
using DopplerMobile.Infrastructure;
using MvvmCross.Platform;//CR-mvazquez: remove unused namespace
using System.Threading.Tasks;
using System.Net.Http;//CR-mvazquez: remove unused namespace
using ModernHttpClient;//CR-mvazquez: remove unused namespace

namespace DopplerMobile.Application.ViewModels
{
    public class LoginViewModel : MvxViewModel
    {
        public LoginViewModel()
        {
            this.Username = "TestUser";//CR-mvazquez: Avoud using 'this.' when is not needed
            this.Password = "YouCantSeeMe";//CR-mvazquez: Avoud using 'this.' when is not needed
            this.IsLoading = false;//CR-mvazquez: Avoud using 'this.' when is not needed
        }


        //CR-mvazquez: When working with MVVM, ViewModels tend to be full of notifiable properties, so to improve readability define them like this:
        //
        //public string Property
        //{
        //    get { return _backingField; }
        //    set { SetProperty(ref _backingField, value); }
        //}
        //private string _backingField;
        //
        // This way backing field is tied to the property, but below it, this will allow to add a ///Summary tag without separating the property from the backing field
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

        //CR-mvazquez: Is there a reason for this property to be virtual?
        //CR-mvazquez: This property will create a new Command each time, so there's no chance to handle events like CanExecute or RaiseCanExecuteChanged from the ViewModel. You should create the MvxCommand in the constructor
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