trigger LeadTrackingTrigger on Lead (before insert) {
    String sys = 'CRM'; // This will change in the future based on the system that generated the lead
    Map<String, Integer> accountNumberToCount = new Map<String, Integer>();
    
    for(Lead l : trigger.new){
        String a = l.Customer_Account_Number__c;
        Integer currentCount = 1;
        
        if(accountNumberToCount.keySet().contains(a)){
            currentCount = accountNumberToCount.get(a);
        } else {
            LeadTracking__c lt = LeadTracking__c.getInstance(a);
            if(lt != null){
                currentCount = Integer.valueOf(lt.runningCount__c);
            }
        }
        
        // Convert the current count into a string with leading zeroes like '00001'
        String count = currentCount.format();
        String paddedCount = count.leftPad(5, '0');
        l.TrackingId__c = sys + '-' + a + '-' + paddedCount;
        
        // Increment the count for the account number
        accountNumberToCount.put(a, currentCount + 1);
    }
    
    List<LeadTracking__c> toUpdate = new List<LeadTracking__c>();
    for(String acctNum : accountNumberToCount.keySet()){
        LeadTracking__c ltr = LeadTracking__c.getInstance(acctNum);
        if(ltr != null){
            ltr.runningCount__c = accountNumberToCount.get(acctNum);
        } else {
            ltr = new LeadTracking__c(Name = acctNum, runningCount__c = accountNumberToCount.get(acctNum));
        }
        
        toUpdate.add(ltr);
    }
    
    upsert(toUpdate);
}