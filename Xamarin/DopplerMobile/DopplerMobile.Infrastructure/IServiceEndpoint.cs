using System;
using System.Threading.Tasks;
using Refit;

namespace DopplerMobile.Infrastructure
{
    [Headers("Accept: application/json")]
    public interface IServiceEndpoint
    {            
    [Get("/playlists/list?client_id={id}")]
        Task<String> GetPlayList(string id);
    }
}
