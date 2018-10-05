public class AccountWrapper {
    public Account acct {get; set;}
    public Boolean checkBoxBool {get; set;}
    
    public AccountWrapper(Account a, Boolean bool){
        this.acct = a;
        this.checkBoxBool = bool;
    }
}