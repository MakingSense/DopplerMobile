using System;
using DopplerMobile.Domain.Services.Interfaces;
using DopplerMobile.Infrastructure;
using Plugin.Connectivity.Abstractions;

namespace DopplerMobile.Domain.Services
{
    public class SoundCloudService : IPlaylistService
    {
        public SoundCloudService(RestClient<ISoundCloudApi> restClient, IConnectivity connectivtyHandler)
        {
            _restClient = restClient;
            _connectivtyHandler = connectivtyHandler;
        }

        private readonly RestClient<ISoundCloudApi> _restClient;
        private readonly IConnectivity _connectivtyHandler;

        public void GetPlaylist(string clientId, Action<string> callback)
        {
            if (_connectivtyHandler.IsConnected) { 
                callback(_restClient.Api.GetPlayList(clientId).Result);
            }
        }
    }
}
