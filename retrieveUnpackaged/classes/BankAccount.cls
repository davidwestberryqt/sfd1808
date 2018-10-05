public virtual class BankAccount {
    // private member properties
    protected double balance;
    private integer accountNumber;
    private string name;
    
    // constructor
    public BankAccount(string name, decimal balance){
        this.name = name;
        this.balance = balance;
        this.accountNumber = Crypto.getRandomInteger();
        if(this.accountNumber < 1){
            this.accountNumber = this.accountNumber * -1;
        }
    }
    
    // Getters and Setters
    public double getBalance(){
        return this.balance;
    }
    
    public integer getAccountNumber(){
        return this.accountNumber;
    }
    
    public string getAccountName(){
        return this.name;
    }
    
    public virtual double withdraw(decimal amount){
        if(amount <= this.balance){
            this.balance -= amount;
            System.debug('Withdrawal of $' + amount + ' successful.');
        } else {
            throw new InsufficientFundsException('Insufficient Funds Error: Attempt to withdraw $' + amount + ' failed. Balance available is $' + this.balance);
        }
        return this.balance;
    }
    
    public double deposit(decimal amount){
        this.balance += amount;
        System.debug('Deposit of $' + amount + ' successfully posted');
        return this.balance;
    }
    
    public double transfer(BankAccount account, decimal amount){

        account.deposit(amount);
        this.balance -= amount;
        System.debug('Transfer of $' + amount + ' to account number' + account.getAccountNumber() + ' successfully processed.');
        System.debug('New Balances\n' + account.getAccountNumber() + ' - $' + account.getBalance() + ' | ' + this.accountNumber + ' - $' + this.balance);
        return this.balance;
    }
    
    public class InsufficientFundsException extends Exception {

    }
}