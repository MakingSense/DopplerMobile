using System;
using DopplerMobile.Domain.Services.Interfaces;
using DopplerMobile.Infrastructure;
using Plugin.Connectivity;

namespace DopplerMobile.Domain.Services
{
    public class SoundCloudService : IPlaylistService
    {
        public SoundCloudService(RestClient<ISoundCloudApi> restClient)
        {
            _restClient = restClient;
        }

        private readonly RestClient<ISoundCloudApi> _restClient;

        public void GetPlaylist(string clientId, Action<string> callback)
        {
            //Simple cross platform plugin to check connection status of mobile device, 
            //avoiding make rest calls without connection.
            if (CrossConnectivity.Current.IsConnected) { 
                callback(_restClient.Api.GetPlayList(clientId).Result);
            }
        }
    }
}
