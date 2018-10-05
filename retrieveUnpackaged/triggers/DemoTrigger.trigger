trigger DemoTrigger on Account (before insert, before update, after insert, after update, before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        for(Account a : Trigger.old){
            if(a.Active__c){
                a.addError('You cannot delete an Active Account');
            }
        }        
    }
}