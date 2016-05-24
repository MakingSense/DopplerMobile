namespace DopplerMobile.Domain.Models
{
    public class Campaign
    {
        public Campaign()
        {
        }

        public Campaign(string title, string details, string percent)
        {
            Title = title;
            Detail = details;
            Percent = percent;
        }

        public string Title { get; set; }
        public string Detail { get; set; }
        public string Percent { get; set; }
    }
}