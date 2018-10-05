public class LocationUtility {
    
    public static String GetUserIPAddress(){
        string ReturnValue = '';
        
        // True-Client-IP has the value when the request is coming via the caching integration.
        ReturnValue = ApexPages.currentPage().getHeaders().get('True-Client-IP');
        
        // X-Salesforce-SIP has the value when no caching integration or via secure URL.
        if(ReturnValue == '' || ReturnValue == null){
            ReturnValue = ApexPages.currentPage().getHeaders().get('X-Salesforce-SIP');
        }
        
        if(ReturnValue == '' || ReturnValue == null){
            ReturnValue = ApexPages.currentPage().getHeaders().get('X-Forwarded-For');
        } // get IP address from standard header if proxy in use.
        
        return ReturnValue;
    }
    
    public static String getLocationByIP(String ip){
        String endPoint = 'http://ipinfo.io/';
        endPoint += ip;
        endPoint += '/json';
        
        Http httpProtocol = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endPoint);
        req.setMethod('GET');
        HttpResponse res = httpProtocol.send(req);
        return res.getBody();
    }
    
    public static Location parseJSONLocation(String jsonLocation){
        //Location location;
        System.debug('jsonLocation = ' + jsonLocation);
        
        Location l = (Location)JSON.deserializeStrict(jsonLocation, Location.class);
        System.debug('l ' + l);
        return l;
    }
}