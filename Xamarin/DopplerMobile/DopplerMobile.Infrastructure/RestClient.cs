using System;
using System.Net.Http;
using ModernHttpClient;
using Refit;

namespace DopplerMobile.Infrastructure
{
    public class RestClient<T>
    {
        public RestClient(string baseUrl)
        {
            Api = RestService.For<T>(new HttpClient(new NativeMessageHandler())
            {
                BaseAddress = new Uri(baseUrl)
            });
        }

        public T Api { get; }
    }
}