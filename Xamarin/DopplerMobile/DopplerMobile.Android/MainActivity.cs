using System;
using Android.App;
using Android.Widget;
using Android.OS;
using DopplerMobile.Android.Infrastructure;
using DopplerMobile.Domain;

namespace DopplerMobile.Android
{
    [Activity(Label = "DopplerMobile.Android", MainLauncher = true, Icon = "@drawable/icon")]
    public class MainActivity : Activity
    {
        int _count;
        private Button _button;
        private ClickCountingService _clickCountingService;

        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.Main);
            _button = FindViewById<Button>(Resource.Id.MyButton);
            _button.Click += ButtonOnClick;
            _clickCountingService = new ClickCountingService(new AndroidLocalSettings(this));
            _count = _clickCountingService.GetCurrentCount();
        }

        private void ButtonOnClick(object sender, EventArgs eventArgs)
        {
            _clickCountingService.SetCurrentCount(++_count);
            _button.Text = $"{_count} clicks!";
        }

        protected override void OnDestroy()
        {
            _button.Click -= ButtonOnClick;
            base.OnDestroy();
        }
    }
}

