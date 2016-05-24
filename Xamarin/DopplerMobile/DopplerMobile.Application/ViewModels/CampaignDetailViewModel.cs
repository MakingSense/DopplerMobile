using DopplerMobile.Domain.Models;

namespace DopplerMobile.Application.ViewModels
{
    public class CampaignDetailViewModel : DopplerBaseMvxViewModel
    {
        public void Init(Campaign item)
        {
            CampaignItem = item;
        }

        #region Public Properties
        
        public Campaign CampaignItem
        {
            get { return _campaignItem; }
            set { _campaignItem = value; RaisePropertyChanged(); }
        }
        private Campaign _campaignItem;
        
        #endregion
    }
}
