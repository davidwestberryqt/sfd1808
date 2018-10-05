global class batch_UpdateNumberOfContacts implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Id, Name, Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account');
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope){
        for(Account acct : scope){
            acct.Number_of_contacts__c = acct.Contacts.size();
        }
        update scope;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
}