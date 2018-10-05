trigger preventDuplicate on Lead (before insert, before update) {
	// Start by creating a map which stores a list of leads
	// being inserted or updated, using email address as the key
	Map<String, Lead> leadMap = new Map<String, Lead>();
    for(Lead lead : Trigger.new){
        if(lead.Email != null){
            if(Trigger.isInsert || (Trigger.isUpdate && lead.Email != Trigger.oldMap.get(lead.Id).Email)){
                if(leadMap.containsKey(lead.Email)){
                    lead.Email.addError('Another new lead has the same email address.');
                }
                else {
                    leadMap.put(lead.Email, lead);
                }
            }
        }
    }
    
    // Using the lead map, make a database query
    // to find all leads in the database that have
    // the same email address as any of the leads being inserted/updated
    for (Lead l : [SELECT Email FROM Lead WHERE Email IN :leadMap.keySet()]) {
        Lead newLead = leadMap.get(l.Email);
        newLead.Email.addError('A lead with this email address already exists in the system.');
    }
}