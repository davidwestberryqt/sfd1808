trigger LeadTrigger on Lead (before insert, before delete) {
    new LeadTriggerHandler().run();
}