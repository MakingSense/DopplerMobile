using DopplerMobile.Application.ViewModels;
using DopplerMobile.Domain.Services;
using DopplerMobile.Domain.Services.Interfaces;
using MvvmCross.Platform;

namespace DopplerMobile.Application
{
    public class App : MvvmCross.Core.ViewModels.MvxApplication
    {
        public override void Initialize()
        {
            //TODO: Review, alternative to static container

            Mvx.RegisterSingleton<ILoginService>(new LoginService());
            Mvx.RegisterType<LoginViewModel, LoginViewModel>();
            RegisterAppStart<LoginViewModel>();
        }
    }
}
