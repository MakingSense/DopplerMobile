using DopplerMobile.Infrastructure;

namespace DopplerMobile.Domain.Services
{
    /// <summary>
    /// This is a domain service example to show how to deal with platform-specific features through DI
    /// </summary>
    public class SettingService
    {
        public const string LoggedUserKey = "LoggedUser";

        public SettingService(ILocalSettings localSettings)
        {
            _localSettings = localSettings;
        }
        private readonly ILocalSettings _localSettings;

        public string Get(string key)
        {
            var userName = _localSettings.GetValueOrDefault(key);
            return string.IsNullOrEmpty(userName) ? "" : userName;
        }

        public void Set(string key, string value)
        {
            _localSettings.AddOrUpdateValue(key, value);
        }
     }
}
