trigger contactTrigger2 on Contact (after insert, after delete) {
    //Create a set to hold account ids
    Set<Id> accountIds = new Set<Id>();
    
    if(Trigger.isAfter && Trigger.isInsert){
        
        for(Contact c : Trigger.new){
            //Add this contact's account id to the set
            accountIds.add(c.AccountId);            
        }
        
        // Get all Accounts related to the contacts being inserted.
        List<Account> accounts = [Select Number_Of_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accountIds];
        for(Account a : accounts){
            a.Number_Of_Contacts__c = a.Contacts.size();
        }
        
        update accounts;
    }
}