@isTest
public class TestDataFactory {
    
    public static BankAccount CreateBankAccount(){
        BankAccount ba = new BankAccount('Account1', 10000.00);
        return ba;
    }
    
    public static List<BankAccount> createBankAccounts(Integer numAccts){
        List<BankAccount> accounts = new List<BankAccount>();
        for (Integer i=0; i<numAccts; i++){
            accounts.add(new BankAccount('Account ' + i, 10000));
        }
        return accounts;
    }
    
    private static List<Account> createAccounts(Integer numAccts, Boolean active){
        List<Account> accts = new List<Account>();
        for (Integer i=0; i<numAccts; i++){
            Account a = new Account(Name='Test Account ' + i, Active__c=active);
            accts.add(a);
        }
        insert accts;
        
        return accts;
    }
    
    public static List<Account> createActiveAccounts(Integer numAccts){
        return createAccounts(numAccts, true);
    }
    
    public static List<Account> createInactiveAccounts(Integer numAccts){
        return createAccounts(numAccts, false);
    }
    
    public static Employee createEmployee(){
        Employee emp = new Employee('John', 'Doe', '123-45-7896', 33, 22.50);
        return emp;
    }
}