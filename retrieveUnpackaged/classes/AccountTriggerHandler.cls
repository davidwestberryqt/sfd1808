public class AccountTriggerHandler extends TriggerHandler {
    
    public override void beforeDelete()
    {
        for(Account acc : (List<Account>) trigger.old)
        {
            if(acc.Active__c)
            {
                acc.addError('Cannot delete active user');
            }
        }
    }    
}