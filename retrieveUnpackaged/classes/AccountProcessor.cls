public class AccountProcessor {
	@future
    public static void countContacts(List<Id> acctIds){
        List<Account> accts = new List<Account>([SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :acctIds]);
        for(Account act : accts){
            List<Contact> contacts = new List<Contact>([SELECT Id, AccountId FROM Contact WHERE AccountId = :act.Id]);
            act.Number_Of_Contacts__c = contacts.size();
        }
    }
}