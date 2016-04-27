using MvvmCross.Core.ViewModels;
using System;

namespace DopplerMobile.Application.ViewModels
{
    public class MenuViewModel
        : MvxViewModel
    {
        public MenuViewModel()
        {
        }

        public void ShowViewModel(Type viewModel)
        {
            base.ShowViewModel(viewModel);
        }
    }
}