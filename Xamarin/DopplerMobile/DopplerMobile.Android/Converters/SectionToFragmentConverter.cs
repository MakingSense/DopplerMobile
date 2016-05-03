using System;
using DopplerMobile.Android.Views;
using DopplerMobile.Android.Views.Fragments;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.Android.Converters
{
    /// <summary>
    /// Returns fragment type according to <see cref="HomeSectionViewModelBase"/> properties
    /// </summary>
    public class SectionToFragmentConverter : SimpleConverter<HomeSectionViewModelBase, Type>
    {
        public override Type Convert(HomeSectionViewModelBase homeSection)
        {
            switch (homeSection.SectionId)
            {
                case HomeSection.First:
                    return typeof(FirstFragment);
                case HomeSection.Second:
                    return typeof(SecondFragment);
                case HomeSection.Third:
                    return typeof(ThirdFragment);
                default:
                    throw new ArgumentOutOfRangeException(nameof(homeSection.SectionId), homeSection.SectionId, null);
            }
        }
    }
};