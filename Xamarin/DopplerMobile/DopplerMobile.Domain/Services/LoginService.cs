using DopplerMobile.Domain.Services.Interfaces;

namespace DopplerMobile.Domain.Services
{
    public class LoginService : ILoginService
    {
        public bool Login(string username, string password)
        {
            return password == "1234";
        }
    }
}
