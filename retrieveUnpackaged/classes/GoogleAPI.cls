public class GoogleAPI {    
    @future(callout=true)
    public static void getGeoLatlongFromAddress(Id acctId){
        Account acct = syncGetGeoLatlongFromAddress(acctId);
        if(acct != null){
            update acct;
        }        
    }
    
    public static Account syncGetGeoLatlongFromAddress(Id acctId){
        Account acct = [SELECT Id, Name, BillingStreet, BillingCity, BillingState, BillingPostalCode 
                        FROM Account 
                        WHERE Id =:acctId 
                        LIMIT 1];
        if(acct.BillingStreet == null || acct.BillingCity == null || acct.BillingState == null || acct.BillingPostalCode == null){
            return null;
        }
        
        String address = acct.BillingStreet + '+' + acct.BillingCity + '+' + acct.BillingState + '+' + acct.BillingPostalCode;
        
        HttpResponse response = geocodingCallout(address);
        
        if(response.getStatusCode() != 200){
            System.debug(LoggingLevel.ERROR,'Error making request to Google API');
            System.debug(response.getStatus());
        } else {            
            System.debug(response.getBody());            
            GoogleGeocode geo = (GoogleGeocode) JSON.deserialize(response.getBody(), GoogleGeocode.class);
            GoogleGeocode.Location loc = geo.result.geometry.location;
            acct.Location__Latitude__s = loc.lat;
            acct.Location__Longitude__s = loc.lng;
        }
        
        return acct;
    }
    
    public static HttpResponse geocodingCallout(String address){
        API_Settings__mdt api = [SELECT API_Key__c, Endpoint__c FROM API_Settings__mdt WHERE Label = 'Google Geocode API' LIMIT 1];
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(api.Endpoint__c + 'address=' + EncodingUtil.urlEncode(address, 'UTF-8') + '&key=' + EncodingUtil.urlEncode(api.API_Key__c, 'UTF-8'));
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response;
    }
}