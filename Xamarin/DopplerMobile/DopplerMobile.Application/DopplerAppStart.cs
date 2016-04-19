using DopplerMobile.Application.ViewModels;
using DopplerMobile.Domain.Services;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application
{
    public class DopplerAppStart : MvxNavigatingObject, IMvxAppStart
    {
        public DopplerAppStart(SettingService settingService)
        {
            _settingService = settingService;
        }

        #region Instance Data

        private readonly SettingService _settingService;

        #endregion

        public void Start(object hint = null)
        {
            //If the user is already logged, navigate directly to the main screen.
            if (!string.IsNullOrEmpty(_settingService.Get(SettingService.LoggedUserKey)))
            {
                ShowViewModel<MainViewModel>();
            }
            else
            {
                ShowViewModel<LoginViewModel>();
            }
        }
    }
}