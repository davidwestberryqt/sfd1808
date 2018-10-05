public class MyPageExtension {
    public Account account {get; set;}
    public Contact contact {get;set;}
    
    public MyPageExtension(ApexPages.StandardController controller){
        account = (Account) controller.getRecord();
        contact = new Contact();
    }
    
    public PageReference saveContact(){
        contact.AccountId = account.id;
        Database.insert(contact);
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,'Contact Saved Successfully'));
        return ApexPages.currentPage();
    }
}