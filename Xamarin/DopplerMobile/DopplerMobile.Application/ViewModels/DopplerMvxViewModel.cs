﻿using DopplerMobile.Resources;
using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class DopplerMvxViewModel : MvxViewModel
    {
        public string this[string index]
        {
            get
            {
                return Strings.ResourceManager.GetString(index);
            }
        }
    }
}