namespace DopplerMobile.Domain.Services.Interfaces
{
    public interface ILoginService
    {
        bool Login(string username, string password);
    }
}
