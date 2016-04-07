namespace DopplerMobile.Infrastructure
{
    /// <summary>
    /// Interface to provide access to platform's local storage 
    /// </summary>
    public interface ILocalSettings
    {
        /// <summary>
        /// Gets the current value or the default that you specify.
        /// </summary>
        /// <param name="key">Key for settings</param>
        /// <param name="defaultValue">default value if not set</param>
        /// <returns>Value or default</returns>
        string GetValueOrDefault(string key, string defaultValue = "");

        /// <summary>
        /// Adds or updates a setting
        /// </summary>
        /// <param name="key">Key for settting</param>
        /// <param name="value">New valuet</param>
        void AddOrUpdateValue(string key, string value);

        /// <summary>
        /// Removes a setting
        /// </summary>
        /// <param name="key">Key for setting</param>
        void Remove(string key);
    }
}
