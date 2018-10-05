public with sharing class PositionWizardController {

    public PageReference checkboxTest() {
        System.debug(selected);
        System.debug(allEmploymentWebsites);
        return null;
    }


    Position__c position;
    Job_Posting__c jobPosting;
    public List<Employment_Website__c> selectedWebsitesList;
    
    public SelectOption[] allEmploymentWebsites { get; set; }
    public SelectOption[] selectedEmploymentWebsites { get; set; }
    public String[] selected { get; set; }
    
    public List<WebsiteWrapper> selectableWebsites { get; set; }
    
    public PositionWizardController(){
        selectedEmploymentWebsites = new List<SelectOption>();
        
        List<Employment_Website__c> sites = [SELECT Id, Name FROM Employment_Website__c];
        allEmploymentWebsites = new List<SelectOption>();
        for(Employment_Website__c ew : sites){
            allEmploymentWebsites.add(new SelectOption(ew.Id, ew.Name));
        }
        
        selectableWebsites = new List<WebsiteWrapper>();
        for(Employment_Website__c site : sites){
            selectableWebsites.add(new WebsiteWrapper(site));
        }
    }
    
    public Position__c getPosition(){
        if(position == null) position = new Position__c();
        return position;
    }
    
    public void setPosition(Position__c value){
        position = value;
    }
    
    public Job_Posting__C getJobPosting(){
        if(jobPosting == null) jobPosting = new Job_Posting__c();
        return jobPosting;
    }
    
    public PageReference step1() {
        return Page.positionStep1;
    }    
    
    public PageReference step2() {
        return Page.positionStep2;
    }
    
    
    public PageReference step3() {
        return Page.positionStep3;
    }
    
    public PageReference cancel() {
        PageReference positionPage = new PageReference('/home/home.jsp');
        positionPage.setRedirect(true);
        return positionPage;
    }
    
    public PageReference save() {
        // Create the Position__c record.
        insert position;
        
        // Create the Job_Posting__c records. Loop through all Employment_Website__c records in
        // selectedWebsitesList and create a Job_Posting__c record related to each Employment_Website__c
        // and the Position__c created above. Insert the list of Job_Posting__c records into the database
        List<Job_Posting__c> postingsToInsert = new List<Job_Posting__c>();
        //for(Employment_Website__c ew : getSelectedWebsitesList()){
        //    Job_Posting__c jp = new Job_Posting__c(Position__c = position.Id, Employment_Website__c = ew.Id);
        //    postingsToInsert.add(jp);
        //}
        for(WebsiteWrapper w : selectableWebsites){
            if(w.selected){
                Job_Posting__c jp = new Job_Posting__c(Position__c = position.Id, Employment_Website__c = w.employment_website.Id);
                postingsToInsert.add(jp);
            }
        }
        insert postingsToInsert;
        
        // Finally, send the user to the detail page for the 
        // new Position__c
        PageReference positionPage = new ApexPages.StandardController(position).view();
        positionPage.setRedirect(true);
        
        return positionPage;
    }
    
    public List<Employment_Website__C> getSelectedWebsitesList(){
        debug(selectedEmploymentWebsites);
        List<Employment_Website__c> ew = new List<Employment_Website__c>();
        for(SelectOption so : selectedEmploymentWebsites){
            system.debug(so);
                ew.add(new Employment_Website__c(Id=so.getValue(), name=so.getLabel()));           
        }
        return ew;
    }
    
    public List<String> getPositionFields(){
        List<String> objTypes = new List<String>{'Position__c'};
            List<String> editableFields = new List<String>();
        
        Schema.DescribeSObjectResult result = schema.describeSObjects(objTypes)[0];
        Map<String, Schema.SObjectField> M;
        M = result.fields.getMap();
        
        for(String fld : M.keySet()){
            Schema.SObjectField field = M.get(fld);
            if(field.getDescribe().isUpdateable()){
                editableFields.add(field.getDescribe().getName());
            }
        }
        
        return editableFields;
    }
    
    private void debug(object message){
        PageReference currentPage = ApexPages.currentPage();
        System.debug('DEBUG STATEMENT FROM ' + currentPage.getUrl());
        System.debug(message);
    }
    
    public class WebsiteWrapper {
        public Employment_Website__c employment_website { get; set; }
        public Boolean selected { get; set; }
        
        public WebsiteWrapper(Employment_Website__c ew){
            employment_website = ew;
        }       
    }
}