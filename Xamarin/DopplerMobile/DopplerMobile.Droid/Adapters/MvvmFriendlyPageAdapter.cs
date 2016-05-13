using System.Collections.Generic;
using System.Linq;
using Android.Content;
using Android.Support.V4.App;
using MvvmCross.Core.ViewModels;
using MvvmCross.Core.Views;
using MvvmCross.Droid.Support.V4;

namespace DopplerMobile.Droid.Adapters
{
    /// <summary>
    /// MvvmFriendlyPageAdapter handles fragment creation from a list of viewmodels.
    /// </summary>
    public class MvvmFriendlyPageAdapter : MvxFragmentPagerAdapter
    {
        public MvvmFriendlyPageAdapter(Context context, FragmentManager fragmentManager, IEnumerable<FragmentInfo> fragments, IEnumerable<MvxViewModel> viewModels)
            : base(context, fragmentManager, fragments)
        {
            _context = context;
            _viewModels = viewModels;
        }

        private readonly IEnumerable<MvxViewModel> _viewModels;
        private readonly Context _context;

        public override Fragment GetItem(int position)
        {
            var fragInfo = Fragments.ElementAt(position);
            if (fragInfo.CachedFragment != null)
                return fragInfo.CachedFragment;

            fragInfo.CachedFragment = Fragment.Instantiate(_context, FragmentJavaName(fragInfo.FragmentType));
            ((IMvxView)fragInfo.CachedFragment).ViewModel = _viewModels.ElementAt(position);

            return fragInfo.CachedFragment;
        }
    }
}