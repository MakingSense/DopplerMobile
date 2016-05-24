using Android.App;
using Android.OS;
using MvvmCross.Droid.Views;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Droid.Views.Activities
{
    [Activity(Label = "View for LastestCampaignsViewModel")]
    public class LastestCampaignsActivity : MvxActivity<LastestCampaignsViewModel>
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.lastest_campaigns_list_view);
        }
    }
}