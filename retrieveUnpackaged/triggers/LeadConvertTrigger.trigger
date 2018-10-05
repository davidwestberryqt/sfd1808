trigger LeadConvertTrigger on Lead (before update) {
    List<Id> leadIds;
    Set<String> convertedAccIds = new Set<String>();
    
    for(Lead lead : Trigger.new){
        if(lead.isConverted){
            convertedAccIds.add(lead.ConvertedAccountId);
            //lead.TrackingId__c = 'CRM-' + String.valueOf(lead.ConvertedAccountId).substring(15);
        }
    }
    List<Lead> listLead = [select id, TrackingId__c from Lead where ConvertedAccountId in :convertedAccIds];
    
    Map<String,List<Lead>> mapAccountWiseLead = new Map<String,List<Lead>>();
    
    for(Lead l : listLead){
        if(mapAccountWiseLead.containsKey(l.ConvertedAccountId)){
            List<Lead> lstLead = mapAccountWiseLead.get(l.ConvertedAccountId);
            lstLead.add(l);
        }
        else{
            List<Lead> lstLead = new List<Lead>();
            lstLead.add(l);
            mapAccountWiseLead.put(l.ConvertedAccountId, lstLead);
        }
    }    
}