using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{
    public class FirstViewModel : MvxViewModel
    {
        /// <summary>
        /// Backing field for my property.
        /// </summary>
        private string _name = "First";


        /// <summary>
        /// Gets or sets my property.
        /// </summary>
        public string Name
        {
            get { return this._name; }
            set { SetProperty(ref this._name, value); }
        }
    }
}
