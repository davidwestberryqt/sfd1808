/*

Author : Santosh M Reddy/Beth Bryant
Version : 1.0
Use Case : 1. Update Parent Account with New contact information(Populate Contact Name & Created date on Account Field : New Contact Info)
2. Update record count of contacts on parent account
Assumption : Every Contact will be associated with an account           

*/
/* this syntax commments multi lines in the code */
//this syntax comments single line in the code
//second line comment


trigger ContactTrigger on Contact (after insert,before delete,after delete) {
    
    //Extract parent account id from the contact collection
    Set<Id> AccountIdFromContact = new set<Id>();
    Set<Id> AccountIdFromContactAfterDel = new set<Id>();
    List<Account> AccListToUpdate = new List<Account>();
    Map<Id,Contact> AccountMap = new Map<Id,Contact> ();
    
    
    
    if(Trigger.IsInsert){  
        
        for(Contact Con : Trigger.new){
            AccountMap.put(Con.AccountId,con);
            AccountIdFromContact.add(con.AccountId);
        }
        integer NoOfContacts1 = [SELECT COUNT() FROM Contact WHERE AccountId IN : AccountIdFromContact];
        
        //List<Contact> AccountContactList = [SELECT Id,Name,Account.Number_of_Contacts__c FROM Contact WHERE AccountId IN : AccountIdFromContact];
        // integer NoOfContacts1 = [SELECT COUNT() FROM Contact WHERE AccountId IN : AccountIdFromContact];
        // integer NoOfContacts2 = [SELECT Id FROM Contact WHERE AccountId IN : AccountIdFromContact].size();
        
        for(Contact c : [SELECT Id,Name,AccountId,Account.New_Contact_Information__c FROM Contact 
                         WHERE  Id IN : Trigger.newMap.keySet() ]){
                             Contact con = AccountMap.get(c.AccountId);
                             system.debug('@@@==>'+con);
                             c.Account.New_Contact_Information__c = 'Latest Contact Added :'+con.FirstName+' ' + con.LastName;
                             c.Account.Number_Of_Contacts__c = NoOfContacts1;//AccountContactList.size();
                             AccListToUpdate.add(c.Account);
                         }
        if(AccListToUpdate.size()>0)
            Update AccListToUpdate;   
    }
    if(Trigger.IsDelete){
        if(Trigger.IsBefore){
            
            for(Contact con : Trigger.old){
                if(con.Active__c == true){
                    con.addError('Cannot delete Active contact');
                }  
            }
        }
        if(Trigger.IsAfter){
            // Logic to update contact count on parent account.
            for(Contact con : Trigger.old){ //Tried Trigger.New and didn't work either
                AccountMap.put(Con.AccountId,con);
                AccountIdFromContactAfterDel.add(con.AccountId);
            }
            
            integer NoOfContacts3 = [SELECT COUNT() FROM Contact WHERE AccountId IN : AccountIdFromContactAfterDel];
            system.debug('@@@==> Number Of Contacts ' + NoOfContacts3); 
            
            for(Account a : [SELECT Id,Number_Of_Contacts__C FROM Account
                             WHERE Id IN : AccountIdFromContactAfterDel]){
                a.Number_Of_Contacts__c = NoOfContacts3;
                AccListToUpdate.add(a);
            }
            Update AccListToUpdate;
            
/*              for(Contact c : [SELECT Id,Name,AccountId,Account.Number_of_Contacts__c FROM Contact 
                             WHERE  Id IN : AccountIdFromContactAfterDel]){
                                 Contact con = AccountMap.get(c.AccountId);
                                 system.debug('@@@==>  Contact Retrieved '+con);
                                 c.Account.Number_Of_Contacts__c = NoOfContacts3;//AccountContactList.size();
                                 AccListToUpdate.add(c.Account);
                             }
            Update AccListToUpdate; 
*/
        }
        
        //This didn't work, trying new approach above.
        /*(Contact c : [SELECT Id FROM Contact WHERE AccountId IN : AccountIdFromContactAfterDel]){

AccountIdFromContactAfterDel.add(c.AccountId);
c.Account.Number_Of_Contacts__c = NoOfContacts3;
AccListToUpdate.add(c.Account);
Update AccListToUpdate;
}*/
    }
}