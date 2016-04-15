using System;

namespace DopplerMobile.Domain.Services.Interfaces
{
    public interface IPlaylistService
    {
        void GetPlaylist(string clientId, Action<string> callback);
    }
}
