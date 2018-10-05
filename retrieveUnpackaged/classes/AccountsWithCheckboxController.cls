public class AccountsWithCheckboxController {
    public List<AccountWrapper> accountsWithCheckBoxes {get; set;}
    
    public AccountsWithCheckboxController(){
        accountsWithCheckBoxes = new List<AccountWrapper>();
        
        for(Account a : [SELECT Name FROM Account]){
            Boolean hasName = String.isNotBlank(a.Name);
            accountsWithCheckBoxes.add(new AccountWrapper(a, hasName));
        }
    }
    
    public class AccountWrapper {
    public Account acct {get; set;}
    public Boolean checkBoxBool {get; set;}
    
    public AccountWrapper(Account a, Boolean bool){
        this.acct = a;
        this.checkBoxBool = bool;
    }
}
    
}