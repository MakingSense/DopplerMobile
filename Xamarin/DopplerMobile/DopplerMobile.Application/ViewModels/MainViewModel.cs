using DopplerMobile.Domain.Models;
using MvvmCross.Core.ViewModels;
using System.Collections.Generic;

namespace DopplerMobile.Application.ViewModels
{
    public class MainViewModel : DopplerBaseMvxViewModel
    {
        public MainViewModel()
        {
            ListItems = new List<Campaign>
                {
                    //TODO: Remove this section.
                    new Campaign("Febraury Newsletter", "01/05/2015 to 1 suscriber", "60% OPEN"),
                    new Campaign("March Newsletter", "01/05/2015 to 2 suscriber", "35% OPEN"),
                    new Campaign("June Newsletter", "07/05/2015 to 1 suscriber", "20% OPEN"),
                };
            SeeMoreLastSentCampeingsCommand = new MvxCommand(ShowLastSentCampeingsCommandExecute);
            SeeMoreScheduledCampeingsCommand = new MvxCommand(ShowScheduledCampeingsCommandExecute);
        }

        #region Public Properties

        public List<Campaign> ListItems { get; private set; }

        public IMvxCommand ItemSelectedCommand
        {
            get
            {
                _itemSelectedCommand = _itemSelectedCommand ?? new MvxCommand<Campaign>(DoSelectItem);
                return _itemSelectedCommand;
            }
        }
        private IMvxCommand _itemSelectedCommand;

        public IMvxCommand SeeMoreScheduledCampeingsCommand { get; }
        public IMvxCommand SeeMoreLastSentCampeingsCommand { get; }

        #endregion

        #region Private Methods

        private void DoSelectItem(Campaign item)
        {
            ShowViewModel<CampaignDetailViewModel>(item);
        }

        private void ShowLastSentCampeingsCommandExecute()
        {
            ShowViewModel<LastestCampaignsViewModel>();
        }

        private void ShowScheduledCampeingsCommandExecute()
        {
            ShowViewModel<LastScheduledCampaignsViewModel>();
        }
        #endregion
    }
}