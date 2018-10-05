public class ReviewTriggerHandler {
    
    public static void handleAfterInsert(List<Review__c> newReviews){
        Set<Id> applicationIds = new Set<Id>();
        List<Candidate__c> candidates = new List<Candidate__c>();
        
        for(Review__c r : newReviews){
            applicationIds.add(r.Job_Application__c);
        }
     
        Map<Id, Job_Application__c> idToApplication = new Map<Id, Job_Application__c>([SELECT Candidate__c FROM Job_Application__c WHERE Id IN :applicationIds]);
        
        for(Review__c r : newReviews){
            Job_Application__c ja = idToApplication.get(r.Job_Application__c);
            Candidate__c c = new Candidate__c();
            c.Id = ja.Candidate__c;
            c.Latest_Assessment__c = r.Assessment__c;
            candidates.add(c);
        }
        
        update candidates;
    }
    
}