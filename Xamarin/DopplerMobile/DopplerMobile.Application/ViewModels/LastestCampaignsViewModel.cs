using DopplerMobile.Domain.Models;
using MvvmCross.Core.ViewModels;
using System.Collections.Generic;

namespace DopplerMobile.Application.ViewModels
{
    public class LastestCampaignsViewModel : DopplerBaseMvxViewModel
    {
        public LastestCampaignsViewModel()
        {
            ListItems = new List<Campaign>
                {
                    //TODO: Remove this section.
                    new Campaign("Febraury Newsletter", "01/05/2015 to 1 suscriber", "60% OPEN"),
                    new Campaign("March Newsletter", "01/05/2015 to 2 suscriber", "35% OPEN"),
                    new Campaign("June Newsletter", "07/05/2015 to 1 suscriber", "20% OPEN"),
                    new Campaign("July Newsletter", "01/05/2015 to 5 suscriber", "10% OPEN"),
                    new Campaign("Febraury Newsletter", "01/05/2015 to 1 suscriber", "60% OPEN"),
                    new Campaign("March Newsletter", "01/05/2015 to 2 suscriber", "35% OPEN"),
                    new Campaign("June Newsletter", "07/05/2015 to 1 suscriber", "20% OPEN"),
                    new Campaign("July Newsletter", "01/05/2015 to 5 suscriber", "10% OPEN"),
                    new Campaign("Febraury Newsletter", "01/05/2015 to 1 suscriber", "60% OPEN"),
                    new Campaign("March Newsletter", "01/05/2015 to 2 suscriber", "35% OPEN"),
                };
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

        #endregion

        #region Private Methods

        private void DoSelectItem(Campaign item)
        {
            ShowViewModel<CampaignDetailViewModel>(item);
        }
        #endregion
    }
}