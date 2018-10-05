global class batchPopulateAccountLocation implements Database.Batchable<sObject>, Database.AllowsCallouts {
    string query = 'SELECT Id, Location__Latitude__s, Location__Longitude__s FROM Account WHERE Location__Latitude__s = null AND Location__Longitude__s = null';
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        List<Account> updates = new List<Account>();
        for(Account s : (List<Account>)scope){
            Account a = GoogleApi.syncGetGeoLatlongFromAddress(s.Id);
            if(a != null){
            	updates.add(a);
            }            
        }
        update updates;
    }
    
    global void finish(Database.BatchableContext BC){
        
    }
}