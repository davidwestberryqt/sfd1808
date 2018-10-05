public class QuickLeadEntryControllerExtension {
    private final Lead lead;
    private string searchCriteria;
    private List<Lead> searchResults;
    
    public QuickLeadEntryControllerExtension(ApexPages.StandardController stdController){
        this.lead = (Lead)stdController.getRecord();
    }
    
    public string getSearchCriteria(){
        return searchCriteria;
    }
    
    public void setSearchCriteria(string s){
        this.searchCriteria = s;
    }
    
    public void searchByLastName(){
        List<Lead> leads = new List<Lead>([SELECT Id, LastName, FirstName, Company, Email FROM Lead WHERE LastName = :searchCriteria]);
        this.searchResults = leads;
    }
    
    public List<Lead> getSearchResults(){
        return this.searchResults;
    }
}