public class VerifyRecruitingApp {
	public static Boolean appExists = false;
    public static Boolean positionExists = false;
    public static Boolean candidateExists = false;
    public static Boolean jobApplicationExists = false;
    public static Boolean reviewExists = false;
    public static Boolean employmentWebsiteExists = false;
    
    public static List<String> sObjectTypes = new String[]{'position__c', 'candidate__c', 'job_application__c', 'review__c', 'employment_website__c'};
    
    public static Boolean appCreated(){
        return true;
    }
    
    public static Boolean objectsCreated(){
        List<Schema.DescribeSObjectResult> results = Schema.describeSObjects(sObjectTypes);
        
        Iterator<Schema.DescribeSObjectResult> iter = results.iterator();
        while(iter.hasNext()){
            Schema.DescribeSObjectResult res = iter.next();
            
            if(positionExists && candidateExists && jobApplicationExists && reviewExists && employmentWebsiteExists){
                break;
            }
            if(res.getName() == 'position__c'){
                positionExists = true;
            }
            if(res.getName() == 'candidate__c'){
                candidateExists = true;
            }
            if(res.getName() == 'job_application__c'){
                jobApplicationExists = true;
            }
            if(res.getName() == 'review__c'){
                reviewExists = true;
            }
            if(res.getName() == 'employment_website__c'){
                employmentWebsiteExists = true;
            }
        }
        return (positionExists && candidateExists && jobApplicationExists && reviewExists && employmentWebsiteExists);
    }
}