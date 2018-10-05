@IsTest
public class ReviewTriggerTest {
    
    @testSetup static void setup(){
        Candidate__c c = new Candidate__c();
        c.First_Name__c = 'John';
        c.Last_Name__c = 'Doe';
        insert c;
        
        Job_Application__c ja = new Job_Application__c();
        ja.Candidate__c = c.Id;
        insert ja;
    }
    
    static testmethod void testAfterInsertHandler(){
        Job_Application__c ja = [SELECT Id FROM Job_Application__c LIMIT 1];
        
        Review__c r = new Review__c();
        r.Job_Application__c = ja.Id;
        r.Assessment__c = 'Testing the Trigger';
        r.Rating__c = 5;
        
        List<Review__c> reviews = new List<Review__c>();
        reviews.add(r);
        
        ReviewTriggerhandler.handleAfterInsert(reviews);
        
        Candidate__c testCandidate = [SELECT Latest_Assessment__c FROM Candidate__c WHERE First_Name__c = 'John' LIMIT 1];
        
        System.assertEquals('Testing the Trigger', testCandidate.Latest_Assessment__c);
    }
    
    static testmethod void testAfterInsertTrigger(){
        Job_Application__c ja = [SELECT Id FROM Job_Application__c LIMIT 1];
        
        Review__c r = new Review__c();
        r.Job_Application__c = ja.Id;
        r.Assessment__c = 'Testing the Trigger';
        r.Rating__c = 5;
        insert r;
        
        Candidate__c testCandidate = [SELECT Latest_Assessment__c FROM Candidate__c WHERE First_Name__c = 'John' LIMIT 1];
        
        System.assertEquals('Testing the Trigger', testCandidate.Latest_Assessment__c);
    }
    
}