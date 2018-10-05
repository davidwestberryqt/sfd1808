public class JobPostingsController {
    private final Position__c position;
    private string[] selectedSites;
    private set<string> selections;

    private List<Employment_Website__c> allWebsites;
    private List<SelectOption> websiteOptions { get; set; }

    public JobPostingsController(){
        string positionId = ApexPages.currentPage().getParameters().get('Id');
        position = String.isEmpty(positionId) ? null : [select Id, Name from Position__c where Id =:positionId Limit 1];
        getAllWebsites();
    }

    public List<Employment_Website__c> getAllWebsites(){
      allWebsites = new List<Employment_Website__c>([select Name, Id from Employment_Website__c]);
      return allWebsites;
    }

    public List<SelectOption> getWebsiteOptions(){
      this.websiteOptions = new List<SelectOption>();
      for(Employment_Website__c site: allWebsites){
          websiteOptions.add(new SelectOption(site.Id, site.Name));
      }
      return this.websiteOptions;
    }

    public void setWebsiteOptions(List<SelectOption> websiteOptions){
      this.websiteOptions = websiteOptions;
    }

    public Position__c getPosition(){
        return position;
    }

    public string[] getSelectedSites(){
        selectedSites = new string[]{};
        selections = new set<string>();

        if(position != null){
            List<Job_Posting__c> postings = new List<Job_Posting__c>([SELECT Employment_Website__r.Id, Employment_Website__r.Name FROM Job_Posting__c WHERE Position__c = :position.Id]);

            for(Job_Posting__c posting : postings){
                selectedSites.add(posting.Employment_Website__r.Id);
                selections.add(posting.Employment_Website__r.Id);
            }
            return selectedSites;
        }
        else{
            return null;
        }
    }

    public void setSelectedSites(string[] selected){
        selectedSites = selected;
    }

    public PageReference save(){
      System.debug('Selected Websites: ' + websiteOptions);

      List<Job_Posting__c> postingsToAdd = new List<Job_Posting__c>();
      for(Integer i = 0; i < selectedSites.size() ; i++){
        if(!selections.contains(selectedSites[i])){
          Job_Posting__c newPosting = new Job_Posting__c();
          newPosting.Position__c = position.Id;
          newPosting.Employment_Website__c = selectedSites[i];
          postingsToAdd.add(newPosting);
        }
      }
      insert postingsToAdd;
      return ApexPages.currentPage();
    }
}