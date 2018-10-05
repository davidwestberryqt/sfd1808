trigger preventDeletingActive on Account (before delete, after insert, after update) {
    if(trigger.isDelete){
        for(Account a : trigger.old){
            if(a.Active__c){
                a.addError('You cannot delete an active account');
            }
        }
    }
    
    if(trigger.isInsert){
        for(Account a : trigger.new){
            GoogleAPI.getGeoLatlongFromAddress(a.Id);
        }
    }
    
    if(trigger.isUpdate){
        for(Account a : trigger.new){
            System.debug('Debugging from preventDeletingActive isUpdate');
            System.debug(a);
            Account oldA = trigger.oldMap.get(a.Id);
            System.debug(oldA);
            if((a.BillingStreet != oldA.BillingStreet) || (a.BillingCity != oldA.BillingCity) || (a.BillingState != oldA.BillingState) || (a.BillingPostalCode != oldA.BillingPostalCode)){
                System.debug('Address has changed');
                GoogleAPI.getGeoLatlongFromAddress(a.Id);
            }
        }
    }
}