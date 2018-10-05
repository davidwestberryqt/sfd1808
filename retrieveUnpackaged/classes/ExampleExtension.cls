public class ExampleExtension {
    
    public string something{get; set;}
    public List<Contact> contacts{get; set;}
    
    public ExampleExtension(ApexPages.StandardController controller) {
        Account acct = (Account) controller.getRecord();
        contacts = [SELECT Name FROM Contact];
        
        something = ApexPages.currentPage().getParameters().get('something');
    } 
    
    
}