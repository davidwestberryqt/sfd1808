@isTest
public class preventDeletingActive_test {
    @isTest static void TestDeleteActiveAccount(){
        Account[] accts = TestDataFactory.createActiveAccounts(151);
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false);
        Test.stopTest();
        
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('You cannot delete an active account', result.getErrors()[0].getMessage());
    }
    
    @isTest static void TestDeleteInactiveAccount(){
        Account[] accts = TestDataFactory.createInactiveAccounts(151);
        
        Test.startTest();
        Database.DeleteResult result = Database.delete(accts[0], false);
        Test.stopTest();
        
        System.assert(result.isSuccess());
    }
}