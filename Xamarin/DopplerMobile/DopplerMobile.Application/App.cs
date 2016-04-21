using DopplerMobile.Domain;
using DopplerMobile.Domain.Services;
using DopplerMobile.Domain.Services.Interfaces;
using DopplerMobile.Infrastructure;
using MvvmCross.Core.ViewModels;
using MvvmCross.Platform;
using Plugin.Connectivity;

namespace DopplerMobile.Application
{
    public class App : MvxApplication
    {
        public override void Initialize()
        {
            //Infrastructure
            Mvx.RegisterSingleton(CrossConnectivity.Current);
            Mvx.RegisterSingleton(new RestClient<ISoundCloudApi>("https://api.soundcloud.com"));

            //Services
            Mvx.ConstructAndRegisterSingleton<IPlaylistService, SoundCloudService>();
            Mvx.ConstructAndRegisterSingleton<ILoginService, LoginService>();
            Mvx.ConstructAndRegisterSingleton<SettingService, SettingService>();

            //Application
            Mvx.ConstructAndRegisterSingleton<IMvxAppStart, DopplerAppStart>();
        }
    }
}
