using System.Collections.Generic;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class OnboardingViewModel : MvxViewModel
    {
        public OnboardingViewModel()
        {
            Pages = new List<OnboardingPageViewModelBase>
            {
                new OnboardingFirstPageViewModel(),
                new OnboardingSecondPageViewModel(),
                new OnboardingThirdPageViewModel(),
            };
        }

        public IEnumerable<OnboardingPageViewModelBase> Pages { get; }
    }
}
