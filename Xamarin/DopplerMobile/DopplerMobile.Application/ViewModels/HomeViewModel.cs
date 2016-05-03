using System.Collections.Generic;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class HomeViewModel : MvxViewModel
    {
        public HomeViewModel()
        {
            Sections = new List<HomeSectionViewModelBase>
            {
                new FirstViewModel(),
                new SecondViewModel(),
                new ThirdViewModel(),
            };
        }

        //TODO: I don't like the name sections, think of a better name that 'fits' both Android and iOS
        public IEnumerable<HomeSectionViewModelBase> Sections { get; }
    }
}
