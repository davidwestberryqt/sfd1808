public class ContactTriggerLogic {

    public static void CountContacts(List<Contact> triggernew){
        Set<Id> accountIds = new Set<Id>();
        
        for(Contact con : triggernew){
            accountIds.add(con.AccountId);
        }
        
        List<Contact> contacts = new List<Contact>([SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds]);
        
        Map<Id, Integer> AccountIdAndContactList = new Map<Id, Integer>();
        
        for(Contact c : contacts){
            if(AccountIdAndContactList.keySet().contains(c.AccountId)){
                Integer count = AccountIdAndContactList.get(c.AccountId);
                AccountIdAndContactList.put(c.AccountId, count + 1);
            }
            else{
                AccountIdAndContactList.put(c.AccountId, 1);
            }
        }
        
        List<Account> accToUpdate = new List<Account>();
        for(Id n : AccountIdAndContactList.keySet()){
            Account a = new Account();
            a.Id = n;
            a.Number_Of_Contacts__c = AccountIdAndContactList.get(n);
            accToUpdate.add(a);
        }
        
        update accToUpdate;
    }
}