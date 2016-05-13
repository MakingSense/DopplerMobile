using DopplerMobile.Domain.Services;
using DopplerMobile.Domain.Services.Interfaces;
using DopplerMobile.Infrastructure;
using MvvmCross.Core.ViewModels;
using MvvmCross.Platform;
using Plugin.Connectivity;
using Plugin.Connectivity.Abstractions;
using Plugin.Settings;
using Plugin.Settings.Abstractions;

namespace DopplerMobile.Application
{
    public class App : MvxApplication
    {
        public override void Initialize()
        {
            //Infrastructure
            // Every time someone needs an IConnectivity or ISettings they will get the same one
            // but we don't create it until someone asks for it
            Mvx.RegisterSingleton<IConnectivity>(() => CrossConnectivity.Current);
            Mvx.RegisterSingleton<ISettings>(() => CrossSettings.Current);
            Mvx.RegisterSingleton<RestClient<ISoundCloudApi>>(() => new RestClient<ISoundCloudApi>("https://api.soundcloud.com"));

            //Services
            // An instance will be created only when it is first requested, 
            // and all constructor dependencies will be automatically resolved and filled 
            Mvx.LazyConstructAndRegisterSingleton<IPlaylistService, SoundCloudService>();
            Mvx.LazyConstructAndRegisterSingleton<ILoginService, LoginService>();

            //Application
            Mvx.LazyConstructAndRegisterSingleton<IMvxAppStart, DopplerAppStart>();
        }
    }
}
