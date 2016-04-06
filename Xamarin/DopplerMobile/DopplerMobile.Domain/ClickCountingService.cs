using DopplerMobile.Infrastructure;

namespace DopplerMobile.Domain
{
    /// <summary>
    /// This is a domain service example to show how to deal with platform-specific features through DI
    /// </summary>
    public class ClickCountingService
    {
        private const string ClickCountingLocalSettingKey = "ClickCount";

        public ClickCountingService(ILocalSettings localSettings)
        {
            _localSettings = localSettings;
        }

        private readonly ILocalSettings _localSettings;

        public int GetCurrentCount()
        {
            var countAsString = _localSettings.GetValueOrDefault(ClickCountingLocalSettingKey);
            return string.IsNullOrEmpty(countAsString) ? 0 : int.Parse(countAsString);
        }

        public void SetCurrentCount(int count)
        {
            _localSettings.AddOrUpdateValue(ClickCountingLocalSettingKey, count.ToString());
        }
    }
}
