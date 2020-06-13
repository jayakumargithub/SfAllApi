public with sharing class Weather{
    public void getData(string cityName){
        string apiKey = '8ef5cf9487a48a9c048043454b3f715f';
        string endpoint = 'http://api.openweathermap.org/data/2.5/weather?q='+ cityName;
        endpoint += '&units=matric';
        endpoint += '&AppId=' + apiKey;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200){ 
            WeatherInfo f = WeatherInfo.parse(response.getBody());
            System.debug('f :' + f.main); 
        }
    }
    
    public class WeatherData{
        public string feels_like{
            get;
            
            set;
        }
        
        public string temp{
            get;
            
            set;
        }
        
        public string pressure{
            get;
            
            set;
        }
        
        public string humidity{
            get;
            
            set;
        }
        
        public string temp_min{
            get;
            
            set;
        }
        
        public string temp_max{
            get;
            
            set;
        }
    }
}