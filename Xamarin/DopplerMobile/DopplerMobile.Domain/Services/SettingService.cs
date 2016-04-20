using DopplerMobile.Infrastructure;

namespace DopplerMobile.Domain
{
    /// <summary>
    /// This is a domain service example to show how to deal with platform-specific features through DI
    /// </summary>
    public class SettingService
    {
        private const string UserLoggedKey = "UserLogged";

        public SettingService(ILocalSettings localSettings)
        {
            _localSettings = localSettings;
        }
        private readonly ILocalSettings _localSettings;

        public string GetUserLogged()
        {
            var userName = _localSettings.GetValueOrDefault(UserLoggedKey);
            return string.IsNullOrEmpty(userName) ? "" : userName;
        }

        public void SetUserLogged(string userName)
        {
            _localSettings.AddOrUpdateValue(UserLoggedKey, userName);
        }

        //TODO: Add Methods to use platform-specific Settings.
    }
}
