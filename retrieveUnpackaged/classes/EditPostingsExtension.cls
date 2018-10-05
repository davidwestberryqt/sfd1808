public with sharing class EditPostingsExtension {
    
    public Position__c pos {get;set;}
    private List<SelectableSObject> availableEmploymentWebsites;
    private Map<Id, Job_Posting__c> existingPostings;
    
    // The extension constructor initializes the private member
    // variable pos by using the getRecord method from the standard
    // controller.
    public EditPostingsExtension(ApexPages.StandardController stdController) {
        this.pos = (Position__c)stdController.getRecord();
    }
    
    private set<string> getSelectedSites(){
        set<string> selectedSiteIds = new set<string>{};
            existingPostings = new Map<Id, Job_Posting__c>();
        
        List<Job_Posting__c> postings = new List<Job_Posting__c>([select Id, Employment_Website__c, Position__c from Job_Posting__c where Position__c = :pos.Id]);
        for(Job_Posting__c posting: postings){
            selectedSiteIds.add(posting.Employment_Website__c);
            existingPostings.put(posting.Employment_Website__c, posting);
        }
        return selectedSiteIds;
    }
    
    public List<SelectableSObject> getAvailableEmploymentWebsites(){
        this.availableEmploymentWebsites = new List<SelectableSObject>{};
        set<string> selections = getSelectedSites();
        
        for(Employment_Website__c website: [select Id, Name from Employment_Website__c]){
            SelectableSObject selectableWebsite = new SelectableSObject(website);
            
            if(selections.contains(selectableWebsite.getEmploymentWebsite().Id)){
                selectableWebsite.selected = true;
                selectableWebsite.recordExists = true;
            }
            this.availableEmploymentWebsites.add(selectableWebsite);
        }
        
        return this.availableEmploymentWebsites;
    }
    
    public PageReference save(){
        upsert pos;
        List<Employment_Website__c> selectedSites = new List<Employment_Website__c>();
        List<Job_Posting__c> postingsToAdd = new List<Job_Posting__c>();
        List<Job_Posting__c> postingsToDelete = new List<Job_Posting__c>();
        
        for(SelectableSObject site: availableEmploymentWebsites){
            Employment_Website__c siteRecord = site.getEmploymentWebsite();
            if(site.selected && !site.recordExists){
                selectedSites.add(site.getEmploymentWebsite());
                postingsToAdd.add(new Job_Posting__c(Position__c = pos.Id, Employment_Website__c = siteRecord.Id));
            } else if(!site.selected && site.recordExists){
                postingsToDelete.add(existingPostings.get(siteRecord.Id));
            }
        }
        System.debug('Selected Employment Websites ');
        System.debug(selectedSites);
        insert postingsToAdd;
        System.debug('Records To Delete ' + postingsToDelete);
        delete postingsToDelete;
        return ApexPages.currentPage();
    }
}