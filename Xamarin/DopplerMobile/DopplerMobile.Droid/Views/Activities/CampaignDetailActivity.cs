using Android.App;
using Android.OS;
using MvvmCross.Droid.Views;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Droid.Views.Activities
{
    [Activity(Label = "CampaignDetailActivity")]
    public class CampaignDetailActivity : MvxActivity<CampaignDetailViewModel>
    {
        protected override void OnCreate(Bundle bundle)
        {
            base.OnCreate(bundle);
            SetContentView(Resource.Layout.campaign_detail_view);
        }
    }
}