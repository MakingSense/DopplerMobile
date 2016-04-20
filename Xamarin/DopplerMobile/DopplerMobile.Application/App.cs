using DopplerMobile.Application.ViewModels;
using DopplerMobile.Domain;
using DopplerMobile.Domain.Services;
using DopplerMobile.Domain.Services.Interfaces;
using DopplerMobile.Infrastructure;
using MvvmCross.Platform;

namespace DopplerMobile.Application
{
    public class App : MvvmCross.Core.ViewModels.MvxApplication
    {
        public override void Initialize()
        {
            //TODO: Review, alternative to static container

            Mvx.RegisterSingleton<SettingService>(new SettingService(Mvx.Resolve<ILocalSettings>()));
            Mvx.RegisterSingleton<ILoginService>(new LoginService());
            Mvx.RegisterSingleton<IPlaylistService>(new SoundCloudService(new RestClient<ISoundCloudApi>("https://api.soundcloud.com")));
            Mvx.RegisterType<LoginViewModel, LoginViewModel>();
            RegisterAppStart<LoginViewModel>();
        }
    }
}
