using System;
using System.Globalization;
using Android.Util;
using MvvmCross.Platform.Converters;

namespace DopplerMobile.Android.Converters
{
    /// <summary>
    /// Convenience class to implement simple one-way binding
    /// </summary>
    /// <typeparam name="TInput">Converter's input type</typeparam>
    /// <typeparam name="TOutput">Converter's output type</typeparam>
    public abstract class SimpleConverter<TInput, TOutput> : IMvxValueConverter
    {
        /// <summary>
        /// Fallback value in case conversion throws an exception
        /// </summary>
        public virtual TOutput FallbackValue => default(TOutput);

        /// <summary>
        /// Fallback value in case input parameter is null
        /// </summary>
        public virtual TOutput NullValue => default(TOutput);

        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value == null)
                return NullValue;

            try
            {
                return Convert((TInput)value);
            }
            catch (Exception e)
            {
                Log.Error(nameof(SimpleConverter<TInput, TOutput>), $"[Conversion failed] param: {value}, Exception message: {e.Message}");
                return FallbackValue;
            }
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new InvalidOperationException($"{nameof(SimpleConverter<TInput, TOutput>)} doesn't support two-way binding");
        }

        public abstract TOutput Convert(TInput inputValue);
    }
}