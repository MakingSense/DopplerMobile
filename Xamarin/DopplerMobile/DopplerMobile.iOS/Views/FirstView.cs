using MvvmCross.Binding.BindingContext;
using MvvmCross.iOS.Views;
using DopplerMobile;
using DopplerMobile.Application.ViewModels;

namespace DopplerMobile.iOS.Views
{
    public partial class FirstView : MvxViewController<MainViewModel>
    {
        public FirstView() : base("FirstView", null)
        {
        }

        public override void ViewDidLoad()
        {
            base.ViewDidLoad();

            var set = this.CreateBindingSet<FirstView, MainViewModel>();
            set.Bind(Label).To(vm => vm.Hello);
            set.Bind(TextField).To(vm => vm.Hello);
            set.Apply();
        }
    }
}
