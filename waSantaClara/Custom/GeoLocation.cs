using Newtonsoft.Json.Linq;
using System;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Sockets;

namespace Custom
{
    public class GeoLocation
    {
        public string Ip { get; set; }
        public string ApiKey { get; set; }

        public GeoLocation()
        {
            // * http://api.ipstack.com api Key
            this.ApiKey = "75d856dd901a84222b53b16a3c918bb1";

            String address = "";
            WebRequest request = WebRequest.Create("http://checkip.dyndns.org/");
            using (WebResponse response = request.GetResponse())
            using (var stream = new StreamReader(response.GetResponseStream()))
            {
                address = stream.ReadToEnd();
                int first = address.IndexOf("Address: ") + 9;
                int last = address.LastIndexOf("</body>");
                address = address.Substring(first, last - first);
            }

            if (!string.IsNullOrEmpty(address) && address.IndexOf('.') > -1)
                this.Ip = address;
        }

        private bool ValidateProps()
        {
            if (string.IsNullOrEmpty(this.Ip))
                return false;

            if (string.IsNullOrEmpty(this.ApiKey))
                return false;

            return true;
        }

        public LocationDetails_IpStack GetLocation()
        {
            if (!ValidateProps())
                throw new Exception("Parametro {Ip} ou {APIKey} indefinidos!");

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
                        var location = JObject.Parse(geolocationInfo);

                        if (location != null && location.HasValues)
                        {
                            var resp = new LocationDetails_IpStack
                            {
                                ip = location.Value<string>("id"),
                                country_code = location.Value<string>("country_code"),
                                country_name = location.Value<string>("country_name"),
                                region_code = location.Value<string>("region_code"),
                                region_name = location.Value<string>("region_name"),
                                city = location.Value<string>("city"),
                                zip = location.Value<string>("zip"),
                                latitude = location.Value<double>("latitude"),
                                longitude = location.Value<double>("longitude"),
                            };
                            return resp;
                        }
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
