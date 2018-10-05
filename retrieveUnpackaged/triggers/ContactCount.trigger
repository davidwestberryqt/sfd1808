trigger ContactCount on Contact (after insert, before delete) {
    // After contact has been added, get count of contacts related to account and
    // update Number_Of_Contacts__c field
    if(trigger.isBefore && trigger.isInsert){
        ContactTriggerLogic.CountContacts(trigger.new);
    }    
}