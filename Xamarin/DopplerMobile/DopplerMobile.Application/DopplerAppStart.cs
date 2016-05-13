using DopplerMobile.Application.Helpers;
using DopplerMobile.Application.ViewModels;
using MvvmCross.Core.ViewModels;
using Plugin.Settings.Abstractions;

namespace DopplerMobile.Application
{
    public class DopplerAppStart : MvxNavigatingObject, IMvxAppStart
    {
        public DopplerAppStart(ISettings settingService)
        {
            _settingService = settingService;
        }

        #region Instance Data

        private readonly ISettings _settingService;

        #endregion

        public void Start(object hint = null)
        {
            //If the user is already logged, navigate directly to the main screen.
            if (!string.IsNullOrEmpty(_settingService.GetValueOrDefault<string>(Settings.LoggedUserKey)))
            {
                ShowViewModel<OnboardingNewViewModel>();
            }
            else
            {
                ShowViewModel<LoginViewModel>();
            }
        }
    }
}