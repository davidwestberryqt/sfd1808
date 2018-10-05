public class acctTriggerUtil {
    public static void deleteTrigger(List<Account> accountList){
        for(Account acc : accountList){
            if(acc.Active__c){
                acc.addError('Cannot delete active user');
            }
        }
    }
}