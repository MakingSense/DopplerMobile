using Android.Content;
using Android.Preferences;
using DopplerMobile.Infrastructure;

namespace DopplerMobile.Android.Infrastructure
{
    /// <summary>
    /// Super basic implementation of LocalSettings for Android using a string-ony interface
    /// </summary>
    public class AndroidLocalSettings : ILocalSettings
    {
        public AndroidLocalSettings(Context context)
        {
            _context = context;
        }

        private readonly Context _context;
        private static readonly object Locker = new object();

        public string GetValueOrDefault(string key, string defaultValue = "")
        {
            lock (Locker)
            {
                using (var sharedPreferences = PreferenceManager.GetDefaultSharedPreferences(_context))
                {
                    return sharedPreferences.GetString(key, defaultValue);
                }
            }
        }

        public void AddOrUpdateValue(string key, string value)
        {
            lock (Locker)
            {
                using (var sharedPreferences = PreferenceManager.GetDefaultSharedPreferences(_context))
                using (var editableSharedPreferences = sharedPreferences.Edit())
                {
                    editableSharedPreferences.PutString(key, value);
                    editableSharedPreferences.Commit();
                }
            }
        }

        public void Remove(string key)
        {
            lock (Locker)
            {
                using (var sharedPreferences = PreferenceManager.GetDefaultSharedPreferences(_context))
                using (var sharedPreferencesEditor = sharedPreferences.Edit())
                {
                    sharedPreferencesEditor.Remove(key);
                    sharedPreferencesEditor.Commit();
                }
            }
        }
    }
}