trigger JobApplicationTrigger on Job_Application__c (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        JobApplicationTriggerHandler.sendEmployeeData();
    }
}