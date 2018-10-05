public with sharing class AccountSearch {
    private final Account acct;
    private String searchText;
    public String searchInput {get; set;}
    
    public AccountSearch(ApexPages.StandardSetController controller){
        this.acct = (Account)controller.getRecord();
    }
    
    public ApexPages.StandardSetController accountRecords{
        get{            
            if(searchText != null){
                accountRecords = new ApexPages.StandardSetController(
                    Database.getQueryLocator([SELECT Name, BillingCity, Phone FROM Account WHERE Name LIKE :searchText]));
            }           
            if(accountRecords == null){                
                accountRecords = new ApexPages.StandardSetController(
                    Database.getQueryLocator([SELECT Name, BillingCity, Phone FROM Account]));                
            }
            return accountRecords;
        }
        private set;
    }
    
    
    
    public List<Account> getAccountSearch() {
        return (List<Account>) accountRecords.getRecords();
    }
    
    public PageReference search(){
        searchText = '%' + searchInput + '%';
        getAccountSearch();
        return null;
    }    
}