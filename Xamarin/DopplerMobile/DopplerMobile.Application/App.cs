using DopplerMobile.Domain;
using DopplerMobile.Domain.Services;
using DopplerMobile.Domain.Services.Interfaces;
using DopplerMobile.Infrastructure;
using MvvmCross.Platform;
using Plugin.Connectivity;

namespace DopplerMobile.Application
{
    public class App : MvvmCross.Core.ViewModels.MvxApplication
    {
        public override void Initialize()
        {
            //TODO: Review, alternative to static container
            Mvx.RegisterSingleton(CrossConnectivity.Current);
            Mvx.RegisterSingleton<ILoginService>(new LoginService());
            Mvx.RegisterSingleton<IPlaylistService>(new SoundCloudService(new RestClient<ISoundCloudApi>("https://api.soundcloud.com"), CrossConnectivity.Current));
            //TODO: check the possibility to avoid use Mvx.Resolve to get Setting Service.
            RegisterAppStart(new DopplerAppStart(Mvx.Resolve<SettingService>()));
        }
    }
}
