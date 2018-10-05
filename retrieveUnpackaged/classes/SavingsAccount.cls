public class SavingsAccount extends BankAccount {
    public SavingsAccount(string name, decimal balance){
 		super(name, balance);
    }
    public override double withdraw(decimal amount){
        throw new InvalidActionException('Withdraw is not allowed from Savings Accounts');
        //return this.balance;
    }
    
    public class InvalidActionException extends Exception {
        
    }
}