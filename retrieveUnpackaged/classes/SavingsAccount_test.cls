@isTest
public class SavingsAccount_test {
    static testMethod void testWithdrawNotAllowedMessage(){
        SavingsAccount sa = new SavingsAccount('Savings1', 10000.00);
        try {
            sa.withdraw(5000.00);
        } catch(SavingsAccount.InvalidActionException ex){
            System.assertEquals('Withdraw is not allowed from Savings Accounts', ex.getMessage());
        }
    }
}