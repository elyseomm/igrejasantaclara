using System;
using System.Net.Http;

namespace Custom
{
    public class GeoLocation
    {
        public string Ip { get; set; }
        public string ApiKey { get; set; }
        public LocationDetails_IpStack GetLocation()
        { 
            string Ip_Stack_Url = $"http://api.ipstack.com/{Ip}?access_key={ApiKey}";
            // 199.188.211.50 - This is a sample IP address. You can pass yours if you want to test

            // Use HttpClient to get the details from the Json response
            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                // Pass API address to get the Geolocation details 
                client.BaseAddress = new Uri(Ip_Stack_Url);
                HttpResponseMessage response = client.GetAsync(Ip_Stack_Url).GetAwaiter().GetResult();
                // If API is success and receive the response, then get the location details
                if (response.IsSuccessStatusCode)
                {
                    var geolocationInfo = response.Content.ReadAsStringAsync().GetAwaiter().GetResult();
                    if (geolocationInfo != null)
                    {
                        //Console.WriteLine("Country: " + geolocationInfo.country_name);
                        //Console.WriteLine("Region: " + geolocationInfo.region_name);
                        //Console.WriteLine("City: " + geolocationInfo.city);
                        //Console.WriteLine("Zip: " + geolocationInfo.zip);
                        //Console.ReadKey();

                        //return geolocationInfo;
                    }
                }
            }

            return null;
        }
    }

    public class LocationDetails_IpStack
    {
        public string ip { get; set; }
        public string country_code { get; set; }
        public string country_name { get; set; }
        public string region_code { get; set; }
        public string region_name { get; set; }
        public string city { get; set; }
        public string zip { get; set; }
        public double latitude { get; set; }
        public double longitude { get; set; }
    }
}
