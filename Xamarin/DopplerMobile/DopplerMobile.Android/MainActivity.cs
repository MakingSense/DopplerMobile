using System;
using Android.App;
using Android.Widget;
using Android.OS;

namespace DopplerMobile.Android
{
    [Activity(Label = "DopplerMobile.Android", MainLauncher = true, Icon = "@drawable/icon")]
    public class MainActivity : Activity
    {
        int _count = 1;
        private Button _button;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.Main);
            _button = FindViewById<Button>(Resource.Id.MyButton);
            _button.Click += ButtonOnClick;
        }

        private void ButtonOnClick(object sender, EventArgs eventArgs)
        {
            _button.Text = $"{_count++} clicks!";
        }

        protected override void OnDestroy()
        {
            _button.Click -= ButtonOnClick;
            base.OnDestroy();
        }
    }
}

