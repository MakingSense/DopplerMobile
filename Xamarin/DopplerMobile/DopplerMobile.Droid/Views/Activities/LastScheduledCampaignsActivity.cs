using Android.App;
using Android.OS;
using MvvmCross.Droid.Views;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Droid.Views.Activities
{
    [Activity(Label = "View for LastScheduledCampaignsViewModel")]
    public class LastScheduledCampaignsActivity : MvxActivity<LastScheduledCampaignsViewModel>
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.last_scheduled_campaigns_list_view);
        }
    }
}