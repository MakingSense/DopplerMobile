using System;
using System.Net.Http;
using ModernHttpClient;
using Refit;

namespace DopplerMobile.Infrastructure
{
    public class RestClient
    {
        private static IServiceEndpoint _instance;
        public const string ApiBaseAddress = "https://api.soundcloud.com";

        static RestClient()
        {
            setupRestClient();
        }

        private static void setupRestClient()
        {
            var client = new HttpClient(new NativeMessageHandler())
            {
                BaseAddress = new Uri(ApiBaseAddress)
            };
            _instance = RestService.For<IServiceEndpoint>(client);
        }

        public static IServiceEndpoint Instance
        {
            get { return _instance; }
        }
    }
}