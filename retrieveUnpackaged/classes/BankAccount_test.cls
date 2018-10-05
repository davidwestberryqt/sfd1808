@isTest
public class BankAccount_test {
    
    static testMethod void testDeposit(){
        //BankAccount ba = TestDataFactory.CreateBankAccount();
        BankAccount ba = new BankAccount('John Doe', 10000.00);
        ba.deposit(5000.00);
        System.assertEquals(15000.00, ba.getBalance());
    }
    
    static testMethod void testWithdraw(){
        BankAccount ba = TestDataFactory.CreateBankAccount();
        ba.withdraw(5000.00);
        System.assertEquals(5000.00, ba.getBalance());
    }
    
    static testMethod void testGetAccountName(){
        BankAccount ba = TestDataFactory.CreateBankAccount();
        System.assertEquals('Account1', ba.getAccountName());
    }
    
    static testMethod void testGetAccountNumber(){
        BankAccount ba = TestDataFactory.CreateBankAccount();
        ba.getAccountNumber();
        System.assertEquals(ba.getAccountNumber(), ba.getAccountNumber());
    }
    
    static testMethod void testNoWithdraw(){
        BankAccount ba = TestDataFactory.CreateBankAccount();
        try {
            ba.withdraw(15000.00);
        }
        catch(BankAccount.InsufficientFundsException e){
            System.debug(e.getMessage());
           	System.assertEquals(10000.00, ba.getBalance());
        }        
    }
}