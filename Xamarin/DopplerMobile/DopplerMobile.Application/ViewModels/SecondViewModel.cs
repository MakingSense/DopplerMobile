using MvvmCross.Core.ViewModels;

namespace DopplerMobile.Application.ViewModels
{

    /// <summary>
    /// Define the SecondViewModel type.
    /// </summary>
    public class SecondViewModel : MvxViewModel
    {
        /// <summary>
        /// Backing field for my property.
        /// </summary>
        private string _name = "Second";


        /// <summary>
        /// Gets or sets my property.
        /// </summary>
        public string Name
        {
            get { return this._name; }
            set { this.SetProperty(ref this._name, value); }
        }

    }
}
