public class ExtensionExample {
    Private Position__c position;
    Private List<Employment_Website__c> employmentWebsites;
    
    public PositionWithWebsites pww { get; set; }
    private ApexPages.StandardController ctrl;
    
    public ExtensionExample(ApexPages.StandardController controller){
        ctrl = controller;
        pww = new PositionWithWebsites((Position__c) controller.getRecord());
        
        position = pww.position;
        employmentWebsites = pww.websites;
    }
    
    public List<Employment_Website__c> getEmploymentWebsites(){
        return pww.websites;
    }
    
    public void setEmploymentWebsites(Employment_Website__c value){
        pww.addWebsite(value);
    }
    
    public Position__c getPosition(){
        return pww.position;
    }
    
    public void setPosition(Position__c pos){
        pww.position = pos;
    }
    
    public class PositionWithWebsites {
        public Position__c position;
        public List<Employment_Website__c> websites;
        
        public PositionWithWebsites(Position__c pos){
            position = pos;
            if(position.Id != null){
                websites = [SELECT Id, Name, Web_Address__c, Maximum_Budget__c 
                            FROM Employment_Website__c 
                            WHERE Id IN (
                                SELECT Employment_Website__c 
                                FROM Job_Posting__c
                                WHERE Position__c =:position.Id
                            )];
            }
            else {
                websites = new List<Employment_Website__c>();
            }
        }
        
        public void addWebsite(Employment_Website__c site){
            websites.add(site);
        }
        
        public void addWebsite(String siteId){
            websites.add([SELECT Name FROM Employment_Website__c WHERE Id =:siteId LIMIT 1]);
        }
    }
}