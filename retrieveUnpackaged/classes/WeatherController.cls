public class WeatherController {
    
    private final string current_ip;
    private final Location location;
    private final Weather weatherDetails;
        
    public WeatherController(){
        current_ip = LocationUtility.GetUserIPAddress();
        location = LocationUtility.parseJSONLocation(LocationUtility.getLocationByIP(current_ip));
        weatherDetails = Weather.parse(WeatherUtility.getWeatherDetails(location.loc));
    }
    
    public string getCurrent_ip(){
        return current_ip;
    }
    
    public Location getLocation(){
        return location;
    }
    
    public Weather getWeather(){
        return weatherDetails;
    }
}