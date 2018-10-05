public class CheckRecruitingAppUtility {
	public static final List<string> positionFields = new String[]{
            'job_description__c', 
            'responsibilities__c', 
            'skills_required__c', 
            'educational_requirements__c', 
            'max_pay__c', 
            'min_pay__c', 
            'travel_required__c',
            'java__c',
            'javascript__c',
            'c_sharp__c',
            'apex__c',
            'open_date__c',
            'hire_by__c',
            'close_date__c',
            'status__c',
            'type__c',
            'functional_area__c',
            'job_level__c',
            'hiring_manager__c',
            'location__c'
    };
    public static final List<string> candidateFields = new String[]{
        'first_name__c',
        'last_name__c',
        'phone__c',
        'email__c',
        'street__c',
        'city__c',
        'state_province__c',
        'zip__c',
        'country__c',
        'current_employer__c',
        'years_of_experience__c',
        'ssn__c',
        'currently_employed__c',
        'us_citizen__c',
        'visa_required__c',
        'mobile__c',
        'fax__c'
    };
    public static final List<String> jobApplicationFields = new String[]{
        'cover_letter__c',
        'status__c',
        'candidate__c',
        'position__c'
    };
    
    public static final List<String> reviewFields = new String[]{
        'assessment__c',
        'rating__c',
        'job_application__c',
        'position__c',
        'candidate__c'
    };
        
    public static final List<String> employmentWebsiteFields = new String[]{
        'web_address__c',
        'price_per_post__c',
        'maximum_budget__c'
    };
    
	public static final Map<String, List<String>> objectToFieldsMap = new Map<String, List<String>>{
        'position__c' => positionFields,
        'candidate__c' => candidateFields,
        'job_application__c' => jobApplicationFields,
        'review__c' => reviewFields,
        'employment_website__c' => employmentWebsiteFields
    };
}