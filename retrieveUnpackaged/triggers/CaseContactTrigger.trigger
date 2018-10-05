trigger CaseContactTrigger on Case (before insert) {
    SET<String> caseEmails = new SET<String>();
    for(Case cs : Trigger.new){
        caseEmails.add(cs.ContactEmail);
    }
    
    Map<String, Contact> contacts = new Map<String, Contact>([select Email, Id from Contact where email in :caseEmails]);
    for(Case cas : Trigger.new){
        Contact con = contacts.get(cas.ContactEmail);
        cas.ContactId = con.Id;
    }
}