@IsTest
public class Employee_test {
    
    public static testmethod void testEmployeeCreation(){
        Employee emp = TestDataFactory.createEmployee();
        System.assertEquals('John Doe', emp.getFullName());
    }
    
    public static testmethod void testGiveEmployeeRaise(){
        Employee emp = new Employee('John', 'Doe', '123-45-7896', 33, 22.50);
        System.assertEquals('22.50', emp.getHourlyRate());
        
        emp.giveRaise(.10);
        System.assertEquals(String.valueOf(22.50 + (22.50 * .10)), emp.getHourlyRate());
    }
    
    public static testMethod void testCandidateSearch(){
        Candidate__c cand = new Candidate__c();
        cand.First_Name__c = 'Test';
        cand.Last_Name__c = 'Candidate';
        cand.Phone__c = '555-123-4567';
        
        insert cand;
        
        test.startTest();
        
        List<Candidate__c> results = Employee.candidateSearch('Test');
        
        test.stopTest();
        
        System.assertEquals(1, results.size());
    }
    
}