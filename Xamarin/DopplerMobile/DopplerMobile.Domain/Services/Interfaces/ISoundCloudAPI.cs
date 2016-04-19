using System.Threading.Tasks;
using Refit;

namespace DopplerMobile.Domain.Services.Interfaces
{
    [Headers("Accept: application/json")]
    public interface ISoundCloudApi
    {
        [Get("/playlists/list?client_id={id}")]
        Task<string> GetPlayList(string id);
    }
}
