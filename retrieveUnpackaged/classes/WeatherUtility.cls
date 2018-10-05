public class WeatherUtility {
    private static final string apiUrl = 'https://api.darksky.net/forecast/';
    private static final string api_key = '2a1d75a3096c16efb7da6314ebf289ab';
    
    public static string getWeatherDetails(String location){
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(apiUrl + api_key + '/' + location);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        System.debug(JSON.deserialize(res.getBody(), String.class));
        return res.getBody();
    }
    
    public static CurrentWeather parseJSONWeather(string JSONWeather){
        system.debug('weather JSON ' + JSONWeather);
        CurrentWeather weather = (CurrentWeather)JSON.deserializeStrict(JSONWeather, CurrentWeather.class);
        return weather;
    }
    
    public static Weather parseWeather(string JSONWeather){
        Weather w = (Weather)JSON.deserializeStrict(JSONWeather, Weather.class);
        return w;
    }
}