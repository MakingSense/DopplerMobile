using System;
using DopplerMobile.Domain.Services.Interfaces;
using DopplerMobile.Infrastructure;

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
            callback(_restClient.Api.GetPlayList(clientId).Result);
        }
    }
}
